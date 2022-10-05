#!/usr/bin/env bash

# Description: Configures proxy server for current session
# Author: Maros Kukan


unset proxy_url
read -p "Proxy URL [proxy.example.com]: " proxy_url
proxy_url=${proxy_url:-proxy.example.com}

unset proxy_port
read -p "Proxy URL [80]: " proxy_port
proxy_port=${proxy_port:-80}

unset proxy_user
read -p "NT Username: " proxy_user

unset proxy_pass
read -s -p "NT Password: " proxy_pass

if [ -z "$proxy_user" ] || [ -z "$proxy_pass" ]; then
   printf "Proxy settings skipped"
else
   # Special character in username or password need to be encoded before use
   enc_proxy_user=$(echo ${proxy_user} | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "" | sed -E 's/..(.*).../\1/')
   enc_proxy_pass=$(echo ${proxy_pass} | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "" | sed -E 's/..(.*).../\1/')
   export http_proxy=http://${enc_proxy_user}:${enc_proxy_pass}@${proxy_url}:${proxy_port}
   export https_proxy=${http_proxy}
   export no_proxy=localhost,*.example.com,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16


   # Todo: update APT or YUM configuration to use proxy
   #echo "Acquire::http::Proxy \"${http_proxy}\";" > test.txt
   #echo "Acquire::https::Proxy \"${http_proxy}\";" >> test.txt

   printf "\n\nProxy settings updated."
   printf "\nProxy external fqdn is $(dig -x $(curl -s ifconfig.me) +short)"
   printf "\n"
fi
