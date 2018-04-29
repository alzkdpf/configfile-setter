#!/bin/bash
#./download.sh configuration 127.0.0.1 2929 $(cat result.log) ./
# ./download.sh configuration 192.168.5.0 2929 configuration/yo.2018-04-28/test
# ./download.sh configuration 192.168.5.0 2929 configuration/yo.2018-04-28

user_name=$1
host=$2
port=$3
target_path=$4

if [ "$1" == "-h" ]; then
    echo "./download.sh [user_name] [host] [port] [target_path] [destination_path]"
    exit 0;
elif [ -z "$user_name" ]; then
    echo "-h show options";
    exit 0; #exit 0 정상 종료를 의미
fi

get=$(printf "get -r *")
sftp -oPort=$port $user_name@$host:$target_path <<END
$get
END
