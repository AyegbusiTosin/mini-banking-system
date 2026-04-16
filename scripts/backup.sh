
#!/bin/bash

BACKUP_DIR="/opt/bank_app/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

DB_NAME="bank_db"
DB_USER="bank_user"

# Backup database
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/db_$TIMESTAMP.sql

# Backup logs
cp /opt/bank_app/logs/bank.log $BACKUP_DIR/log_$TIMESTAMP.log

echo "Backup completed at $TIMESTAMP"
