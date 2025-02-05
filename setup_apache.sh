#!/bin/bash

# Update & upgrade package manager
echo "Updating package manager..."
sudo apt update && sudo apt upgrade -y

# Check if Apache is installed
if ! dpkg -l | grep -q apache2; then
    echo "Installing Apache..."
    sudo apt install apache2 -y
else
    echo "Apache is already installed."
fi

# Enable Apache to start on boot
echo "Enabling Apache service..."
sudo systemctl enable apache2

# Start Apache
echo "Starting Apache..."
sudo systemctl start apache2

# Check Apache status
if systemctl is-active --quiet apache2; then
    echo "✅ Apache is running successfully!"
else
    echo "❌ Apache failed to start. Check logs using: sudo systemctl status apache2"
    exit 1
fi

# Get WSL IP
SERVER_IP=$(ip -4 addr show eth0 | grep "inet " | awk '{print $2}' | cut -d'/' -f1)
echo "You can access Apache at: http://$SERVER_IP"


