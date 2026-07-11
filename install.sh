#!/usr/bin/env bash

set -e

PROJECT="Minecraft-Server-Manager"
VERSION="1.0.0"

GREEN="\e[32m"
RED="\e[31m"
BLUE="\e[34m"
YELLOW="\e[33m"
RESET="\e[0m"

msg() {
    echo -e "${GREEN}[INFO]${RESET} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
}

err() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

clear

echo -e "${BLUE}"
echo "======================================"
echo " Minecraft Server Manager Installer"
echo " Version $VERSION"
echo "======================================"
echo -e "${RESET}"

if command -v pkg >/dev/null 2>&1; then
    OS="termux"
elif command -v apt >/dev/null 2>&1; then
    OS="linux"
else
    err "Hệ điều hành không được hỗ trợ."
    exit 1
fi

msg "Đã phát hiện: $OS"

if [ "$OS" = "termux" ]; then
    pkg update -y
    pkg upgrade -y
    pkg install -y \
        git \
        curl \
        wget \
        jq \
        unzip \
        tar \
        nano \
        openssl \
        openjdk-21
else
    sudo apt update
    sudo apt install -y \
        git \
        curl \
        wget \
        jq \
        unzip \
        tar \
        nano \
        openjdk-21-jdk
fi

mkdir -p core
mkdir -p web
mkdir -p templates/paper
mkdir -p templates/purpur
mkdir -p templates/fabric
mkdir -p templates/forge
mkdir -p templates/vanilla
mkdir -p plugins
mkdir -p servers
mkdir -p backups

cat > config.json <<EOF
{
  "java":"java",
  "ram":"2G",
  "default_server":"Paper",
  "version":"latest",
  "webpanel":true
}
EOF

msg "Đã tạo config.json"

echo
echo "Chọn loại server:"
echo "1) Paper"
echo "2) Purpur"
echo "3) Fabric"
echo "4) Forge"
echo "5) Vanilla"

read -p "Lựa chọn: " TYPE

case "$TYPE" in
1) SERVER="Paper";;
2) SERVER="Purpur";;
3) SERVER="Fabric";;
4) SERVER="Forge";;
5) SERVER="Vanilla";;
*) SERVER="Paper";;
esac

msg "Server: $SERVER"

mkdir -p "servers/$SERVER"

cat > "servers/$SERVER/eula.txt" <<EOF
eula=true
EOF

cat > "servers/$SERVER/start.sh" <<EOF
#!/bin/bash
java -Xms1G -Xmx2G -jar server.jar nogui
EOF

chmod +x "servers/$SERVER/start.sh"

warn "Chưa tải server.jar."
warn "Trong các bước tiếp theo, download_server.sh sẽ tự tải đúng phiên bản."

echo
msg "Hoàn tất cài đặt cơ bản!"
echo
echo "Thư mục dự án:"
pwd
echo
echo "Bước tiếp theo:"
echo "  ./menu.sh"
