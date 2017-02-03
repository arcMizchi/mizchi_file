#!/bin/bash
###############################################################################################
#
# Add the user name for administlator list.
# Administlator list is configured in  config/admins.
#
###############################################################################################

# ユーザーの指定
echo "Please enter user's name for adding admins"
read user

if [ grep ${user} config/admins >/dev/null ] ;then
	echo "That user is added yet."
else
	echo ${user} >> config/admins
	echo "User is added to admins."
fi

