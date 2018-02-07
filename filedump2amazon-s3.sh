#!/bin/sh

# BEGIN EDIT

TMP_PATH=~/
BACKUP_NAME=backup_name
S3_BUCKET=bucket_name
S3_PATH=path_on_s3_bucket


# no trailing slash !!!!
WEB_ROOT=/path/to/web/root

# END EDIT

BACKUP_FILE=${TMP_PATH}${BACKUP_NAME}$(date +"_%d-%m-%Y_%H:%M:%S").tar.gz

echo "Doing ${BACKUP_NAME}"

tar -zcvpmf ${BACKUP_FILE} ${WEB_ROOT}

echo "Backup file ${BACKUP_FILE} created"

echo "Putting files into Amazon S3 in s3://${S3_BUCKET}/${S3_PATH}/"

s3cmd put -f ${BACKUP_FILE} s3://${S3_BUCKET}/${S3_PATH}/

echo "Remove ${BACKUP_FILE}"

rm -f ${BACKUP_FILE}

echo "Backup removed"