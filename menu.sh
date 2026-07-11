#!/data/data/com.termux/files/usr/bin/bash

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

GREEN="\e[1;32m"
CYAN="\e[1;36m"
BLUE="\e[1;34m"
YELLOW="\e[1;33m"
RED="\e[1;31m"
WHITE="\e[1;37m"
RESET="\e[0m"

pause() {
    echo
    read -rp "Nhấn ENTER để tiếp tục..."
}

header() {
    clear

    RAM=$(free -h 2>/dev/null | awk '/Mem:/ {print $3"/"$2}')
    CPU=$(uname -m)
    JAVA=$(java -version 2>&1 | head -n1 | cut -d'"' -f2)

    echo -e "${CYAN}"
cat << "EOF"
███╗   ███╗ ██████╗
████╗ ████║██╔════╝
██╔████╔██║██║
██║╚██╔╝██║██║
██║ ╚═╝ ██║╚██████╗
╚═╝     ╚═╝ ╚═════╝

███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗
██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗
███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝
╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗
███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║
╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝
EOF
    echo -e "${RESET}"

    echo -e "${BLUE}╔════════════════════════════════════════════╗${RESET}"
    printf "${WHITE}║ %-42s ║${RESET}\n" " Minecraft Server Manager v1.0"
    printf "${WHITE}║ %-42s ║${RESET}\n" " CPU  : $CPU"
    printf "${WHITE}║ %-42s ║${RESET}\n" " RAM  : ${RAM:-Không xác định}"
    printf "${WHITE}║ %-42s ║${RESET}\n" " Java : ${JAVA:-Chưa cài}"
    echo -e "${BLUE}╚════════════════════════════════════════════╝${RESET}"
    echo
}

while true; do
    header

    echo -e "${GREEN}[1]${RESET} ☕ Cài Java"
    echo -e "${GREEN}[2]${RESET} 📥 Tải Server"
    echo -e "${GREEN}[3]${RESET} ▶ Start Server"
    echo -e "${GREEN}[4]${RESET} ■ Stop Server"
    echo -e "${GREEN}[5]${RESET} 🔄 Restart Server"
    echo -e "${GREEN}[6]${RESET} 📊 Trạng thái Server"
    echo -e "${GREEN}[7]${RESET} 📦 Plugin Manager"
    echo -e "${GREEN}[8]${RESET} 💾 Backup Server"
    echo -e "${GREEN}[9]${RESET} 🌐 Web Panel"
    echo -e "${GREEN}[10]${RESET} 📱 Cài Geyser"
    echo -e "${GREEN}[11]${RESET} 🔑 Cài Floodgate"
    echo -e "${GREEN}[12]${RESET} 🔥 Firewall"
    echo -e "${GREEN}[13]${RESET} ⬆ Kiểm tra cập nhật"
    echo
    echo -e "${RED}[0]${RESET} ❌ Thoát"
    echo
    read -rp "➜ Chọn chức năng: " choice

    case "$choice" in
        1) bash "$ROOT_DIR/core/install_java.sh" ;;
        2) bash "$ROOT_DIR/core/download_server.sh" ;;
        3) bash "$ROOT_DIR/core/server_manager.sh" start ;;
        4) bash "$ROOT_DIR/core/server_manager.sh" stop ;;
        5) bash "$ROOT_DIR/core/server_manager.sh" restart ;;
        6) bash "$ROOT_DIR/core/server_manager.sh" status ;;
        7) bash "$ROOT_DIR/core/plugin_manager.sh" ;;
        8) bash "$ROOT_DIR/core/backup_manager.sh" ;;
        9) bash "$ROOT_DIR/core/webpanel.sh" ;;
        10) bash "$ROOT_DIR/core/geyser.sh" ;;
        11) bash "$ROOT_DIR/core/floodgate.sh" ;;
        12) bash "$ROOT_DIR/core/firewall.sh" ;;
        13) bash "$ROOT_DIR/core/update_checker.sh" ;;
        0)
            clear
            echo -e "${GREEN}Cảm ơn đã sử dụng Minecraft Server Manager!${RESET}"
            exit 0
            ;;
        *)
            echo -e "${RED}Lựa chọn không hợp lệ!${RESET}"
            sleep 1
            ;;
    esac

    pause
done
