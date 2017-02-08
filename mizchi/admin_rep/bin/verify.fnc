# -definiton for verifing
Verify()
{
	echo "Please input admin password: user ${1}:"
	read pass

	phrase=`echo ${1} | openssl enc -aes-128-cbc -e -base64 -p | tail -1`

	err_flg=1
	cat ${2} | while read line
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
}

