#! /usr/bin/bash
dir=$1
backupdir=$2
interval_secs=$3
max_backups=$4
reg_expression='^[[:digit:]]+$'


function validations
{
if ! [[ $1 =~ $reg_expression ]]
then 
echo ""$1" is not a number"
exit 
fi
}

if ! [ -d $dir ]
then
echo "Source directory doesnt exist"
exit
fi

number_of_parameters="$#"
if [ $number_of_parameters != 4 ]
then
echo "Invalid Parameters"
exit
fi


validations $max_backups
validations $interval_secs


date=$(date +'%Y-%m-%d-%H-%M-%S')
cp -r $dir $backupdir/"<$date>"
touch directory_info.last
chmod +x directory_info.last
ls -lR $dir > directory_info.last
touch directory_info.new
chmod +x directory_info.new


infinitelp=1
limit=1
while (( $infinitelp !=0 ))
do 
    sleep $interval_secs
    ls -lR $dir > directory_info.new
   
fileComparison=`cmp directory_info.last directory_info.new`                
 
 if [[ "$fileComparison" != "" ]]
     then
    date=$(date +'%Y-%m-%d-%H-%M-%S')
    limit=$((limit+1))
    cp -r $dir $backupdir/"<$date>" 
    cp  directory_info.new directory_info.last
    #echo "different"
    if [ "$limit" -gt "$max_backups" ]
     then
     firstdate=`ls -rt $backupdir/ | head -n 1`
     rm -r $backupdir/"$firstdate"
     limit=$((limit-1))
     fi
 
 fi
       
done 
  
 
