#!/bin/bash

### vnStat 2.12 Terminal Menu Script by ChatGPT (English, Professional with Self-Install Option)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color
 
SCRIPT_URL="https://raw.githubusercontent.com/abdolahi40/vnStat-Manager-Script/master/vnstat-manager.sh"
INSTALL_PATH="/usr/local/bin/vnstatscript"

function print_line() {
    echo -e "${WHITE}────────────────────────────────────────────${NC}"
}

function install_self() {
    echo -e "${CYAN}Installing vnStat manager script to ${INSTALL_PATH} ...${NC}"
    sudo curl -fsSL "$SCRIPT_URL" -o "$INSTALL_PATH"
    sudo chmod +x "$INSTALL_PATH"
    echo -e "${GREEN}✅ Installation complete!${NC}"
    echo -e "${GREEN}You can now run the script anytime by typing: vnstatscript${NC}"
    read -rp "Press Enter to continue..."
}

function install_vnstat() {
    clear
    echo -e "${GREEN}Installing vnStat...${NC}"
    sudo apt update && sudo apt install vnstat -y
    sudo systemctl enable --now vnstat
    echo -e "${GREEN}✅ Installation and service started.${NC}"
    read -rp "Press Enter to continue..."
}

function report_fiveminutes() {
    clear
    echo -e "${MAGENTA}📊 Last 5 Minutes Traffic${NC}"
    print_line
    vnstat -5
    echo ""
    read -rp "Press Enter to continue..."
}

function report_hours() {
    clear
    echo -e "${MAGENTA}📊 Hourly Traffic${NC}"
    print_line
    vnstat -h
    echo ""
    read -rp "Press Enter to continue..."
}

function report_hours_graph() {
    clear
    echo -e "${MAGENTA}📈 Hourly Traffic Graph${NC}"
    print_line
    vnstat -hg
    echo ""
    read -rp "Press Enter to continue..."
}

function report_days() {
    clear
    echo -e "${YELLOW}📊 Daily Traffic${NC}"
    print_line
    vnstat -d
    echo ""
    read -rp "Press Enter to continue..."
}

function report_months() {
    clear
    echo -e "${YELLOW}📊 Monthly Traffic${NC}"
    print_line
    vnstat -m
    echo ""
    read -rp "Press Enter to continue..."
}

function report_years() {
    clear
    echo -e "${YELLOW}📊 Yearly Traffic${NC}"
    print_line
    vnstat -y
    echo ""
    read -rp "Press Enter to continue..."
}

function report_top() {
    clear
    echo -e "${YELLOW}📊 Top Traffic Days${NC}"
    print_line
    vnstat -t
    echo ""
    read -rp "Press Enter to continue..."
}

function report_custom_range() {
    clear
    echo -e "${CYAN}🔧 Custom Date Range Report${NC}"
    print_line
    read -rp "Enter start date (YYYY-MM-DD): " start_date
    read -rp "Enter end date (YYYY-MM-DD): " end_date
    clear
    echo -e "${CYAN}📊 Traffic from ${start_date} to ${end_date}${NC}"
    print_line
    vnstat -b "$start_date" -e "$end_date"
    echo ""
    read -rp "Press Enter to continue..."
}

function live_report() {
    clear
    echo -e "${CYAN}📶 Live Traffic Monitor (Press Ctrl+C to stop)${NC}"
    print_line
    vnstat -l
}

function interface_list() {
    clear
    echo -e "${GREEN}🔎 Available Network Interfaces${NC}"
    print_line
    vnstat --iflist
    echo ""
    read -rp "Press Enter to continue..."
}

function report_interface() {
    interface_list
    read -rp "Enter interface name (e.g., eth0): " iface
    clear
    echo -e "${GREEN}📊 Traffic Report for Interface '${iface}'${NC}"
    print_line
    vnstat -i "$iface"
    echo ""
    read -rp "Press Enter to continue..."
}

function force_update() {
    clear
    echo -e "${GREEN}🔄 Forcing vnStat Database Update${NC}"
    print_line
    read -rp "Enter interface name to update (default eth0): " iface
    iface=${iface:-eth0}
    sudo vnstat -u -i "$iface"
    sudo systemctl restart vnstat
    echo -e "${GREEN}✅ Database updated for interface '$iface'.${NC}"
    read -rp "Press Enter to continue..."
}

function uninstall_vnstat() {
    clear
    echo -e "${RED}⚠️ Uninstalling vnStat...${NC}"
    print_line
    sudo systemctl stop vnstat
    sudo apt purge vnstat -y
    sudo rm -rf /var/lib/vnstat
    sudo apt autoremove -y
    echo -e "${RED}❌ vnStat has been removed.${NC}"
    read -rp "Press Enter to continue..."
}

while true; do
    clear
    echo -e "${GREEN}════════════════════════════════════════════${NC}"
    echo -e "${GREEN}            vnStat 2.12 Main Menu            ${NC}"
    echo -e "${GREEN}════════════════════════════════════════════${NC}"
    echo -e "${YELLOW}▶ Installation & Maintenance${NC}"
    echo -e "  ${CYAN}1)${NC} Install vnStat"
    echo -e "  ${CYAN}2)${NC} Install This Script as 'vnstatscript' Command"
    echo -e "  ${CYAN}3)${NC} Force Database Update"
    echo -e "  ${CYAN}4)${NC} Uninstall vnStat"
    print_line
    echo -e "${YELLOW}▶ Live Monitoring${NC}"
    echo -e "  ${CYAN}5)${NC} Live Traffic Monitor"
    print_line
    echo -e "${YELLOW}▶ Traffic Reports${NC}"
    echo -e "  ${MAGENTA}6)${NC} Show Last 5 Minutes Traffic"
    echo -e "  ${MAGENTA}7)${NC} Show Hourly Traffic"
    echo -e "  ${MAGENTA}8)${NC} Show Hourly Traffic Graph"
    echo -e "  ${YELLOW}9)${NC} Show Daily Traffic"
    echo -e "  ${YELLOW}10)${NC} Show Monthly Traffic"
    echo -e "  ${YELLOW}11)${NC} Show Yearly Traffic"
    echo -e "  ${YELLOW}12)${NC} Show Top Traffic Days"
    echo -e "  ${CYAN}13)${NC} Custom Date Range Traffic Report"
    print_line
    echo -e "${YELLOW}▶ Interface Management${NC}"
    echo -e "  ${GREEN}14)${NC} Show Available Interfaces"
    echo -e "  ${GREEN}15)${NC} Traffic Report for Specific Interface"
    print_line
    echo -e "${RED}0) Exit${NC}"
    echo -ne "\n${WHITE}Choose an option: ${NC}"
    read -r choice
    case $choice in
        1) install_vnstat ;;
        2) install_self ;;
        3) force_update ;;
        4) uninstall_vnstat ;;
        5) live_report ;;
        6) report_fiveminutes ;;
        7) report_hours ;;
        8) report_hours_graph ;;
        9) report_days ;;
        10) report_months ;;
        11) report_years ;;
        12) report_top ;;
        13) report_custom_range ;;
        14) interface_list ;;
        15) report_interface ;;
        0) clear; echo -e "${GREEN}Goodbye!${NC}"; exit 0 ;;
        *) echo -e "${RED}Invalid option! Please try again.${NC}"; sleep 1 ;;
    esac
done
