#!/bin/bash

Install dependencies
sudo apt install -y nmap curl

get_ip_addresses() {
    # Get local IP address
    local_ip=$(hostname -I | awk '{print $1}')

    # Get public IP address
    public_ip=$(curl -s https://api.ipify.org)

    # Check if the local IP address was retrieved
    if [ -z "$local_ip" ]; then
        echo "Failed to retrieve local IP address."
        exit 1
    fi

    # Check if the public IP address was retrieved
    if [ -z "$public_ip" ]; then
        echo "Failed to retrieve public IP address."
        exit 1
    fi

    # Print IP addresses (local, public)
    echo "Local IP address: $local_ip"
    echo "Public IP address: $public_ip"
}

# Function to select network interface
select_NI() {
    echo "Available network interfaces:"
    interfaces=$(list_all_NI)
    echo "$interfaces"
    echo ""
    read -p "Enter the name of the network interface for scan: " selected_NI
    if echo "$interfaces" | grep -wq "$selected_NI"; then
        echo "Details of $selected_NI:"
        show_interface_info "$selected_NI"
    else
        echo "Error: Network interface '$selected_NI' not found."
        exit 1
    fi
}

# Function to choose IP
choose_ip() {
    echo -e "Select IP address: \n 1) Local IP \n 2) Public IP \n 3) Custom IP or Domain Name"
    read -p "Enter your choice [1-3]: " choice
    case $choice in
        1)
            selected_ip="$local_ip"
            ;;
        2)
            selected_ip="$public_ip"
            ;;
        3)
            read -p "Enter any IP address or domain name: " selected_ip
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 3."
            exit 1
            ;;
    esac
}

# Function to choose subnet mask
choose_subnet() {
    read -p "Enter subnet mask: " subnet
}

# Function to choose ports
choose_ports() {
    read -p "Enter ports (comma-separated): " ports
}

# Function to choose scan type
choose_scan_type() {
    echo "Select scan type:"
    echo "-sL, -Pn, -PS, -PA, -PU"
    read -p "Enter scan type: " scan_type
}

Main function call
et_ip_addresses
select_NI
choose_ip
choose_subnet
choose_ports
choose_scan_type

sudo nmap $scan_type -p $ports $selected_ip/$subnet
