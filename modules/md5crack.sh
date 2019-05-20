#!/bin/bash
#Project Hashck
clear # Cleaning the terminal

if [ -f "$1" ] && [ -n "$2" ] && [ ${#2} == 32 ] 
then # Checks whether the file exists and is not a directory, if the hash has been passed and if it has 32 characters
  echo -e "\033[46;1;37m█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█"
  echo -e "█                   » Md5Crack «                    █"
  echo -e "█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ v-0.1.4 ▄▄▄█\033[0m"
  echo ""
  echo "     Md5 Crack is a software to decrypt MD5 hash    "
  echo ""
  cont=0
  for line in $(cat $1); do    
    v=$line
    hash="$(echo -n "$v" | md5sum | sed 's/ //g' | sed 's/-//g')"; # Encrypts and treats wordlist password
    if [ $hash = $2 ] # Checks if password found
    then
      echo ""
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[46;1;37m| Md5 hash successfully decipher --> :\033[0m " $v
      echo -e "\033[46;1;37m--------------------------------------\033[0m"
      echo -e "\033[44;1;37m| Tested passwords: $cont\033[0m"
      exit 1
    else
      let cont=$cont+1;
      # Shows the script flow in operation
      echo -e "[ \033[31mFAILED\033[0m ] \033[1;32m$hash\033[0m != \033[1;32m$2\033[0m ($line)"
    fi
  done
else
  clear # Cleaning the terminal
  echo -e "\033[46;1;37m█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█"
  echo -e "█                   » Md5Crack «                    █"
  echo -e "█▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ v-0.1.4 ▄▄▄█\033[0m"
  echo ""
  echo "     Md5 Crack is a software to decrypt MD5 hash    "
  echo ""
  echo "Example software: "
  echo ""
  echo -e "\033[1;33muse: ./md5crack.sh [wordlist] [hash]\033[0m"
  echo ""
  echo "   [FILE] : wordlist location passwords"
  echo "   [HASH] : MD5 hash to be decrypted"
  echo ""
  echo "by: Waldelan Sena"
fi
