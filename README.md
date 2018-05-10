# Config file SFTP UP & DOWN script on command line

설명
---

Node, Android, Python 등 다양한 환경에서 개발시 .env or .json 형태의 설정
폴더를 별도의 sftp에 업로드 관리하기 위해 만들어졌습니다.


사용방법
---

최초의 config 개발 환경을 설정 후 해당 파일이 위차힌 디렉토리에 download.sh 와 upload.sh 를 
복사 후 붙여넣기 합니다.

* 실행

> config 파일 업로드

```
    $./upload.sh [port number] [account name] [sftp server ip] [sftp home path] [upload folder name] [target path]

    $./upload.sh 22 admin 192.168.0.1 home example_config_folder example_target_config_folder
```

upload 를 진행하고 나면 dir_download.sh 라는 파일이 생성되고 
이후엔 **./dir_download.sh** 를 실행해 원하는 config 폴더를 다운 받을 수 있습니다.

 