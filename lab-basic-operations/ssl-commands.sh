#!/bin/bash

# ==========================================
# LFCS - SSL Certificate Inspection Script
# ==========================================

DOMAIN="google.com:443"

echo "===== SSL CONNECTION TEST ====="

# Vérifie la connexion SSL brute (handshake + cert chain)
echo "[INFO] Running openssl s_client against $DOMAIN"
openssl s_client -connect $DOMAIN </dev/null

echo ""
echo "===== CERTIFICATE DATES ====="

# Extrait uniquement les dates du certificat
echo "[INFO] Certificate validity dates"
echo | openssl s_client -connect $DOMAIN 2>/dev/null \
| openssl x509 -noout -dates

echo ""
echo "===== CERTIFICATE SUBJECT ====="

# Affiche le sujet du certificat (CN, O, etc.)
echo "[INFO] Certificate subject"
echo | openssl s_client -connect $DOMAIN 2>/dev/null \
| openssl x509 -noout -subject

echo ""
echo "[DONE] SSL inspection completed"Open SSL Commands
------------------

openssl s_client -connect google.com:443

echo | openssl s_client -connect google.com:443 2>/dev/null \
| openssl x509 -noout -dates

echo | openssl s_client -connect google.com:443 2>/dev/null \
| openssl x509 -noout -subject
