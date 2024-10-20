#!/bin/bash

# Extract EC2 public IP using Terraform
backend_ip=$(terraform output -raw public_ip_backend)
frontend_ip=$(terraform output -raw public_ip_frontend)
# Check if IP addresses are valid
if [ -n "$backend_ip" ] && [ -n "$frontend_ip" ]; then
  # Write the IPs to the Ansible inventory
  echo -e "[backend]\n$backend_ip" > ../ansible/inventory
  echo -e "[frontend]\n$frontend_ip" >> ../ansible/inventory
fi
