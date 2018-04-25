#!/bin/bash
user_name=$1

if [ "$1" == "-h" ]; then
    echo "./download.sh [user_name] [host] [port] [target_path] [destination_path]"
    exit 0;
elif [ -z "$user_name" ]; then
    echo "-h show options";
    exit 0; #exit 0 정상 종료를 의미
fi

host=$2
port=$3
target_path=$4
destination_path=$5

sftp -oPort=$port $user_name@$host:$target_path $destination_path
