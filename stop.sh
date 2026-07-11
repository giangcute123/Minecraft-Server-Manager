#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager - stop.sh
# ==========================================

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RESET="\033[0m"

SERVER_NAME="mcserver"
PID_FILE="$ROOT_DIR/server.pid"

clear

echo -e "${CYAN}"
echo "=========================================="
echo "      Minecraft Server Manager"
echo "            STOP SERVER"
echo "=========================================="
echo -e "${RESET}"

# Dừng server chạy bằng screen
if command -v screen >/dev/null 2>&1; then
    if screen -list | grep -q "$SERVER_NAME"; then
        echo -e "${YELLOW}Đang gửi lệnh stop...${RESET}"

        screen -S "$SERVER_NAME" -p 0 -X stuff "stop$(printf '\r')"

        sleep 8

        if screen -list | grep -q "$SERVER_NAME"; then
            echo -e "${YELLOW}Server chưa thoát, đóng screen...${RESET}"
            screen -S "$SERVER_NAME" -X quit
        fi

        echo -e "${GREEN}✔ Server đã dừng.${RESET}"
        exit 0
    fi
fi

# Dừng bằng PID nếu có
if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")

    if kill -0 "$PID" 2>/dev/null; then
        echo -e "${YELLOW}Đang dừng tiến trình ${PID}...${RESET}"
        kill "$PID"

        sleep 3

        if kill -0 "$PID" 2>/dev/null; then
            echo -e "${RED}Tiến trình chưa dừng, buộc dừng...${RESET}"
            kill -9 "$PID"
        fi

        rm -f "$PID_FILE"

        echo -e "${GREEN}✔ Server đã dừng.${RESET}"
        exit 0
    fi
fi

echo -e "${RED}Không tìm thấy server đang chạy.${RESET}"
exit 1
