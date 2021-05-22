#!/bin/zsh

declare -A creds
creds[DOMAIN]=USERNAME:PASSWORD


#MYIP="$(curl https://domains.google.com/checkip)"
MYIP4="$(curl -4 icanhazip.com 2>/dev/null)"
MYIP6="$(curl -6 icanhazip.com 2>/dev/null)"
MYIP=$MYIP4

source $CONFIG/zsh_custom/define_color_codes.zsh
for k v in ${(kv)creds}; do
    if [[ "$(dig +short $k)" != $MYIP ]]; then
        printf "${COLOR_LightRed}${k}${COLOR_Orange} not up to date...\n    "
        curl -X POST -A 'def firefox' "https://${v}@domains.google.com/nic/update?hostname=DOMAIN&myip=${MYIP}"
    else
        echo ${COLOR_LightGreen}${k}${COLOR_Green} up to date
    fi
done

