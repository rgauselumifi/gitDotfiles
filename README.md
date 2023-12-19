clone the repo into ~/.config
run:
apt update && apt upgrade -y
apt install -y ansible
apt install -y git

in home directory:

`ansible-playbook setup.yml`

when booting vim for first time, run:

`:PlugInstall`
