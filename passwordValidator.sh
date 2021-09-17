#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
#variables
pass=$1
#function length
function len(){
if [ ${#pass} -ge 10 ]; then
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
    echo -e "${RED} password does not contain numbers\n" && exit
fi
}

#function letters included
function lett(){
if [[ "$pass" =~ [a-z] ]];then
    true
else
    echo -e "${RED} password does not contain lowercase letters\n" && exit
fi
}

#function capital letters included
function cap(){
if [[ "$pass" =~ [A-Z] ]];then
    true
else
echo -e "${RED} password does not contain capital letters\n" && exit
fi
}

function result(){
if len && nums && lett && cap;then
echo -e "${GREEN} password meets requirements" && return 1
else
return 0
fi
}

result

