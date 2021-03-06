# mysqldump2amazon-s3
Dump MySQL databases and/or archive a directory and puts them in Amazon S3.

## INSTALL MySQL Backup

1. Install s3cmd (do only once)

        wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
        sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
        sudo apt-get update && sudo apt-get install s3cmd

2. Configure s3cmd (do only once)

        s3cmd --configure

3. Download script

        cd /usr/local/bin
        wget https://raw.githubusercontent.com/creads/mysqldump2amazon-s3/master/mysqldump2amazon-s3.sh
        chmod +x mysqldump2amazon-s3.sh
        
4. Create mysql user

        mysql -u root -p
        CREATE USER 'backup'@'localhost';
        GRANT SELECT, LOCK TABLES ON *.* TO 'backup'@'localhost' IDENTIFIED BY '***';
        FLUSH PRIVILEGES;
        exit;
5. Edit script config

        nano mysqldump2amazon-s3.sh

6. Execute

        ./mysqldump2amazon-s3.sh

Optionaly edit your crontab

        crontab -e
        0 3 * * * sh /usr/local/bin/mysqldump2amazon-s3.sh
        
## INSTALL directory Backup

1. Install s3cmd (do only once)

        wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
        sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
        sudo apt-get update && sudo apt-get install s3cmd

2. Configure s3cmd (do only once)

        s3cmd --configure

3. Download script

        cd /usr/local/bin
        wget https://raw.githubusercontent.com/creads/mysqldump2amazon-s3/master/filedump2amazon-s3.sh
        chmod +x filedump2amazon-s3.sh

4. Edit script config

        nano filedump2amazon-s3.sh

5. Execute

        ./filedump2amazon-s3.sh

Optionaly edit your crontab

        crontab -e
        0 3 * * * sh /usr/local/bin/filedump2amazon-s3.sh