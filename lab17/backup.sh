#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$HOME/postgres_backups"
DB_NAME="lab17_backup"
DB_USER="nurizaesenbaeva"

mkdir -p "$BACKUP_DIR"

pg_dump -U "$DB_USER" -d "$DB_NAME" -Fc \
  -f "$BACKUP_DIR/${DB_NAME}_${DATE}.dump"

# Keep only last 7 days of backups
find "$BACKUP_DIR" -name "${DB_NAME}_*.dump" -mtime +7 -delete
