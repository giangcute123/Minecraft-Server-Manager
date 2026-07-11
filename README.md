# Minecraft Server Manager

Minecraft Server Manager là công cụ quản lý máy chủ Minecraft chạy trên **Termux** hoặc **Linux**, hỗ trợ cài đặt, quản lý, sao lưu và cập nhật nhiều loại server.

---

# Tính năng

- Hỗ trợ Paper
- Hỗ trợ Purpur
- Hỗ trợ Fabric
- Hỗ trợ Forge
- Hỗ trợ Vanilla

- Cài đặt Java tự động
- Tự động tải server
- Start / Stop / Restart Server
- Kiểm tra trạng thái Server
- Quản lý nhiều Server
- Backup & Restore
- Plugin Manager
- Web Panel
- Geyser
- Floodgate
- Firewall
- Auto Update
- Auto Restart
- Discord Webhook
- Nhật ký (Logs)

---

# Cấu trúc dự án

```text
Minecraft-Server-Manager/
├── install.sh
├── uninstall.sh
├── update.sh
├── start.sh
├── stop.sh
├── restart.sh
├── status.sh
├── menu.sh
├── config.json
├── README.md
├── core/
├── plugins/
├── templates/
├── web/
├── servers/
├── backups/
└── logs/
```

---

# Yêu cầu

- Android (Termux) hoặc Linux
- Bash
- Git
- Curl
- Wget
- Tar
- OpenJDK 17 hoặc OpenJDK 21

---

# Cài đặt

```bash
git clone https://github.com/yourname/Minecraft-Server-Manager.git
cd Minecraft-Server-Manager
chmod +x *.sh
bash install.sh
```

---

# Chạy Menu

```bash
bash menu.sh
```

---

# Lệnh

Khởi động server

```bash
bash start.sh
```

Dừng server

```bash
bash stop.sh
```

Khởi động lại

```bash
bash restart.sh
```

Kiểm tra trạng thái

```bash
bash status.sh
```

Cập nhật

```bash
bash update.sh
```

Gỡ cài đặt

```bash
bash uninstall.sh
```

---

# Plugin được hỗ trợ

- EssentialsX
- LuckPerms
- Vault
- PlaceholderAPI
- ViaVersion
- ViaBackwards
- CoreProtect
- WorldEdit
- WorldGuard
- Geyser
- Floodgate
- GrimAC
- spark

---

# Cấu hình

Chỉnh sửa file

```text
config.json
```

Ví dụ:

```json
{
  "server": {
    "software": "paper",
    "version": "1.21.4",
    "memory": "4G"
  }
}
```

---

# Backup

Backup sẽ được lưu tại:

```text
backups/
```

---

# Web Panel

Thư mục:

```text
web/
```

Mặc định:

```
http://localhost:8080
```

---

# Hỗ trợ

Nếu gặp lỗi hãy kiểm tra:

- Đã cài Java
- Đã chấp nhận EULA
- Đúng phiên bản Minecraft
- Cổng chưa bị sử dụng

---

# Giấy phép

MIT License

---

# Phiên bản

Current Version:

```
v1.0.0
```
