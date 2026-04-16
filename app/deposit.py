import os
from logger import log_event
import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="bank_user",
    password= os.getenv("DB_PASSWORD"),
    database="bank_db"
)

cursor = conn.cursor()

account_number = input("Enter account number: ").strip().upper().replace("","")
amount = float(input("Enter amount to deposit: "))

try:
    # Start transaction
    conn.start_transaction()

    # Update balance
    update_query = """
    UPDATE accounts
    SET balance = balance + %s
    WHERE account_number = %s
    """
    cursor.execute(update_query, (amount, account_number))

    # Check if account exists
    if cursor.rowcount == 0:
        raise Exception("Account not found!")

    # Log transaction
    insert_query = """
    INSERT INTO transactions (account_number, type, amount)
    VALUES (%s, 'deposit', %s)
    """
    cursor.execute(insert_query, (account_number, amount))

    # Commit
    conn.commit()
    print("✅ Deposit successful!")
    log_event("DEPOSIT", account_number, "SUCCESS", f"{amount} deposited")


except Exception as e:
    conn.rollback()
    print(f"❌ Error: {e}")

    log_event("DEPOSIT", account_number, "FAILED", str(e))

finally:
    cursor.close()
    conn.close()

