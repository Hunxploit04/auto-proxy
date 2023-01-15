#!/bin/bash
clear
blue='\033[34;1m'
green='\033[32;1m'
purple='\033[35;1m'
cyan='\033[36;1m'
red='\033[31;1m'
white='\033[37;1m'
yellow='\033[33;1m'
#====================
if [ "$(id -u)" != "0" ]; then
   echo -e $white" This script must be run as$red root" 1>&2
   exit 1
fi
echo $white" Root access granted"
clear
echo -e $red'''
 ______     __  __     ______   ______     ______   ______     ______     __  __     __  __    
/\  __ \   /\ \/\ \   /\__  _\ /\  __ \   /\  == \ /\  == \   /\  __ \   /\_\_\_\   /\ \_\ \   
\ \  __ \  \ \ \_\ \  \/_/\ \/ \ \ \/\ \  \ \  _-/ \ \  __<   \ \ \/\ \  \/_/\_\/_  \ \____ \  
 \ \_\ \_\  \ \_____\    \ \_\  \ \_____\  \ \_\    \ \_\ \_\  \ \_____\   /\_\/\_\  \/\_____\ 
  \/_/\/_/   \/_____/     \/_/   \/_____/   \/_/     \/_/ /_/   \/_____/   \/_/\/_/   \/_____/ 
                                                                                            '''
echo -e $white"                                                                   C O D E   B Y   H U N X 0 4"
echo -e $white" [$red 00 $white]$white Install requirements"
echo -e $white" [$red 01 $white]$white Start Proxy"
echo -e $white" [$red 02 $white]$white Exit Tools"
echo -en "\n Enter Number 00 - 02 : ";read num
if [ $num = 00 ]
    then
    clear
    echo -e "$white[$red + $white]$white Installed packet !"
    echo ""
    apt install proxychains tor -y 
    echo -e $white"\n$white[$red + $white] Installed Successful"
    sleep 2
    ./proxy.sh
fi
if [ $num = 01 ]
    then
    cat <<EOF > /etc/proxychains.conf
       # proxychains.conf  VER 3.1
#
#        HTTP, SOCKS4, SOCKS5 tunneling proxifier with DNS.
#	

# The option below identifies how the ProxyList is treated.
# only one option should be uncommented at time,
# otherwise the last appearing option will be accepted
#
dynamic_chain
#
# Dynamic - Each connection will be done via chained proxies
# all proxies chained in the order as they appear in the list
# at least one proxy must be online to play in chain
# (dead proxies are skipped)
# otherwise EINTR is returned to the app
#
#strict_chain
#
# Strict - Each connection will be done via chained proxies
# all proxies chained in the order as they appear in the list
# all proxies must be online to play in chain
# otherwise EINTR is returned to the app
#
#random_chain
#
# Random - Each connection will be done via random proxy
# (or proxy chain, see  chain_len) from the list.
# this option is good to test your IDS :)

# Make sense only if random_chain
#chain_len = 2

# Quiet mode (no output from library)
#quiet_mode

# Proxy DNS requests - no leak for DNS data
proxy_dns 

# Some timeouts in milliseconds
tcp_read_time_out 15000
tcp_connect_time_out 8000

# ProxyList format
#       type  host  port [user pass]
#       (values separated by 'tab' or 'blank')
#
#
#        Examples:
#
#            	socks5	192.168.67.78	1080	lamer	secret
#		http	192.168.89.3	8080	justu	hidden
#	 	socks4	192.168.1.49	1080
#	        http	192.168.39.93	8080	
#		
#
#       proxy types: http, socks4, socks5
#        ( auth types supported: "basic"-http  "user/pass"-socks )
#
[ProxyList]
# add proxy here ...
# meanwile
# defaults set to "tor"
#socks4 127.0.0.1 9050
socks5 127.0.0.1 9050
EOF
sleep 3
echo -e $white"\n [$red Proxy Successful, go to $white proxychains firefox google.com $white]"
fi
if [ $num = 02 ]
    then
    echo -e $red"\n Thanks for using tools !"
    sleep 2
    exit
fi
