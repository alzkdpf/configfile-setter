#!/bin/bash
#./upload.sh 22 account 192.168.0.1 account folderName test/

port=$1
user_name=$2
host=$3
remote_path=$4
target_file_path=$5
local_file_path=$6
put=$(printf "put -r %s %s/%s" $6 $4 $5)
if [ "$1" == "-h" ]; then
  echo "./upload.sh [port] [user_name] [host] [remote_path] [target_file_path] [local_file_path]"
  exit 0
elif [ -z "$user_name" ]; then
    echo "-h show options";
    exit 0; #exit 0 정상 종료를 의미
fi

if [ -z "$remote_path" ]; then
    echo "need argument required for remote_path";
    exit 0; #exit 0 정상 종료를 의미
fi

if [ -z "$local_file_path" ]; then
    echo "need argument required for local_file_path";
    exit 0; #exit 0 정상 종료를 의미
fi
save=$(printf "%s.%s" $5 $(date +%F))
download_path=$(printf "%s/%s" $remote_path $save)
echo $download_path > path.log
echo $(printf "./download.sh %s %s %d %s" $remote_path $host $port $download_path ) > dir_download.sh
mkdir=$(printf "mkdir %s" $save)
put=$(printf "put -r %s %s" $6 $save)
# put=$(printf "put -r %s" $6)
# $(printf "ls")
sftp -oPort=$port $user_name@$host:$remote_path <<END
$mkdir
$put
END