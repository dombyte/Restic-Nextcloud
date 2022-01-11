# Restic-Nextcloud
#### Restic Backup for Nextcloud
Will Make a Backup of:

 - SQL Database (SQL Dump)
 - www Directory
 - Data Directory

This Script uses Backblaze B2 Storage! Also working other Services as Described in the Documentation of Restic.



    export B2_ACCOUNT_ID=YOUR BACKBLAZE ACCOUNT ID
    export B2_ACCOUNT_KEY=YOUR BACKBLAZE ACCOUNT KEY
    export RESTIC_PASSWORD=YOUR RESTIC REPO PASSWORD
    export RESTIC_REPOSITORY=b2:bucketname:path/to/repo
    sql_host=localhost
    sql_user=NEXTCLOUD SQL USER
    sql_pw=NEXTCLOUD SQL PASSWORD
    sql_db=NEXTCLOUD SQL DATABASE NAME

[Restic Documentation[](https://restic.readthedocs.io/en/stable/index.html#restic-documentation "Permalink to this headline")](https://restic.readthedocs.io/en/stable/index.html)
