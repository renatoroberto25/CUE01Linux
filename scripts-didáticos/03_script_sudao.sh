#!/bin/bash

echo "🔐 Treinamento prático: sudo e SSH"
echo "----------------------------------"

# ✔ 1. Verifica se sudo está disponível
if ! command -v sudo &> /dev/null; then
    echo "❌ sudo não está instalado. Instale com: apt install sudo"
    exit 1
fi
echo "✔ sudo está instalado"

# ✔ 2. Testar sudo básico
echo
echo "👉 Teste: você consegue listar diretórios root com sudo?"
echo "    sudo ls -l /root"
read -p "Pressione ENTER para continuar..."

# ✔ 3. sudo -i, sudo -s, sudo -u
echo
echo "🧪 Teste os seguintes comandos manualmente:"
echo "    sudo -i       # Simula login como root"
echo "    sudo -s       # Shell root sem alterar variáveis de ambiente"
echo "    sudo -u nobody whoami  # Executa comando como outro usuário"
read -p "Pressione ENTER para continuar..."

# ✔ 4. Geração de chave SSH
echo
echo "🔑 Gerar chave SSH"
if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 2048 -f "$HOME/.ssh/id_rsa" -N ""
    echo "✔ Par de chaves SSH gerado em ~/.ssh/id_rsa"
else
    echo "ℹ️ Chave já existente em ~/.ssh/id_rsa"
fi

# ✔ 5. Explica configuração do SSH
echo
echo "📁 Para configurar SSH seguro, edite: /etc/ssh/sshd_config"
echo "Sugestões:"
echo "  - Trocar porta:            Port 2222"
echo "  - Desativar root:          PermitRootLogin no"
echo "  - Restringir por grupo:    AllowGroups sshusers"
read -p "Deseja editar agora com sudo nano? (s/n) " editar
if [[ "$editar" == "s" ]]; then
    sudo nano /etc/ssh/sshd_config
fi

# ✔ 6. Reiniciar o serviço SSH
echo
read -p "Deseja reiniciar o serviço SSH agora? (s/n) " restart
if [[ "$restart" == "s" ]]; then
    sudo systemctl restart ssh && echo "✔ SSH reiniciado com sucesso"
else
    echo "ℹ️ SSH não reiniciado"
fi

echo
echo "🏁 Treinamento finalizado. Pratique cada item manualmente para fixar o aprendizado."
