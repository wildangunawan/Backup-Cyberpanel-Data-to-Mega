# Cyberpanel Backup to Mega
Automate Creation and Uploading of CyberPanel Backups to Mega using mega-tools

1) Clone this repo in /root directory of the server with directory name mega-backup using following Command
 
 ```
 git clone https://github.com/wildangunawan/mega-backup-cyberpanel.git mega-backup
 ```
 
 or you can use wget to download Zip Archive and Extract.
 
 ```
 wget 'https://github.com/wildangunawan/mega-backup-cyberpanel/archive/cyberpanel-mega.zip'
 unzip -j cyberpanel-mega.zip -d mega-backup
 ```

2) Run setup.sh with Server Hostname, Host Node, Cron Job Time as arguments

 ```
 cd mega-backup
 source setup.sh "server.hostname.com" "swift" "30 5 * * *"
 ```

   server.hostname.com = Server's Hostname where Backup Script will run or Primary Domain Name
   
   swift = Host Node name
   
   30 5 * * * = Backup Upload Script will run daily @5:30 AM

   Example: 
   ```
   source setup.sh "swift.basezap.com" "swift" "30 5 * * *"
   ```

3) Create .megarc file
 
 ```
 nano .megarc
 ```

Copy and paste following text and change it to yours

```
[Login]
Username=your-mega-email-address
Password=your-mega-password
```

## Acknowledgment
Many thanks to [xaksh][xaksh] for providing [Cyberpanel backup to Google Drive][xaksh-gdrive-backup].

[xaksh]: https://github.com/xaksh
[xaksh-gdrive-backup]: https://github.com/xaksh/gdrive-backup-cyberpanel
