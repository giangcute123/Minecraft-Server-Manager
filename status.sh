#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager - status.sh
# ==========================================

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

SERVER_NAME="mcserver"
PID_FILE="$ROOT_DIR/server.pid"

clear

echo -e "${CYAN}"
echo "==============================================="
echo "        Minecraft Server Manager"
echo "           SERVER STATUS"
echo "==============================================="
echo -e "${RESET}"

# Java
if command -v java >/dev/null 2>&1; then
    JAVA_VERSION=$(java -version 2>&1 | head -n1 | cut -d'"' -f2)
else
    JAVA_VERSION="Chưa cài"
fi

# RAM
RAM=$(free -h 2>/dev/null | awk '/Mem:/ {print $3 " / " $2}')
[ -z "$RAM" ] && RAM="Không xác định"

# CPU
CPU=$(uname -m)

echo -e "${WHITE}Java : ${GREEN}$JAVA_VERSION${RESET}"
echo -e "${WHITE}CPU  : ${GREEN}$CPU${RESET}"
echo -e "${WHITE}RAM  : ${GREEN}$RAM${RESET}"
echo

RUNNING=false

# Kiểm tra screen
if command -v screen >/dev/null 2>&1; then
    if screen -list | grep -q "$SERVER_NAME"; then
        RUNNING=true
        echo -e "${GREEN}✔ Server đang chạy (Screen: $SERVER_NAME)${RESET}"
    fi
fi

# Kiểm tra PID
if [ "$RUNNING" = false ] && [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")

    if kill -0 "$PID" 2>/dev/null; then
        RUNNING=true
        echo -e "${GREEN}✔ Server đang chạy (PID: $PID)${RESET}"
    fi
fi

if [ "$RUNNING" = false ]; then
    echo -e "${RED}✖ Server đang tắt${RESET}"
fi

echo
echo "==============================================="

read -rp "Nhấn ENTER để tiếp tục..."
