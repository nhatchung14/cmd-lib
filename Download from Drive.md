# Download from Google Drive

## WGET
> wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=12QR9wQD7I-wCEy2BpwP6NZkaATjypITr' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=12QR9wQD7I-wCEy2BpwP6NZkaATjypITr" -O dataset2014.zip && rm -rf /tmp/cookies.txt

## CURL
> nano download.sh

``` sh
#!/bin/bash
fileid="12QR9wQD7I-wCEy2BpwP6NZkaATjypITr"
filename="dataset2014.zip"
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
```

> chmod +x download.sh
>
> ./download.sh

# Download from One Drive

wget "<Shared_File_Link>&download=1" -O <File_Name>


