# Ansible Playbook for Building and Deploying Estuary.

This is a basic playbook that just runs the same remote command we are doing.

## Prerequisite
- Install ansible and ansible playbook cli. Follow the instructions [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Generate a SSH key and apply the SSH key to each of the host. (Generate ssh and add the public key to ~/.ssh/authorize_key of each server)
- Replace the inventory files (.ini) with your host ssh private key (e.i `shuttle-6.estuary.tech ansible_user=root ansible_ssh_private_key_file=~/.ssh/estuary`)

## Running
### Ping only (just test)
```
ansible-playbook -i prod/inventory.ini -k ping.yml 
```

### Run the remote command to build and deploy
Run the following command to deploy for each hosts.
```
ansible-playbook -i prod/inventory.ini -k deploy-prod-api.yml --extra-vars "tag=v0.1.11"
ansible-playbook -i prod/inventory.ini -k deploy-prod-shuttle.yml --extra-vars "tag=v0.1.11"
```

### Using the shell script
Alternatively, you can run the following script (which just calls all the ansible-playbook command above)
```
./run-prod-build-deploy.sh v0.1.11 (pass the estuary tag)
```