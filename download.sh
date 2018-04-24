#!/bin/bash
user_name=$1

if [ -z "$user_name" ]; then
    echo "need argument required for user_name";
    exit 0; #exit 0 정상 종료를 의미
fi

host=192.168.5.0
target_path=/configuration/test/test.cfg
destination_path=./

sftp -oPort=2929 $user_name@$host:$target_path $destination_path
