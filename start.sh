#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager - start.sh
# ==========================================

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVER_DIR="$ROOT_DIR/servers/Survival"
LOG_DIR="$ROOT_DIR/logs"

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
RESET="\033[0m"

mkdir -p "$LOG_DIR"

echo -e "${YELLOW}Đang kiểm tra Java...${RESET}"

if ! command -v java >/dev/null 2>&1; then
    echo -e "${RED}Java chưa được cài đặt!${RESET}"
    exit 1
fi

JAR=$(find "$SERVER_DIR" -maxdepth 1 -name "*.jar" | head -n 1)

if [ -z "$JAR" ]; then
    echo -e "${RED}Không tìm thấy file .jar trong:${RESET}"
    echo "$SERVER_DIR"
    exit 1
fi

cd "$SERVER_DIR" || exit 1

echo -e "${GREEN}Khởi động server...${RESET}"

if command -v screen >/dev/null 2>&1; then
    screen -dmS mcserver java -Xms1G -Xmx2G -jar "$JAR" nogui
    echo -e "${GREEN}Server đã chạy trong screen (session: mcserver).${RESET}"
else
    java -Xms1G -Xmx2G -jar "$JAR" nogui | tee -a "$LOG_DIR/server.log"
fi
