#!/bin/bash

# ==========================================
# LFCS - Monitoring & Disk Usage Script
# ==========================================

echo "===== SYSTEM MONITORING ====="

# CPU / RAM interactive tool (manuel)
echo "[INFO] Run 'top' manually if needed"
# top  # (décommenter si exécuté en mode interactif)

# Processus les plus gourmands en mémoire
echo "[INFO] Top processes by memory usage"
ps aux --sort=-%mem | head

echo ""
echo "[INFO] Top processes by CPU usage"
ps aux --sort=-%cpu | head

echo ""
echo "[INFO] Open network ports / sockets"
ss -tulpn

echo ""
echo "[INFO] System errors since boot"
journalctl -p err -b

echo ""
echo "===== DISK USAGE ====="

echo "[INFO] Disk space usage"
df -h

echo ""
echo "[INFO] Largest directories (root level)"
du -sh /* 2>/dev/null | sort -h

echo ""
echo "[INFO] Searching large files (>10MB) in /var"
find /var -type f -size +10M 2>/dev/null

echo ""
echo "[INFO] Creating test file (200MB)"
fallocate -l 200M ~/bigfile.img

echo "[INFO] Checking size of test file"
du -sh ~/bigfile.img

echo ""
echo "[INFO] Disk usage after file creation"
df -h

echo ""
echo "[INFO] Removing test file"
rm -f ~/bigfile.img

echo "[DONE] LFCS monitoring + disk script finished"Monitoring systeme
-------------------

top

ps aux --sort=-%mem | head
ps aux --sort=-%cpu | head

ss -tulpn

journalctl -p err -b

Usage disque
-------------------
df -h

du -sh /* 2>/dev/null | sort -h

find /var -type f -size +10M 2>/dev/null

fallocate -l 200M ~/bigfile.img
du -sh ~/bigfile.img
df -h

rm ~/bigfile.img


