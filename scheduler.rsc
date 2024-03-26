/system scheduler add interval=1m name=LIST-TO-BLACKHOLE on-event="/routing bgp network remove [find disabled =no ]\r\
    \n\r\
    \n:foreach i in=[/ip firewall address-list find where list=ATAQUE] do={\r\
    \n\t:if ([typeof [toip [/ip firewall address-list get \$i address]]] = \"ip\") do={\r\
    \n\t\t# IP-Address\r\
    \n\t\t/ip route add dst-address=[/ip firewall address-list get \$i address] type=blackhole;\r\
    \n                           /routing bgp network add synchronize=no network=[/ip firewall address-list get \$i address]\r\
    \n\t} else={\r\
    \n\t\t# No IP-Address\r\
    \n\t}\r\
    \n}\r\
    \n\r\
    \n/ip route remove [find type =blackhole active =no ]" policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon start-time=startup
