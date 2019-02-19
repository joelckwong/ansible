
If you need to ssh into different servers with the same ssh key, it's easier to use ssh-agent

eval `ssh-agent`

in your shell. You can then feed it keys, with ssh-add like:

$ ssh-add /home/test/.ssh/id_rsa
