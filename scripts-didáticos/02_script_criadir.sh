#!/bin/bash

# 📘 USO:
#   ./02_script_criadir.sh
#
# 💡 DESCRIÇÃO:
#   Cria estrutura de diretórios e arquivos para treino de permissões no Linux.
#   Aplica exemplos de chmod, chown, find, sticky bit, etc.

# 🔠 Alfabeto para nomes de arquivos
ALFABETO=(a b c d e f g h i j)

read -p "Informe o nome do diretório base: " BASEDIR
read -p "Quantos subdiretórios? (1-10): " SUBDIRS
read -p "Quantos sub-subdiretórios por subdiretório? (1-10): " SUBSUBDIRS
read -p "Quantos arquivos por sub-subdiretório? (1-10): " ARQUIVOS

# 📂 Criar estrutura
mkdir -p "$BASEDIR" || { echo "Erro ao criar $BASEDIR"; exit 1; }
for ((i=1; i<=SUBDIRS; i++)); do
  for ((j=1; j<=SUBSUBDIRS; j++)); do
    SUBDIR="$BASEDIR/$i/$j"
    mkdir -p "$SUBDIR"
    for ((k=0; k<ARQUIVOS && k<${#ALFABETO[@]}; k++)); do
      touch "$SUBDIR/${ALFABETO[$k]}.txt"
    done
  done
  done

echo "✔ Diretório '$BASEDIR' criado com $SUBDIRS subdirs, $SUBSUBDIRS subsubdirs e $ARQUIVOS arquivos por sub-subdir."

# 🎯 Exemplo de permissões

echo -e "\n🎯 Adicionando exemplos de permissões em arquivos/diretórios"

echo "🏠 Permissões de diretório pessoal"
sudo chmod 0750 /home/testeuser 2>/dev/null
sudo chown -R root:root /home/testeuser 2>/dev/null

echo "📦 Movendo usuário arquivado para /home/archived_users/"
sudo mkdir -p /home/archived_users/
sudo mv /home/testeuser /home/archived_users/ 2>/dev/null

cd "$BASEDIR"
touch file1 file2 file3 file4

echo "🔐 Permissões específicas"
chmod u+x file1
chmod o+wx file2
chmod g-r file3
chmod 777 file4

echo "🔢 Permissões numéricas"
chmod 744 file1
chmod 647 file2
chmod 604 file3
chmod 777 file4

echo "🔁 Permissões recursivas padrão"
sudo find . -type f -print0 | xargs -0 sudo chmod 644
sudo find . -type d -print0 | xargs -0 sudo chmod 755

echo "🧍 Alterando dono e grupo"
sudo chown root:root file1
sudo chown vagrant:vagrant file2

echo "📛 Sticky bit em diretório público"
mkdir -p public_dir
chmod 777 public_dir
chmod +t public_dir

cd - &>/dev/null

echo -e "\n✔ Permissões aplicadas. Ideal para treinar 'ls -l', 'stat', 'chmod', 'chown', 'find'..."