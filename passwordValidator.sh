#!/bin/bash
#colors variables
RED='\033[0;31m'
GREEN='\033[0;32m'

#reading the file content
function readfile(){
filename=$1
pass=$(cat $filename)
}

#use getopts to handle flag -f
while getopts "f:" opt; do
    case "$opt" in
        f) file="${OPTARG}"
	  readfile $file
	  ;;
	\?)
          echo "Invalid option: -$OPTARG" >&2
          exit 1
          ;;
        :)
         echo "Option -$OPTARG requires an argument." >&2
         exit 1
         ;;
    esac
done

#check if f used, if not use standard script option
if [ $OPTIND -eq 1 ];then 
pass=$1
shift $((OPTIND-1))
fi

#function length
function len(){
if [ ${#pass} -ge 10 ];then
    true && echo "length is ${#pass}"
else
    echo -e "${RED} password $pass is less than 10 chars\n" && exit
fi
}

#function numbers included
function nums(){
if [[ "$pass" =~ [0-9] ]];then
    true
else
    echo -e "${RED} password $pass does not contain numbers\n" && exit
fi
}

#function letters included
function lett(){
if [[ "$pass" =~ [a-z] ]];then
    true
else
    echo -e "${RED} password $pass does not contain lowercase letters\n" && exit
fi
}

#function capital letters included
function cap(){
if [[ "$pass" =~ [A-Z] ]];then
    true
else
echo -e "${RED} password $pass does not contain capital letters\n" && exit
fi
}

#function that will run all functions and will return 1 or 0
function result(){
if len && nums && lett && cap;then
echo -e "${GREEN} password $pass meets requirements" && exit 0 # zero for good password
else
exit 1 # one for bad password
fi
}

#running the main function
result

