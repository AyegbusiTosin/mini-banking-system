import os
import mysql.connector
import random

# Connect to database
conn = mysql.connector.connect(
    host="localhost",
    user="bank_user",
    password= os.getenv("DB_PASSWORD"),
    database="bank_db"
)

cursor = conn.cursor()

# Get user input
name = input("Enter account holder name: ")

# Generate account number
account_number = "ACC" + str(random.randint(1000, 9999))

# Insert into database
query = "INSERT INTO accounts (account_number, name, balance) VALUES (%s, %s, %s)"
values = (account_number, name, 0.00)

cursor.execute(query, values)
conn.commit()

print(f"✅ Account created successfully! Account Number: {account_number}")

# Close connection
cursor.close()
conn.close()
