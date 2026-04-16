#  Mini Core Banking System

A Linux-based backend banking system built using Python and MySQL, designed to simulate real-world financial operations with transaction safety, logging, and automated backups.

---

##  Overview

This project implements core banking functionalities such as account management, deposits, withdrawals, and inter-account transfers, while ensuring data integrity using database transactions.

It was built as a hands-on approach to understanding backend systems, Linux environments, and how real financial systems maintain reliability.

---

##  Features

* 🧾 Account creation
* 💰 Deposit and withdrawal operations
* 🔁 Inter-account transfers
* 🔒 Transaction safety using COMMIT / ROLLBACK
* 📝 Logging system for audit trails
* 💾 Automated database and log backups
* 🔄 Data recovery using backup restore

---

##  Key Concepts Demonstrated

* ACID-compliant transactions
* Database schema design (accounts & transactions)
* Linux file permissions and ownership management
* Shell scripting for automation (cron jobs)
* Logging and system observability
* Debugging across multiple system layers

---

##  Project Structure

```bash
bank_app/
│
├── app/                # Python application logic
│   ├── create_account.py
│   ├── deposit.py
│   ├── withdraw.py
│   ├── transfer.py
│   └── logger.py
│
├── scripts/            # Automation scripts
│   └── backup.sh
│
├── logs/               # Log files
├── backups/            # Backup storage
```

---

##  How to Run

### 1. Create Account

```bash
python3 app/create_account.py
```

### 2. Deposit

```bash
python3 app/deposit.py
```

### 3. Withdraw

```bash
python3 app/withdraw.py
```

### 4. Transfer

```bash
python3 app/transfer.py
```

---

##  Backup System

Run manual backup:

```bash
/opt/bank_app/scripts/backup.sh
```

Or schedule using cron:

```bash
0 2 * * * /opt/bank_app/scripts/backup.sh
```

---

## Restore from Backup

```bash
mysql -u bank_user -p bank_db < backup_file.sql
```

---

##  Tech Stack

* Python
* MySQL (MariaDB)
* Linux (Amazon Linux)
* Bash scripting


## Environment Configuration

This project uses environment variables to securely manage database credentials.

Before running the application, set the following variable:

```bash
export DB_PASSWORD="your_database_password"
```

To make it persistent:

```bash
nano ~/.bashrc
```

Add:

```bash
export DB_PASSWORD="your_database_password"
```

Then apply:

```bash
source ~/.bashrc
```



## Security Note

Database credentials are not stored in the source code.
Environment variables are used instead to follow secure development practices.


---

## 📌 Motivation

This project was built to move beyond theoretical learning by implementing a system that reflects how backend services operate in real-world environments, particularly in the financial domain.

---

## 🚀 Future Improvements

* REST API layer (Flask)
* Authentication system
* Improved logging structure (JSON/log levels)
* Web-based interface
* Secure credential management using environment variables or secret managers

---
