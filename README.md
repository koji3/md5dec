# md5dec

CLI tool for md5 online cracking searching in online databases. Tries with:
- http://www.nitrxgen.net
- http://md5decryption.com
- http://md5.my-addr.com
- [FUTURE] http://hashkiller.co.uk
- You know others? Tell me!

Please, if you are heavy user of this platforms, donate them!

### Usage examples

	md5dec.sh dca57be223efc2741bc98adce0ec5141
	md5dec.sh hash_file			# One hash per line
	echo '21b6ddcd02b500c914fd104830440dd1' | md5dec.sh
	cat hash_file | md5dec.sh
	md5dec.sh < hash_file


### License 
```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2017 Jose Linares

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```
