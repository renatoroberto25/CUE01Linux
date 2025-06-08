#!/bin/bash

# 📘 USO:
#   ./04_script_grepper.sh termo dir [arquivo1 arquivo2]
#   ./04_script_grepper.sh aa /home/GLOBALHOME/teste1/ /home/GLOBALHOME/teste1/1/1/a.txt /home/GLOBALHOME/teste1/1/1/b.txt
# 💡 OBJETIVO:
#   - Buscar termo com grep dentro dos arquivos .txt no diretório informado
#   - Comparar dois arquivos se informados
#   - Explicações inclusas

TERMO="$1"
DIR="$2"
ARQ1="$3"
ARQ2="$4"

# 🚫 Verificações
if [[ -z "$TERMO" || -z "$DIR" ]]; then
  echo "❗ Uso: $0 termo diretório [arquivo1 arquivo2]"
  exit 1
fi

if [[ ! -d "$DIR" ]]; then
  echo "✖ Diretório '$DIR' não existe."
  exit 1
fi

if [[ ! -r "$DIR" ]]; then
  echo "✖ Sem permissão de leitura no diretório '$DIR'."
  exit 1
fi

echo "🔎 Buscando arquivos .txt em '$DIR' com find:"
find "$DIR" -type f -iname "*.txt" 2>/dev/null

echo -e "\n📂 Exibindo conteúdo de todos os .txt com cat:"
find "$DIR" -type f -iname "*.txt" -exec cat {} \; 2>/dev/null

echo -e "\n🔍 Buscando termo '$TERMO' com grep:"
find "$DIR" -type f -iname "*.txt" -exec grep --color=auto -Hn "$TERMO" {} \; 2>/dev/null

echo "# grep: busca o termo nos arquivos"
echo "# -H: mostra o nome do arquivo"
echo "# -n: mostra a linha"
echo "# --color: destaca o termo"

# Comparação se ambos arquivos forem fornecidos
if [[ -n "$ARQ1" && -n "$ARQ2" ]]; then
  echo -e "\n🧾 Comparando '$ARQ1' com '$ARQ2' com diff:"
  diff "$ARQ1" "$ARQ2"
  echo "# diff: mostra diferenças linha por linha"
else
  echo -e "\n⚠️ Arquivos para comparação não fornecidos. Pulei essa parte."
fi
