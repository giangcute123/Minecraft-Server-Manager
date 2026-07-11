#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager - restart.sh
# ==========================================

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

clear

echo -e "${CYAN}"
echo "=========================================="
echo "      Minecraft Server Manager"
echo "          RESTART SERVER"
echo "=========================================="
echo -e "${RESET}"

# Kiểm tra file
if [ ! -f "$ROOT_DIR/stop.sh" ]; then
    echo -e "${RED}Không tìm thấy stop.sh${RESET}"
    exit 1
fi

if [ ! -f "$ROOT_DIR/start.sh" ]; then
    echo -e "${RED}Không tìm thấy start.sh${RESET}"
    exit 1
fi

echo -e "${YELLOW}[1/3] Đang dừng server...${RESET}"
bash "$ROOT_DIR/stop.sh"

echo -e "${YELLOW}[2/3] Chờ server tắt hoàn toàn...${RESET}"
sleep 5

echo -e "${YELLOW}[3/3] Đang khởi động lại server...${RESET}"
bash "$ROOT_DIR/start.sh"

if [ $? -eq 0 ]; then
    echo
    echo -e "${GREEN}=========================================="
    echo "✔ Server đã khởi động lại thành công!"
    echo "=========================================="
    echo -e "${RESET}"
else
    echo
    echo -e "${RED}=========================================="
    echo "✖ Khởi động lại thất bại!"
    echo "=========================================="
    echo -e "${RESET}"
    exit 1
fi

read -rp "Nhấn ENTER để tiếp tục..."
