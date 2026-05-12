
#!/bin/bash

# ==========================================
# LFCS - Systemd Service Setup & Troubleshooting Lab
# ==========================================

echo "===== CREATING DIRECTORY ====="

sudo mkdir -p /opt/lfcs

echo "===== CREATING SCRIPT ====="

cat <<'EOF' | sudo tee /opt/lfcs/webcheck.sh
#!/bin/bash
# Simple loop writing timestamps to log file
while true
do
  date >> /var/log/webcheck.log
  sleep 30
done
EOF

sudo chmod +x /opt/lfcs/webcheck.sh

echo "===== CREATING SYSTEMD SERVICE ====="

cat <<'EOF' | sudo tee /etc/systemd/system/webcheck.service
[Unit]
Description=LFCS Webcheck Service

[Service]
ExecStart=/bin/bash /opt/lfcs/webcheck.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

echo "===== STARTING SERVICE ====="

sudo systemctl daemon-reload
sudo systemctl enable --now webcheck.service

echo "===== SERVICE STATUS ====="
systemctl status webcheck.service

echo "===== LIVE LOGS (CTRL+C TO EXIT) ====="
# journal logs (recommended for systemd)
journalctl -u webcheck.service

echo "===== FILE LOG OUTPUT ====="
tail -f /var/log/webcheck.logCreation de script
---------------------
sudo mkdir -p /opt/lfcs

cat <<'EOF' | sudo tee /opt/lfcs/webcheck.sh
#!/bin/bash
while true
do
  date >> /var/log/webcheck.log
  sleep 30
done
EOF

sudo chmod +x /opt/lfcs/webcheck.sh

Creation d'un service
--------------------
cat <<'EOF' | sudo tee /etc/systemd/system/webcheck.service
[Unit]
Description=LFCS Webcheck Service

[Service]
ExecStart=/bin/bash /opt/lfcs/webcheck.sh
Restart=always

[Install]
WantedBy=multi-user.target
EOF

Demarrage du service
---------------
sudo systemctl daemon-reload
sudo systemctl enable --now webcheck.service

systemctl status webcheck.service
journalctl -u webcheck.service


Voir les logs
----------------
tail -f /var/log/webcheck.log


Troubleshooting
----------------
systemctl status webcheck.service

journalctl -u webcheck.service

sudo systemctl daemon-reload
sudo systemctl restart webcheck.service
