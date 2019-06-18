DNS server changing in AWS proxu server after rebooting. Hence this script added. 

#!/bin/bash
ips=$(grep 64.6.64.6 resl.conf | awk '{ print $2}')
echo "Just for Test" >> /home/ec2-user/dns-executing
echo $ips
if [[ $ips != "64.6.64.6" ]];
 then
  sed -i '3 i nameserver 64.6.64.6' resl.conf
  sed -i '4 i nameserver 8.8.8.8' resl.conf
else
   echo "DNS exists"
fi

#Add this in cronjob 
*/5 * * * * /bin/sh /home/ec2-user/dns.sh
