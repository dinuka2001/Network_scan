# Network Scanner Script

This bash script is designed to facilitate network scanning using `nmap`. It retrieves local and public IP addresses, lists available network interfaces, and allows the user to select an IP address, subnet mask, ports, and scan type for the network scan.

## Prerequisites

Before using this script, ensure you have the following dependencies installed on your system:

- `nmap`
- `curl`

You can install these dependencies using the following command:

```bash
sudo apt install -y nmap curl

## Script Description

The script performs the following tasks:

### Retrieve Local and Public IP Addresses

- **Local IP Address:** Retrieves the local IP address using the `hostname` command.
- **Public IP Address:** Retrieves the public IP address using the `api.ipify.org` service.

### List and Select Network Interfaces

- **List Interfaces:** Lists all available network interfaces using the `ip` command.
- **Select Interface:** Allows the user to select a network interface for scanning.

### Select IP Address

- Provides options to select the local IP, public IP, or enter a custom IP address or domain name.

### Enter Subnet Mask and Ports

- Prompts the user to enter the subnet mask and ports for the scan.

### Choose Scan Type

- Allows the user to select the type of scan to perform using `nmap`.

## Important Notes

- The script requires `sudo` privileges to run `nmap` with certain scan types.
- Ensure you have the necessary permissions and authorization to perform network scans on the chosen network or IP address.

