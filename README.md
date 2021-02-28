ansible-inventory -i aws_ec2.yml --graph

Add bastion host to /etc/hosts
For example, 
56.88.138.85 bastion

Add bastion host and private IPs to ~/.ssh/config using your own user and pem file
Host bastion
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    AddKeysToAgent yes
    User centos
    IdentityFile ~/.ssh/centos.pem
    IdentitiesOnly yes
    ForwardAgent yes
Host ip-10-10*
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null
    AddKeysToAgent yes
    User centos
    IdentityFile ~/.ssh/centos.pem
    IdentitiesOnly yes
    ForwardAgent yes
    ProxyCommand ssh -W %h:%p bastion

ssh bastion

ssh ip-10-10-10-47.ec2.internal

If you need to ssh into different servers with the same ssh key, it's easier to use ssh-agent

eval `ssh-agent`

in your shell. You can then feed it keys, with ssh-add like:

$ ssh-add /home/test/.ssh/id_rsa
