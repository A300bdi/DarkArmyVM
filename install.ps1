# Specify the path to the image file you want to set as the wallpaper
$wallpaperPath = "C:\Users\IEUser\Downloads\DarkArmyVM-main\DarkArmyVM-main\Dark_Army-red-f.jpg"

# Use the SystemParametersInfo function to set the desktop wallpaper
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

# Constants for SystemParametersInfo function
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02

# Set the wallpaper without admin privileges
try {
    # Set the wallpaper for the current user
    [Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $wallpaperPath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
    
    # Output success message
    Write-Host "Desktop wallpaper changed to: $wallpaperPath"
}
catch {
    # Output error message
    Write-Host "Failed to change desktop wallpaper. Ensure the file exists and is accessible."
}

# Specify the directory to install the tools
$installDirectory = "$env:USERPROFILE\Desktop"

# Display ASCII Art
Write-Host @"
                                                                                          
▀███▀▀▀██▄                 ▀███                ██                                         
  ██    ▀██▄                 ██               ▄██▄                                        
  ██     ▀██▄█▀██▄ ▀███▄███  ██  ▄██▀        ▄█▀██▄   ▀███▄███▀████████▄█████▄ ▀██▀   ▀██▀
  ██      ███   ██   ██▀ ▀▀  ██ ▄█          ▄█  ▀██     ██▀ ▀▀  ██    ██    ██   ██   ▄█  
  ██     ▄██▄█████   ██      ██▄██          ████████    ██      ██    ██    ██    ██ ▄█   
  ██    ▄██▀█   ██   ██      ██ ▀██▄       █▀      ██   ██      ██    ██    ██     ███    
▄████████▀ ▀████▀██▄████▄  ▄████▄ ██▄▄   ▄███▄   ▄████▄████▄  ▄████  ████  ████▄   ▄█     
                                                                                 ▄█       
                                                                               ██▀        
"@

# Prompt the user for confirmation
$confirmation = Read-Host "Are you sure you want to install Dark Army VM and penetration testing tools on your system? (Type 'y' to confirm)"

if ($confirmation -eq 'y') {
    # Check if Scoop is installed
    if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Scoop..."
        iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
        $env:PATH += ";$HOME\scoop\shims;$HOME\scoop\apps\scoop\current\bin"
    }
    
    # Check if Git is installed using Scoop
    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Git using Scoop..."
        scoop install git
    }
    
    # Check if Python is installed using Scoop
    if (-not (Get-Command python3 -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Python using Scoop..."
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
    Write-Host "- NMAP: A tool for Information gathering."
    
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
    
    scoop install nonportable/burp-suite-community-np
    Write-Host "- Burp-suite-community: An application that comes with set of tools used for penetration and security testing of web application."
    
    scoop install nonportable/burp-suite-pro-np
    Write-Host "- Burp-suite-pro: An application that comes with set of tools used for penetration and security testing of web application."
    
    
    #Install spoofing and sniffing tools
    Write-Host "Installation of Spoofing and Sniffing Tools..."
    scoop install main/proxychains
    Write-Host "- proxychains: Windows port of proxychains, based on MiniHook and DLL Injection."
    
    scoop install extras/mitmproxy
    Write-Host "- mitmproxy: A free and open source interactive HTTPS proxy."
    
    
    
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
    
    #Install Reverse Engineering Tools
    Write-Host "Installing Reverse Engineering Tools..."
    scoop install extras/ghidra
    Write-Host "- Ghidra: A software reverse engineering (SRE) framework."
    
    scoop install extras/onionshare
    Write-Host "- onionshare: Securely and Anonymously send and receive files."
    
    scoop install extras/x64dbg
    Write-Host "- x64dbg: x64dbg is an open-source debugger for Windows that is a popular reverse engineering Tool."
    
    scoop install extras/cheat-engine
    Write-Host "- cheat-engine: Tool for modifying/debugging single application."
    
    scoop install extras/hxd
    Write-Host "- hxd: HEx and Disk Editor."
    
    scoop install extras/rehex
    Write-Host "- rehex: Hex editor for reverse engineering."
    
    scoop install extras/imhex
    Write-Host "- imhex: hex editor."
    
    scoop install extras/peid
    Write-Host "- peid: Detects most common packers, cryptors and compilers for PE files. Supports more than 470 different signatures in PE files."
    
    scoop install extras/exeinfo-pe
    Write-Host "- exeinfo-pe: EXE analyzer inspired by PEID."
    
    scoop install extras/processhacker
    Write-Host "- processhacker: A powerful, multi-purpose tool that helps you monitor system resources, debug software and detect malware."
    
    scoop install main/hackernews-tui
    Write-Host "- hackernews-tui: A fast and customizable application for browsing Hacker News on the terminal."
    
    scoop install extras/resource-hacker
    Write-Host "- resource-hacker: Resource compiler & decompiler for Windows applications."
    
    scoop install main/bottom
    Write-Host "- bottom: Graphical process/system monitor."
    
    scoop install main/radare2
    Write-Host "- radare2: UNIX-like reverse engineering framework and command-line toolset."
    
    #Install text editors
    Write-Host "Installing text editor for reporting..."
    scoop install extras/wpsoffice
    Write-Host "- Complete office suite."
    
    scoop install extras/gedit
    Write-Host "- A powerful general purpose text editor."
    
    Write-Host "Installation completed successfully."
    
    # Move installed tools to the desktop
    Write-Host "Moving installed tools to the desktop..."
    Get-ChildItem -Path $installDirectory | Move-Item -Destination $env:USERPROFILE\Desktop -Force
    Write-Host "Tools moved to desktop."
} else {
    Write-Host "Installation aborted."
}
