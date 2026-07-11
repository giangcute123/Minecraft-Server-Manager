#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager - Uninstaller
# ==========================================

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

clear

echo -e "${RED}"
echo "========================================="
echo "     Minecraft Server Manager"
echo "          UNINSTALL"
echo "========================================="
echo -e "${RESET}"

echo "Thư mục sẽ bị xóa:"
echo -e "${CYAN}$ROOT_DIR${RESET}"
echo

read -rp "Bạn có chắc muốn gỡ cài đặt? (y/N): " CONFIRM

case "$CONFIRM" in
    y|Y|yes|YES)

        echo
        echo -e "${YELLOW}Đang dừng các server (nếu có)...${RESET}"

        if [ -f "$ROOT_DIR/core/server_manager.sh" ]; then
            bash "$ROOT_DIR/core/server_manager.sh" stop >/dev/null 2>&1
        fi

        echo -e "${YELLOW}Đang xóa dữ liệu...${RESET}"

        cd ..
        rm -rf "$ROOT_DIR"

        echo
        echo -e "${GREEN}✔ Đã gỡ cài đặt thành công!${RESET}"
        ;;

    *)
        echo
        echo -e "${GREEN}Đã hủy gỡ cài đặt.${RESET}"
        ;;
esac
