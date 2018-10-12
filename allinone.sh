#!/bin/bash
cd /home/ec2-user/openssl-OpenSSL_1_1_0g
./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl shared zlib
make 
make install
cat >/etc/profile.d/openssl.sh<<EOF1
pathmunge /usr/local/openssl/bin
EOF1
cat >/etc/ld.so.conf.d/openssl-1.1.0g.conf <<EOF2
# /etc/ld.so/conf.d/openssl-1.1.0g.conf
/usr/local/openssl/lib
EOF2
ldconfig -v
#Install apache
cd /home/ec2-user/
cp -r apr-1.6.3 httpd-2.4.33/srclib/apr 
cp -r apr-util-1.6.1 httpd-2.4.33/srclib/apr-util
cd httpd-2.4.33
./buildconf
./configure --enable-ssl --enable-so --enable-http2 --with-mpm=event --with-included-apr --with-ssl=/usr/local/openssl --prefix=/opt/apache/httpd/
make 
make install
cat >/etc/profile.d/httpd.sh <<EOF4
pathmunge /opt/apache/httpd/bin
EOF4

#add systemd service

cat > /etc/systemd/system/httpd.service <<EOF7
[Unit]
Description=The Apache HTTP Server
After=network.target

[Service]
Type=forking
ExecStart=/opt/apache/httpd/bin/apachectl -k start
ExecReload=/opt/apache/httpd/bin/apachectl -k graceful
ExecStop=/opt/apache/httpd/bin/apachectl -k graceful-stop
PIDFile=/opt/apache/httpd/logs/httpd.pid
PrivateTmp=true

[Install]
WantedBy=multi-user.target
EOF7

#start service
systemctl daemon-reload
systemctl enable httpd
systemctl start httpd
