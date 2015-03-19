#! /bin/bash

port="$1"
speed="$2"
customer="$3"
host="$4"
project="$5"
dir="/home/user/seriallogs/$customer/$host"

mkdir  -p $dir
cd $dir

echo $dir
temp=`mktemp` || exit 1
echo $temp
cat << EOF > $temp
log on
logfile $dir/$project
EOF

sudo screen -c $temp -L  -S $filer  /dev/ttyUSB$port $speed

rm $temp


