#!/bin/bash

ACTION=${1:-default}
VERSION=1.0.0
script_name=practice.sh


function no_argument() {

sudo yum update -y

}


function metadata() {

touch metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/ami-id >> metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/instance-id >> metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/hostname >> metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/security-groups >> metadata.txt

}

function list_all() {

ls *.txt

}

function version_number() {

echo $VERSION

}


case "$ACTION" in
        -m| --metadata)
                metadata
                ;;
        -v|--version)
                version_number
                ;;
        -l|--list)
                list_all
                ;;
        default)
                no_argument
                ;;
        *)
	echo "Usage ${0}{-m|-i|-v}"
	exit 1

esac

