#!/bin/bash

# Proudly made by Jose Linares ( jose-linares.com )

# License: (full text here: http://www.wtfpl.net )

#                 DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 
#       TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 
#                0. You just DO WHAT THE FUCK YOU WANT TO.



function usage
{
	echo "a"

}


function decrypt
{
	decrypt_md5myaddr $1

}


function decrypt_md5myaddr 
{
	found=$(curl -s 'http://md5.my-addr.com/md5_decrypt-md5_cracker_online/md5_decoder_tool.php' -H 'Host: md5.my-addr.com' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: es,en-AU;q=0.8,en-US;q=0.5,en;q=0.3' --compressed -H 'Referer: http://md5.my-addr.com/md5_decrypt-md5_cracker_online/md5_decoder_tool.php' --data 'md5='$1 | grep "<span class='middle_title'>Hashed string</span>" | cut -d ":" -f2 | cut -d "<" -f1 | cut -c 2-)
	if [[ ${found:-NULL} == "NULL" ]] ; then
		decrypt_md5decryption $1
	else
		echo "$1:$found"
	fi
}

function decrypt_md5decryption
{

	found=$(curl -s 'http://md5decryption.com/' -H 'Host: md5decryption.com'  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: es,en-AU;q=0.8,en-US;q=0.5,en;q=0.3' --compressed -H 'Referer: http://md5decryption.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'hash='$1'&submit=Decrypt+It%21' | grep -o 'Decrypted Text: </b>' | cut -d">" -f2)
	if [[ ${found:-NULL} == "NULL" ]] ; then
		decrypt_nitrxgen $1
	else
		echo "$1:$found"
	fi
}

function decrypt_nitrxgen
{
	found=$(curl -s 'http://www.nitrxgen.net/md5db/'$1)
	if [[ ${found:-NULL} == "NULL" ]] ; then
			echo $1 >> not_found
	else
		echo "$1:$found"
	fi
}

function decrypt_hashkiller		# TODO cuando haya 64 en not_found, solicitar captcha y resolverlos todos del tiron
{
	found=$(curl -s 'http://www.nitrxgen.net/md5db/'$1)
	if [[ ${found:-NULL} == "NULL" ]] ; then
			echo $1 >> $not_found
	else
		echo "$1:$found"
	fi
}

function check_hash_md5			# Return 0 if valid md5
{
	if [[ $(echo $1 | egrep '([a-fA-F0-9])' | wc -c) -eq 32 ]] ; then
		return 0
	else
		return 1
	fi
}

#decrypt 'dca57be223efc2741bc98adce0ec5141'
not_found=$(mktemp)
hash_file="/dev/stdin"

if [[ $# -gt 0 ]] ; then

	if [[ -r $1 ]] ; then		#Check if the first parameter is a readable file
		hash_file=$1
	else
		for hash in $@ ; do
			decrypt $hash
		done
	fi

fi


while read line ; do
	decrypt $line
done   < "$hash_file"

