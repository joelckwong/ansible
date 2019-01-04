#!/bin/bash
sudo yum -y update
mkdir inventory
curl https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py --output inventory/ec2.py
curl https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini --output inventory/ec2.ini
chmod +x inventory/ec2.py
perl -pi -e 's/vpc_destination_variable = ip_address/vpc_destination_variable = private_ip_address/g' inventory/ec2.ini
