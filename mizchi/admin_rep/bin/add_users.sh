#!/bin/bash
###############################################################################################
#
# Add the user name for administlator list.
# Administlator list is configured in  config/admins.
#
###############################################################################################

# Reading admin passes
Passes=../config/passwd

# Verifying admin user
adm=`whoami`
echo "Please input admin password:user ${adm}:"
read pass

phrase=`echo ${adm} | openssl enc -aes-128-cbc -e -base64 -p | tail -1`

err_flg=1
cat ${Passes} | while read line
do
	if [ ${phrase} == ${line} ]
	then
		err_flg=0
		break
	fi
done

if [ ${err_flg} == 1 ]
then
	echo "!!! ERROR !!! Your Password is Mismatched..."
	exit 1
fi

# configure admins user
echo "Please input user's name for adding admins"
read user

User=../config/admins
rec_flg=1
cat ${User} | while read line
do
	if [ ${user} == ${line} ]
	then
		echo "That user is recorded yet."
		rec_flg=0
		break
fi

if [ rec_flg == 1 ]
then
	echo ${user} >>../config/admins
	echo "Input password:"
	read pass
	echo ${user} | openssl enc -aes-128-cbc -e -base64 -pass pass:${pass} -p >> ../config/passwd
	echo "User:${user} is added to admins." >> ../log/message | tee ../log/message 
fi

