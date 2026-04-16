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
amount = float(input("Enter amount to withdraw: "))

try:
    conn.start_transaction()

    # Attempt safe withdrawal
    update_query = """
    UPDATE accounts
    SET balance = balance - %s
    WHERE account_number = %s AND balance >= %s
    """
    cursor.execute(update_query, (amount, account_number, amount))

    # Check if withdrawal succeeded
    if cursor.rowcount == 0:
        raise Exception("❌ Insufficient funds or account not found")

    # Log transaction
    insert_query = """
    INSERT INTO transactions (account_number, type, amount)
    VALUES (%s, 'withdrawal', %s)
    """
    cursor.execute(insert_query, (account_number, amount))

    conn.commit()
    print("✅ Withdrawal successful!")
    log_event("WITHDRAWAL", account_number, "SUCCESSFUL", f" {amount} withdrawn")



except Exception as e:
    conn.rollback()
    print(e)
    log_event("WITHDRAWAL". account_number, "FAILED", f"{amount} ")

finally:
    cursor.close()
    conn.close()
