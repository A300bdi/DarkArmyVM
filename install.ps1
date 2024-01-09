# Prompt the user for confirmation
$confirmation = Read-Host "Are you sure you want to install Dark Army VM and penetration testing tools on your system? (Type 'y' to confirm)"

if ($confirmation -eq 'y') {
# Check if Scoop is installed
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Scoop..."
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
    $env:PATH += ";$HOME\scoop\shims;$HOME\scoop\apps\scoop\current\bin"
}
# Check if GitHub CLI is installed
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
 Write-Host "Installing Git using Scoop..."
    scoop install git
   
}
# Check if Python is installed
if (-not (Get-Command python3 -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Python ..."
    scoop install python
}
# Add Scoop buckets
Write-Host "Adding Scoop buckets..."

    scoop bucket add extras
    scoop bucket add nirsoft
    scoop bucket add main
    scoop bucket add nonportable


    # Install DNS Information Gathering Tools
    Write-Host "Installing DNS Information Gathering Tools..."
 
    scoop install main/dnslookup
    Write-Host "- dnslookup: A tool for DNS information gathering."

    scoop install main/nmap
    Write-Host "-NMAP : A tool for Information gathering."

  
    scoop install nirsoft/dnsdataview
    Write-Host "- DNSDataView: View the DNS records of specified domains."

    scoop install main/dnsproxy
    Write-Host "- DNSProxy: A simple DNS proxy server."

    # Install Network Monitoring Tools
    Write-Host "Installing Network Monitoring Tools..."
    scoop install extras/wireshark
    Write-Host "- Wireshark: A network protocol analyzer."

    scoop install extras/networkminer
    Write-Host "- NetworkMiner: Network forensic analysis tool."

    scoop install nirsoft/networkinterfacesview
    Write-Host "- NetworkInterfacesView: View the details of all network adapters."

    scoop install extras/sniffnet
    Write-Host "- SniffNet: A simple network sniffer."

    scoop install nirsoft/sniffpass
    Write-Host "- SniffPass: Password monitoring and recovery tool."

    scoop install extras/aircrack-ng
    Write-Host "- Aircrack-ng: A suite of tools for wireless security."

    scoop install extras/zaproxy
    Write-Host "- ZAP Proxy: An OWASP tool for finding vulnerabilities in web applications."

    # Install Vulnerability Assessment Tools
    Write-Host "Installing Vulnerability Assessment Tools..."
    scoop install main/gobuster
    Write-Host "- Gobuster: Directory and file brute-forcing tool."

    scoop install main/trivy
    Write-Host "- Trivy: A simple and comprehensive vulnerability scanner."

    scoop install main/kubescape
    Write-Host "- Kubescape: Scans Kubernetes clusters for security issues."

    scoop install main/nancy
    Write-Host "- Nancy: A tool to check the security of a .NET web application."

    # Install Hash Cracking and Hash Information Tools
    Write-Host "Installing Hash Cracking and Hash Information Tools..."
    scoop install main/hashcat
    Write-Host "- Hashcat: An advanced password recovery utility."

    scoop install main/rhash
    Write-Host "- Rhash: Generate and verify hash sums."

    scoop install main/dirhash
    Write-Host "- Dirhash: Calculate a hash value for a directory."

    scoop install extras/hasher
    Write-Host "- Hasher: A simple Windows hash generator/checker."

    scoop install extras/hashcheck
    Write-Host "- HashCheck: A shell extension for calculating and verifying file hashes."

    
    scoop install nonportable/openhashtab-np
    Write-Host "- OpenHashTab: A shell extension to compare hash values."

    # Install Exploitation Tools
    Write-Host "Installing Exploitation Tools..."
    scoop install extras/metasploit-framework
    Write-Host "- Metasploit Framework: A penetration testing framework."

    Write-Host "Installation completed successfully."
} else {
    Write-Host "Installation aborted."
}