from datetime import datetime

LOG_FILE = "/opt/bank_app/logs/bank.log"

def log_event(action, account, status, message=""):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    log_entry = f"{timestamp} | {action} | {account} | {status} | {message}\n"

    with open(LOG_FILE, "a") as f:
        f.write(log_entry)
