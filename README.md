# 🛠 MACStalker

MACStalker is an advanced network reconnaissance and MAC address manipulation toolkit designed for wireless and local network environments.  
It is built for penetration testing, network security auditing, and privacy research in authorized systems only.

The tool is compiled using **Nuitka**, providing a standalone high-performance binary with improved execution speed and reduced dependency on Python source files at runtime.

---

# 📖 Overview

MACStalker focuses on two main areas of network security:

### 1. Wireless Network Reconnaissance
The tool is capable of scanning nearby Wi-Fi networks using monitoring techniques. It collects information about access points and identifies connected devices when possible.

This helps in understanding:
- Nearby wireless networks
- Device activity on access points
- Basic wireless environment mapping

---

### 2. Local Network Analysis
MACStalker performs active scanning on local subnets to detect connected devices.

It can:
- Discover devices connected to the same network
- Enumerate IP/MAC combinations
- Provide structured network visibility for testing environments

---

### 3. MAC Address Manipulation
One of the core features of MACStalker is MAC address spoofing.

It allows:
- 🎭 Random MAC generation
- 🎯 Custom MAC address assignment
- 🔄 Restoration of original MAC address

This is useful for:
- Privacy protection
- Testing MAC filtering systems
- Simulating different devices on a network

---

# ⚙️ Technical Design

MACStalker is designed with performance and portability in mind:

- Built using Python
- Compiled with **Nuitka** into a standalone binary
- Optimized for Linux-based systems (especially Kali Linux)
- Uses system-level networking tools for interface control

---

# 🔒 Limitations

While MACStalker is powerful, it has certain limitations:

- Networks using VLAN segmentation may restrict visibility
- Advanced enterprise networks may hide device-level data
- Some Wi-Fi adapters may not support monitor mode
- Requires root privileges for full functionality

---

# ⚠️ Ethical Notice

This tool is intended for:
- Educational purposes
- Authorized penetration testing
- Security research in controlled environments

Unauthorized use against networks you do not own or have explicit permission to test is strictly prohibited.

The developer is not responsible for any misuse of this tool.

---

# 🚀 Key Features Summary

- Wi-Fi network scanning (monitor mode)
- Local subnet device discovery
- MAC address spoofing (random/custom/restore)
- Interactive CLI interface
- Standalone execution via Nuitka binary
- Lightweight and fast performance

---

# 🧠 Use Cases

MACStalker can be used in:

- Cybersecurity learning environments
- Penetration testing labs
- Network auditing tasks
- Privacy and anonymity research
- Wireless security analysis

---

# 📦 Installation (Kali Linux)

```bash
sudo apt update && sudo apt upgrade -y

git clone https://github.com/Ebrahim7752/MACStalker.git

cd MACStalker

chmod +x install.sh

sudo ./install.sh

sudo macstalker
