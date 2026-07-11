#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager
# download_server.sh
# ==========================================

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SERVER_DIR="$ROOT_DIR/servers/Survival"

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

mkdir -p "$SERVER_DIR"

clear

echo -e "${CYAN}"
echo "========================================="
echo "      Download Minecraft Server"
echo "========================================="
echo -e "${RESET}"

echo "1. Paper"
echo "2. Purpur"
echo "3. Fabric"
echo "4. Forge"
echo "5. Vanilla"
echo

read -rp "Chọn loại server: " TYPE

echo
read -rp "Nhập phiên bản (ví dụ: 1.21.4): " VERSION
echo

case "$TYPE" in
1) SOFTWARE="Paper" ;;
2) SOFTWARE="Purpur" ;;
3) SOFTWARE="Fabric" ;;
4) SOFTWARE="Forge" ;;
5) SOFTWARE="Vanilla" ;;
*)
    echo -e "${RED}Lựa chọn không hợp lệ!${RESET}"
    exit 1
    ;;
esac

echo "Bạn đã chọn:"
echo "Software : $SOFTWARE"
echo "Version  : $VERSION"
echo

echo -e "${YELLOW}Dán URL tải server (.jar):${RESET}"
read -rp "> " URL

if [ -z "$URL" ]; then
    echo -e "${RED}URL không được để trống.${RESET}"
    exit 1
fi

echo
echo -e "${YELLOW}Đang tải server...${RESET}"

if command -v curl >/dev/null 2>&1; then
    curl -L "$URL" -o "$SERVER_DIR/server.jar"
else
    wget -O "$SERVER_DIR/server.jar" "$URL"
fi

if [ $? -eq 0 ]; then
    echo -e "${GREEN}"
    echo "========================================="
    echo "✔ Tải server thành công!"
    echo "Đường dẫn:"
    echo "$SERVER_DIR/server.jar"
    echo "========================================="
    echo -e "${RESET}"
else
    echo -e "${RED}Tải thất bại.${RESET}"
    exit 1
fi

echo
read -rp "Nhấn ENTER để tiếp tục..."
