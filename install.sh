#!/bin/bash
# ============================================================
#         MACStalker - Installation Script v1.0
#   Network MAC Reconnaissance & Spoofing Toolkit
# ============================================================
# Authors: ibrahim Al-erqi | ibrahim Al-qadhi | Zeyad Tawaf
# ============================================================

# Colors
RED='\033[91m'
GREEN='\033[92m'
YELLOW='\033[93m'
BLUE='\033[94m'
CYAN='\033[96m'
BOLD='\033[1m'
NC='\033[0m'

# ---- Banner ----
echo -e "${CYAN}${BOLD}"
echo "  ███╗   ███╗ █████╗  ██████╗███████╗████████╗ █████╗ ██╗     ██╗  ██╗███████╗██████╗ "
echo "  ████╗ ████║██╔══██╗██╔════╝██╔════╝╚══██╔══╝██╔══██╗██║     ██║ ██╔╝██╔════╝██╔══██╗"
echo "  ██╔████╔██║███████║██║     ███████╗   ██║   ███████║██║     █████╔╝ █████╗  ██████╔╝"
echo "  ██║╚██╔╝██║██╔══██║██║     ╚════██║   ██║   ██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗"
echo "  ██║ ╚═╝ ██║██║  ██║╚██████╗███████║   ██║   ██║  ██║███████╗██║  ██╗███████╗██║  ██║"
echo "  ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${BLUE}${BOLD}         Network MAC Reconnaissance & Spoofing Toolkit${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"

# ---- Check root ----
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}${BOLD}[-] Error: This script must be run with root privileges.${NC}"
    echo -e "${YELLOW}[*] Usage: sudo ./install.sh${NC}"
    exit 1
fi

echo -e "${GREEN}[+] Root privileges confirmed.${NC}\n"

# ---- Check OS ----
if ! command -v apt-get &> /dev/null; then
    echo -e "${RED}[-] This script supports Debian/Ubuntu-based systems only (apt-get not found).${NC}"
    echo -e "${YELLOW}[!] Please install the following packages manually:${NC}"
    echo -e "    • arp-scan"
    echo -e "    • macchanger"
    echo -e "    • aircrack-ng  (includes: airmon-ng, airodump-ng)"
    echo -e "    • iw"
    echo -e "    • wireless-tools  (includes: iwconfig)"
    echo -e "    • net-tools"
    echo -e "    • xterm"
    exit 1
fi

# ---- Update package list ----
echo -e "${BLUE}[*] Updating package list...${NC}"
apt-get update -qq
echo -e "${GREEN}[+] Package list updated.${NC}\n"

# ---- Install dependencies ----
echo -e "${BLUE}[*] Installing required dependencies...${NC}\n"

DEPS=(
    "arp-scan:arp-scan"
    "macchanger:macchanger"
    "aircrack-ng:aircrack-ng"
    "iw:iw"
    "wireless-tools:iwconfig"
    "net-tools:ifconfig"
    "xterm:xterm"
)

ALL_OK=true

for dep in "${DEPS[@]}"; do
    PKG="${dep%%:*}"
    TOOL="${dep##*:}"
    echo -ne "    ${YELLOW}→ Installing ${PKG}...${NC}  "
    if apt-get install -y -qq "$PKG" &>/dev/null; then
        echo -e "${GREEN}✓ Done${NC}"
    else
        echo -e "${RED}✗ Failed${NC}"
        ALL_OK=false
    fi
done

echo ""

if [ "$ALL_OK" = false ]; then
    echo -e "${YELLOW}[!] Warning: Some packages failed to install. The tool may not work fully.${NC}\n"
else
    echo -e "${GREEN}[+] All dependencies installed successfully.${NC}\n"
fi

# ---- Install MACStalker binary ----
echo -e "${BLUE}[*] Installing MACStalker binary...${NC}"

BINARY=""
if [ -f "./MACStalker" ]; then
    BINARY="./MACStalker"
elif [ -f "./build_out/MACStalker.bin" ]; then
    BINARY="./build_out/MACStalker.bin"
else
    echo -e "${RED}[-] Error: MACStalker binary not found!${NC}"
    echo -e "${YELLOW}[*] Make sure the 'MACStalker' file is in the same directory as this script.${NC}"
    exit 1
fi

cp "$BINARY" /usr/local/bin/macstalker
chmod +x /usr/local/bin/macstalker

echo -e "${GREEN}[+] MACStalker installed to: /usr/local/bin/macstalker${NC}\n"

# ---- Final message ----
echo -e "${CYAN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}${BOLD}[+] Installation Complete!${NC}"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
echo -e "  ${BOLD}Run the tool from anywhere using:${NC}"
echo -e ""
echo -e "      ${YELLOW}${BOLD}sudo macstalker${NC}"
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}\n"
