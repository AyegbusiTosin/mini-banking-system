import os
from logger import log_event
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="bank_user",
    password=os.getenv("DB_PASSWORD"),
    database="bank_db"
)

cursor = conn.cursor()

sender = input("Enter sender account: ").strip().upper().replace(" "," ")
receiver = input("Enter receiver account: ").strip().upper().replace(" "," ")
amount = float(input("Enter amount to transfer: "))

try:
    conn.start_transaction()

    # Step 1: Deduct from sender (with safety check)
    deduct_query = """
    UPDATE accounts
    SET balance = balance - %s
    WHERE account_number = %s AND balance >= %s
    """
    cursor.execute(deduct_query, (amount, sender, amount))

    if cursor.rowcount == 0:
        raise Exception("❌ Transfer failed: insufficient funds or sender not found")

    # Step 2: Add to receiver
    add_query = """
    UPDATE accounts
    SET balance = balance + %s
    WHERE account_number = %s
    """
    cursor.execute(add_query, (amount, receiver))

    if cursor.rowcount == 0:
        raise Exception("❌ Transfer failed: receiver not found")

    # Step 3: Log transactions
    log_out = """
    INSERT INTO transactions (account_number, type, amount)
    VALUES (%s, 'transfer_out', %s)
    """
    cursor.execute(log_out, (sender, amount))

    log_in = """
    INSERT INTO transactions (account_number, type, amount)
    VALUES (%s, 'transfer_in', %s)
    """
    cursor.execute(log_in, (receiver, amount))

    conn.commit()
    print("✅ Transfer successful!") 

    # ✅ LOG SUCCESS
    log_event("TRANSFER_OUT", sender, "SUCCESS", f"{amount} sent to {receiver}")
    log_event("TRANSFER_IN", receiver, "SUCCESS", f"{amount} received from {sender}")    



except Exception as e:
    conn.rollback()
    print(e)

    log_event("TRANSFER", sender, "FAILED", str(e))

finally:
    cursor.close()
    conn.close()

