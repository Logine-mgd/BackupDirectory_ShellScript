# Overview about the code
Working directory name is 7163-lab2.  
It contains:   
1.Shell Script in backupd.sh  

2.Makefile to compile and run the script.  

3.Backupdirectory is called backupdir (if it doesn't exist it will be created).  

  

## In backupd.sh
### Validations:
 In backupd.sh Bash Script is saved   
 Make will send to the script 4 parameters which are source directory ,destination directory , interval of seconds alowed to sleep or wait for any change, and maximum number of backups allowed in destination directory.  
 Bash Script will recieve them in  positional parameters.  

3 functions are created to validate input::

1. Function validations to compare the variable( which we want to check) with a regular expression that only accepts numbers otherwise exit the script;"$1" is the argument that was passed to validation .    

2. IF condition to check if source directory exists.

3. Another if condition to count number of parameters passed to the bash script.If it is lesser or greater than 4. Make should be called again.

### BackUp Code:
When we call make and make  compiles and calls backupd.sh.

 The steps are:  

1. First backup will be created with current time under the name "backupdir/date"
2. Directory_info.last and  Directory_info.new will be created they will contain information about the source dir and when it changes.

3. While loop is for looping for infinite time to save the backups.  

4. At each step when Directory_info.last and  Directory_info.new are not the same in content Anew backup directory will be added. 

5. Limit is our max number of backups.Note that when number of backups reaches the maximum we will sort the contents of the directory by the oldest in time and delete first dir in backup directory.  
     
6.The bash Script will terminate according to the user.  

## Makefile 
In the Makefile the user will determine the path of the source directory ,destination directory, interval seconds and maximum number of backups. Note that the user will enter them in hard coded not from te terminal.  

1. all is the default target that calls the bash script but it will need a prerequisite before going to the script.
2. prerequisit target will make a new directory as the destination backup if the given backup directory given by the user doesn't exist.


    
# Prerequisites needed to be installed

 Make was downloaded by typing
 ```bash
 sudo apt install make

 ``` 


