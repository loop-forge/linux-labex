# 🚀 LFCS Basic Operations Lab

Mini-lab pratique basé sur les objectifs de la certification **Linux Foundation Certified System Administrator (LFCS)**.

Ce projet regroupe des exercices essentiels pour s’entraîner aux opérations système Linux : Git, systemd, monitoring, disque, logs et SSL.

---

# 🧠 Objectifs du lab

- Maîtriser les commandes Git de base
- Créer et gérer des services systemd
- Surveiller un système Linux
- Diagnostiquer des problèmes de disque
- Inspecter des certificats SSL
- Lire et analyser les logs système

---

# 📁 1. Git Basics

```bash
mkdir ~/lfcs-lab
cd ~/lfcs-lab

git init

echo "LFCS practice" > notes.txt

git add notes.txt
git commit -m "Initial commit"

git status
git log --oneline

echo "Second line" >> notes.txt
git diff
