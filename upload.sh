#!/bin/bash
user_name=$1

if [ "$1" == "-h" ]; then
  echo "Usage: `basename $0` [somestuff]"
  exit 0
elif [ -z "$user_name" ]; then
    echo "-h show options";
    exit 0; #exit 0 정상 종료를 의미
fi

remote_path=$2

if [ -z "$remote_path" ]; then
    echo "need argument required for remote_path";
    exit 0; #exit 0 정상 종료를 의미
fi

host=192.168.5.0
local_file_path=$3

if [ -z "$local_file_path" ]; then
    echo "need argument required for local_file_path";
    exit 0; #exit 0 정상 종료를 의미
fi

put=$(printf "put %s" $3)

sftp -oPort=2929 $user_name@$host:$remote_path <<< $put