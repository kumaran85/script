#!/bin/bash
ls -lhtr /var/log/audit/audit.log.* | awk ' {print $9}' > /logfilename
mkdir audit_backup
for nam in $(cat /logfilename)
do
cd /var/log/audit
tar -cvzf $nam.tar.gz $nam
rm -rf $nam
echo "script doing @`date +%Y%m%d-%H-%M`" >>/access.log
mv *.gz audit_backup
done
exit
