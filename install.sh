#!/bin/sh
set -ex

sudo yum install -y nginx dstat unzip

# nginx
# sudo systemctl enable nginx
# sudo systemctl start nginx

# alp
cd /var/tmp/ && wget https://github.com/tkuchiki/alp/releases/download/v0.4.0/alp_linux_amd64.zip
unzip alp_linux_amd64.zip
sudo mv ./alp /usr/local/bin

# pt-query-digest
cd /var/tmp && wget https://www.percona.com/downloads/percona-toolkit/3.0.13/binary/tarball/percona-toolkit-3.0.13_x86_64.tar.gz
tar -zxvf percona-toolkit-3.0.13_x86_64.tar.gz
sudo mv ./percona-toolkit-3.0.13/bin/pt-query-digest /usr/local/bin

# ssh
cat << _EOS > /tmp/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC3HgY4HmDPAkBaB2KJu8/nmtlfXN1B4h6DTGlDmJpIwdHR+Ra7ljIslCP9Ctg62ATDeNKnB+VhnRdmxQbZgIe6bSQsVrScK0PO48LhoM0Q9VH09GC30PnzXPJeFNtwke8Ccm8TLz3CJ8+jFOaaZeKblY1A9w5qGkFcHrrUDgqN1UaG2pFokmLJhiotBHArlAbW+lyXAlOrHZtd4KtpHi2NmyIU1Q2+wnEIvZ3TYbTgcAgQ0uDQfSW5+EZrgij9ZbHkbEmkHxoskS3ybRZbDc+InXEtU4bF4lty7+khiX1CJ5eyTUhpcNou6iSO98JzujPKjooVcvT4V8LdPkGX0Mv3 tatsu@Tatsuhikos-MacBook-Pro.local
_EOS
sudo cat /tmp/authorized_keys >> /home/isucon/.ssh/authorized_keys
sudo mkdir -p /home/isucon/.ssh
sudo mv /tmp/authorized_keys /home/isucon/.ssh/
sudo chown -R isucon.isucon /home/isucon/.ssh/
sudo chmod 600 /home/isucon/.ssh/authorized_keys
