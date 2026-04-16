import mysql.connector

try:
    conn = mysql.connector.connect(
        host="localhost",
        user="bank_user",
        password="StrongPass123",
        database="bank_db"
    )

    print("✅ Connected to database successfully!")

    conn.close()

except mysql.connector.Error as err:
    print(f"❌ Error: {err}")
