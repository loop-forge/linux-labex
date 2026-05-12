systemctl status webcheck.service

journalctl -u webcheck.service

sudo systemctl daemon-reload
sudo systemctl restart webcheck.service
