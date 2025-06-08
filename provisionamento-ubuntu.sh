#!/bin/bash
set -e

echo -e "\n[V] Provisionamento de pacotes adicionais..."

export DEBIAN_FRONTEND=noninteractive

apt-get install -y neofetch duf htop tree curl net-tools

echo -e "\n[✔] Pacotes adicionais instalados."

# Pós-provisionamento: edita .bashrc do vagrant
BASHRC="/home/vagrant/.bashrc"

grep -qxF 'neofetch' "$BASHRC" || echo 'neofetch' >> "$BASHRC"
grep -qxF 'duf /' "$BASHRC" || echo 'duf /' >> "$BASHRC"

chown vagrant:vagrant "$BASHRC"

echo -e "[✔] .bashrc atualizado com neofetch e duf.\n"
