#script Python que percorre todos os arquivos .txt a partir do diretório atual, e escreve em cada um deles 5 linhas de 10 caracteres aleatórios:

#!/usr/bin/env python3

import os
import random
import string

def gerar_linha():
    return ''.join(random.choices(string.ascii_letters + string.digits, k=10))

def escrever_linhas_em_txt(caminho):
    with open(caminho, 'w') as f:
        for _ in range(5):
            f.write(gerar_linha() + '\n')

# Percorrer diretórios e encontrar arquivos .txt
for root, dirs, files in os.walk('.'):
    for nome_arquivo in files:
        if nome_arquivo.endswith('.txt'):
            caminho_completo = os.path.join(root, nome_arquivo)
            escrever_linhas_em_txt(caminho_completo)
            print(f"✔ Arquivo preenchido: {caminho_completo}")
