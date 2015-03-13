#!/bin/sh

# BEGIN EDIT

DB_USER="root"
DB_PASSWORD='password'
DB_NAME=--all-databases
TMP_PATH=~/
BACKUP_NAME=backup
S3_BUCKET=bucket
S3_PATH=folder

# END EDIT

BACKUP_FILE=${TMP_PATH}${BACKUP_NAME}$(date +"_%d-%m-%Y_%H:%M:%S").sql.gz

echo "Dump database ${DB_NAME}"

mysqldump --user=${DB_USER} -p${DB_PASSWORD} ${DB_NAME} | gzip > ${BACKUP_FILE}

echo "Backup file ${BACKUP_FILE} created"

echo "Put file into Amazon S3 in s3://${S3_BUCKET}/${S3_PATH}/"

s3cmd put -f ${BACKUP_FILE} s3://${S3_BUCKET}/${S3_PATH}/

echo "Remove ${BACKUP_FILE}"

rm -f ${BACKUP_FILE}

echo "Backup removed"
