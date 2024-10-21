#!/bin/bash

# Extract EC2 public IP using Terraform
backend_ip=$(terraform output -raw public_ip_backen )
frontend_ip=$(terraform output -raw public_ip_frontend)
db_endpoint=$(terraform output -raw db_endpoint) 
source ~/.bashrc
# Check if IP addresses are valid
if [ -n "$backend_ip" ] && [ -n "$frontend_ip" ] && [ -n "$db_endpoint" ]; then
  # Write the IPs to the Ansible inventory
  echo -e "[backend]\n$backend_ip" > ansible/inventory
  echo -e "[frontend]\n$frontend_ip" >> ansible/inventory
  #######add db endpoint in file
  echo -e "db_endpoint: $db_endpoint" >> ansible/vars.yml
  
  
fi
