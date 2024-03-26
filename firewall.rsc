
/ip firewall filter add action=add-src-to-address-list address-list=ATAQUE address-list-timeout=1d chain=forward comment="ssh-bruteforce - ATAQUE" connection-state=new dst-port=22 in-interface=sfp1 protocol=tcp src-address-list=connection3
/ip firewall filter add action=add-src-to-address-list address-list=connection3 address-list-timeout=1h chain=forward comment="ssh-bruteforce - 3" connection-state=new dst-port=22 in-interface=sfp1 protocol=tcp src-address-list=connection2
/ip firewall filter add action=add-src-to-address-list address-list=connection2 address-list-timeout=15m chain=forward comment="ssh-bruteforce - 2" connection-state=new dst-port=22 in-interface=sfp1 protocol=tcp src-address-list=connection1
/ip firewall filter add action=add-src-to-address-list address-list=connection1 address-list-timeout=5m chain=forward comment="ssh-bruteforce - 1" connection-state=new dst-port=22 in-interface=sfp1 protocol=tcp
