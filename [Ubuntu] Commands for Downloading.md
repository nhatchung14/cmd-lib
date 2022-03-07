## Download from Google Drive

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=<File_ID>' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=<File_ID>" -O <File_Name> && rm -rf /tmp/cookies.txt


## Download from One Drive

wget "https://mphcmiuedu-my.sharepoint.com/:u:/g/personal/<File_Download_Path>&download=1" -O <File_Name>


