#!/bin/bash

function usage
{


}


function decrypt
{
	decrypt_md5decryption $1
	decrypt_md5myaddr $1
	decrypt_nitrxgen $1

}


function decrypt_md5myaddr $1
{
	found=$(curl -s 'http://md5.my-addr.com/md5_decrypt-md5_cracker_online/md5_decoder_tool.php' -H 'Host: md5.my-addr.com' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: es,en-AU;q=0.8,en-US;q=0.5,en;q=0.3' --compressed -H 'Referer: http://md5.my-addr.com/md5_decrypt-md5_cracker_online/md5_decoder_tool.php' --data 'md5='$1 | grep "<span class='middle_title'>Hashed string</span>" | cut -d ":" -f2 | cut -d "<" -f1 | cut -c 2-)
	if [[ ${found:-NULL} -eq "NULL" ]] ; then
		decrypt_md5decryption $1
	else
		echo "$1:$found"
	fi
}

function decrypt_md5decryption
{

	found=$(curl -s 'http://md5decryption.com/' -H 'Host: md5decryption.com'  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: es,en-AU;q=0.8,en-US;q=0.5,en;q=0.3' --compressed -H 'Referer: http://md5decryption.com/' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data 'hash='$1'&submit=Decrypt+It%21' | grep 'Decrypted Text: </b>' | cut -d">" -f2)
	if [[ ${found:-NULL} -eq "NULL" ]] ; then
		decrypt_md5decryption $1
	else
		echo "$1:$found"
	fi
}

function decrypt_nitrxgen
{
	found=$(curl -s 'http://www.nitrxgen.net/md5db/'$1)
	if [[ ${found:-NULL} -eq "NULL" ]] ; then
		decrypt_md5decryption $1
	else
		echo "$1:$found"
	fi
}

decrypt $1

