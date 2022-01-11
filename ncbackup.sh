#!/bin/bash
set -e
set -u
set -o pipefail

export B2_ACCOUNT_ID=
export B2_ACCOUNT_KEY=
export RESTIC_PASSWORD=
export RESTIC_REPOSITORY=b2:
sql_host=localhost
sql_user=
sql_pw=
sql_db=

echo $sql_host
# set nextcloud to maintenance mode
echo "Set maintenance mode on"
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --on

# mysqldump
echo "Create Mysqldump"
mysqldump --single-transaction -h $sql_host -u $sql_user -p$sql_pw $sql_db > /home/sql-backup/nextcloud_sqldump.sql
restic --tag SQL-Backup --verbose backup /home/sql-backup --option b2.connections=50

# backup www directory
echo "Backup www directory"
restic --tag www-Backup --verbose backup /var/www/nextcloud/ --option b2.connections=50

# backup data directory
echo "Backup Data directory"
restic --tag Data-Backup --verbose backup /home/data/ --option b2.connections=50

# turn maintenance mode off
echo "maintenance mode off"
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --off

# just keep the 7 latest snapshots
echo "Lifecycle management"
restic forget --keep-last 7 --option b2.connections=50

# generate new Index
echo "Generate new Index"
restic prune --option b2.connections=50
restic unlock

