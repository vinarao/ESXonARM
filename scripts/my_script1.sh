#!/bin/bash
yum -y  install httpd rsync lzma gcc libffi-devel python3-devel openssl-devel unzip gcc rsyslog jq python-firewall git devtoolset-8 emacs-nox python36-oci-cli
scl enable devtoolset-8 bash
git clone http://git.ipxe.org/ipxe.git
cd ipxe/src
LANG=C make bin-arm64-efi/snponly.efi
mkdir -p /var/www/html/ipxe/70/
mkdir -p /var/www/html/70/
cp bin-arm64-efi/snponly.efi /var/www/html/ipxe/70/
yum -y install httpd
systemctl enable httpd
service httpd start
firewall-cmd --zone=public --add-service=http --permanent
chmod -R ug+rwX,o-w,o+rX /var/www/
