# Create key for ansible user on ansible node
ssh-keygen -t ed25519 -521

# Copy Id to other nodes
# 192.168.1.201 c1-cp1.local c1-cp1
# 192.168.1.202 c1-cp2.local c1-cp2
# 192.168.1.203 c1-node1.local c1-node1
# 192.168.1.204 c1-node2.local c1-node2
# 192.168.1.205 c1-node3.local c1-node3
# 192.168.1.210 ansible.local ansible

ssh-copy-id -i .ssh/id_ed25519.pub ansible@c1-cp1.local
ssh-copy-id -i .ssh/id_ed25519.pub ansible@c1-cp2.local
ssh-copy-id -i .ssh/id_ed25519.pub ansible@c1-node1.local
ssh-copy-id -i .ssh/id_ed25519.pub ansible@c1-node2.local
ssh-copy-id -i .ssh/id_ed25519.pub ansible@c1-node3.local



# Install Miniconda
curl -OL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Restart the shell session
exec bash -l

# Create a new virtual environment for Ansible
conda create -n ansible-dev python=3

# Activate the new environment:
conda activate ansible-dev

# Check your Python version:
python --version

# Install gnupg -- required for Ansible
sudo apt install gnupg

# Install software-properties-common
sudo apt install software-properties-common

# Add ansible ppa
sudo apt-add-repository --yes --update ppa:ansible/ansible

# Install ansible
sudp apt install ansible

# run ad-hoc ansible command
ansible all -u ansible -m ping --private-key ~/.ssh/id_ed25519
