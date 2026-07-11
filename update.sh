#!/data/data/com.termux/files/usr/bin/bash
# ==========================================
# Minecraft Server Manager - Update
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
echo "     Minecraft Server Manager Update"
echo "=========================================="
echo -e "${RESET}"

echo -e "${YELLOW}[1/4] Cập nhật danh sách gói...${RESET}"
pkg update -y

echo -e "${YELLOW}[2/4] Nâng cấp các gói...${RESET}"
pkg upgrade -y

echo -e "${YELLOW}[3/4] Kiểm tra Git...${RESET}"

if [ -d "$ROOT_DIR/.git" ]; then
    cd "$ROOT_DIR" || exit 1

    git fetch origin

    LOCAL=$(git rev-parse HEAD)
    REMOTE=$(git rev-parse origin/$(git branch --show-current))

    if [ "$LOCAL" != "$REMOTE" ]; then
        echo -e "${GREEN}Có bản cập nhật mới.${RESET}"
        git pull --rebase
    else
        echo -e "${GREEN}Bạn đang dùng phiên bản mới nhất.${RESET}"
    fi
else
    echo -e "${RED}Không tìm thấy Git repository."
    echo "Bỏ qua bước cập nhật mã nguồn.${RESET}"
fi

echo -e "${YELLOW}[4/4] Cấp lại quyền thực thi...${RESET}"

find "$ROOT_DIR" -name "*.sh" -exec chmod +x {} \;

echo
echo -e "${GREEN}=========================================="
echo "✔ Cập nhật hoàn tất!"
echo "=========================================="
echo -e "${RESET}"

read -rp "Nhấn ENTER để quay lại menu..."
