# Network Scanner Script

This bash script is designed to facilitate network scanning using `nmap`. It retrieves local and public IP addresses, lists available network interfaces, and allows the user to select an IP address, subnet mask, ports, and scan type for the network scan.

## Prerequisites

Before using this script, ensure you have the following dependencies installed on your system:

- `nmap`
- `curl`

You can install these dependencies using the following command:

```bash
sudo apt install -y nmap curl
```

## Script Description

The script performs the following tasks:

To clone and run follow belove commad

```bash
git clone https://github.com/dinuka2001/Network_scan.git
cd Network_scan
chmode +x nmap_scanning.sh
./nmap_scanning.sh
```

### List and Select Network Interfaces

- **List Interfaces:** Lists all available network interfaces using the `ip` command.
- **Select Interface:** Allows the user to select a network interface for scanning.

<pre>
Example

```console
lo
eth0
wlan0
docker0

Enter the name of the network interface for scan: wlan0

Details of wlan0:
3: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 00:11:22:33:44:55 brd ff:ff:ff:ff:ff:ff
    inet 192.168.0.100/24 brd 192.168.0.255 scope global dynamic noprefixroute wlan0
       valid_lft 3600sec preferred_lft 3600sec
    inet6 fe80::1234:abcd:5678:efgh/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

```
</pre>

### Retrieve Local and Public IP Addresses

Show the local and public ip addresses related to Network Interface

- **Local IP Address:** Retrieves the local IP address using the `hostname` command.
- **Public IP Address:** Retrieves the public IP address using the `api.ipify.org` service.

<pre>
```console
Local IP address: 192.168.1.100
Public IP address: 203.0.113.45
```
</pre>



### Select IP Address

- Provides options to select the local IP, public IP, or enter a custom IP address or domain name.

<pre>
```console
Select IP address: 
 1) Local IP 
 2) Public IP 
 3) Custom IP or Domain Name
Enter your choice [1-3]: 

```
</pre>

### Enter Subnet Mask and Ports

- **Subnet Mask**: Specify the subnet mask for the scan. For example, use `24` for `192.168.1.0/24`.

- **Ports**: Enter the ports you want to scan starts with -P. You can specify:
  - A list of individual ports separated by commas (e.g., `-P 22,80,443`).
  - A range of ports (e.g., `-P 1-1024`).
  - A combination of both (e.g., `-P 22,80,1000-2000`).
***OR
  - Use the `-F` option for a fast scan,it will scan most common 1000 ports.d

  For more details on port specification, refer to the [Nmap Port Specification](https://nmap.org/book/man-port-specification.html).

<pre>
Example

```console
Enter subnet mask: 24

 you should enter -P befor specify ports
Enter ports for scan (ex: -P 80,443 or -F): -P 80,443   

```
</pre>
  

### Choose Scan Type

- Allows the user to select the type of scan to perform using `nmap`.

- For more ditails aboute [nmap.org/book/man-briefoptions](https://nmap.org/book/man-briefoptions.html)
<pre>
Example

```console
Select scan type insted (-sL, -Pn, -PS, -PA, -PU)
Enter scan type: -Pn 

```
</pre>


## Final output

<pre>
Example

```console
Failed to resolve "80,443".
Nmap scan report for 192.168.107.93
Host is up (0.0017s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE
53/tcp open  domain
MAC Address: AA:AA:AA:AA:AA:AA (Unknown)

Nmap scan report for 192.168.107.134
Host is up (0.000020s latency).
Not shown: 999 closed tcp ports (reset)
PORT   STATE SERVICE
80/tcp open  http

```
</pre>


## Important Notes

- The script requires `sudo` privileges to run `nmap` with certain scan types.
- Ensure you have the necessary permissions and authorization to perform network scans on the chosen network or IP address.
- resorce... [nmap.org](https://nmap.org/book/man.html)





