# mysqldump2amazon-s3
Dump MySQL databases and puts them in Amazon S3.

## INSTALL

1. Install s3cmd

        wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add -
        sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list
        sudo apt-get update && sudo apt-get install s3cmd

2. Configure s3cmd

        s3cmd --configure

3. Download script

        cd /usr/local/bin
        wget https://raw.githubusercontent.com/creads/mysqldump2amazon-s3/master/mysqldump2amazon-s3.sh
        chmod +x mysqldump2amazon-s3.sh
4. Create mysql user

        mysql -u root -p
        create user 'backup'@'localhost' identified by '***';
        grant select, lock tables  on *.* to 'backup'@'localhost';
        FLUSH PRIVILEGES;
        exit;
5. Edit script config

        nano mysqldump2amazon-s3.sh

6. Execute

        ./mysqldump2amazon-s3.sh

Optionaly edit your crontab

        crontab -e
        0 3 * * * sh /usr/local/bin/mysqldump2amazon-s3.sh
