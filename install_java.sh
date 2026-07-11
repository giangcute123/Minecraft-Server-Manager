#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager
# install_java.sh
# ==========================================

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

clear

echo -e "${CYAN}"
echo "========================================="
echo "        Java Installer"
echo "========================================="
echo -e "${RESET}"

# Kiểm tra Java
if command -v java >/dev/null 2>&1; then
    VERSION=$(java -version 2>&1 | head -n1)
    echo -e "${GREEN}Java đã được cài đặt.${RESET}"
    echo "$VERSION"
    echo
    read -rp "Bạn có muốn cài lại? (y/N): " ANS
    case "$ANS" in
        y|Y|yes|YES) ;;
        *) exit 0 ;;
    esac
fi

echo
echo "Chọn phiên bản Java:"
echo "1. OpenJDK 17"
echo "2. OpenJDK 21"
echo

read -rp "Lựa chọn: " CHOICE

# Phát hiện Termux
if [ -d "/data/data/com.termux/files/usr" ]; then
    PKG_INSTALL="pkg install -y"
    PKG_UPDATE="pkg update -y"
else
    if command -v apt >/dev/null 2>&1; then
        PKG_INSTALL="sudo apt install -y"
        PKG_UPDATE="sudo apt update"
    elif command -v dnf >/dev/null 2>&1; then
        PKG_INSTALL="sudo dnf install -y"
        PKG_UPDATE="sudo dnf makecache"
    elif command -v pacman >/dev/null 2>&1; then
        PKG_INSTALL="sudo pacman -Sy --noconfirm"
        PKG_UPDATE="sudo pacman -Sy"
    else
        echo -e "${RED}Không hỗ trợ trình quản lý gói trên hệ thống này.${RESET}"
        exit 1
    fi
fi

echo
echo -e "${YELLOW}Đang cập nhật danh sách gói...${RESET}"
eval "$PKG_UPDATE"

case "$CHOICE" in
    1)
        echo -e "${YELLOW}Đang cài OpenJDK 17...${RESET}"

        if [ -d "/data/data/com.termux/files/usr" ]; then
            $PKG_INSTALL openjdk-17
        else
            $PKG_INSTALL openjdk-17-jdk || $PKG_INSTALL openjdk-17
        fi
        ;;

    2)
        echo -e "${YELLOW}Đang cài OpenJDK 21...${RESET}"

        if [ -d "/data/data/com.termux/files/usr" ]; then
            $PKG_INSTALL openjdk-21
        else
            $PKG_INSTALL openjdk-21-jdk || $PKG_INSTALL openjdk-21
        fi
        ;;

    *)
        echo -e "${RED}Lựa chọn không hợp lệ.${RESET}"
        exit 1
        ;;
esac

echo
if command -v java >/dev/null 2>&1; then
    echo -e "${GREEN}✔ Cài đặt Java thành công!${RESET}"
    java -version
else
    echo -e "${RED}✖ Cài đặt Java thất bại.${RESET}"
    exit 1
fi

echo
read -rp "Nhấn ENTER để quay lại menu..."
