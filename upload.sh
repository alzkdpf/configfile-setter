#!/bin/bash

port=$1
user_name=$2
host=$3
remote_path=$4
local_file_path=$5

if [ "$1" == "-h" ]; then
  echo "./upload.sh [port] [user_name] [host] [remote_path] [local_file_path]"
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

put=$(printf "put %s" $3)

sftp -oPort=$port $user_name@$host:$remote_path <<< $put