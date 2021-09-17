#get password from terminal
param ($pass)

#function length
function len {
$length = $pass.length
if($length -ge 10){
   write-host("length is $length in $pass" ) -ForegroundColor green
   return 1
}
else {
   write-host("password $pass is less than 10 chars" ) -ForegroundColor red
   exit
}
}

#function numbers included
function nums {
if($pass -match '\d'){
   write-host("password $pass contain numbers" ) -ForegroundColor green
   return 1
}
else {
   write-host("assword $pass does not contains numbers" ) -ForegroundColor red
   exit
}
}

#function letters included
function lett {
if($pass -cmatch "[a-z]"){
   write-host("password $pass contain letters" ) -ForegroundColor green
   return 1
}
else {
   write-host("password $pass does not contains lowercase letters" ) -ForegroundColor red
   exit
}
}

#function capital letters included
function cap {
if($pass -match "[A-Z]"){
   write-host("password $pass contains caps" ) -ForegroundColor green
   return 1
}
else {
   write-host("password $pass does not contains caps" ) -ForegroundColor red
   exit
}
}

#function result
function result {
if((len) -and (nums) -and (lett) -and (cap)){
   write-host("password $pass meet requirments" ) -ForegroundColor green
   exit 1
else {
exit 0
}
}
}
result