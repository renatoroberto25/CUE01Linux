#!/bin/bash

echo "📘 Script Didático: Usuários no Linux"
echo "--------------------------------------"

# Função auxiliar para pausa
pause() {
    read -p "Pressione ENTER para continuar..."
}

echo "✅ Listando todos os usuários do sistema:"
cut -d: -f1 /etc/passwd | tee /tmp/usuarios_todos.txt
pause

echo "✅ Listando apenas usuários humanos (UID >= 1000):"
awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | tee /tmp/usuarios_humanos.txt
pause

read -p "👤 Informe o nome de um usuário para analisar: " user

echo "🔍 Detalhes com 'id $user':"
id "$user"
pause

echo "🔍 Entrada no /etc/passwd:"
grep "^$user:" /etc/passwd || echo "❌ Usuário não encontrado no /etc/passwd"
pause

echo "🔍 Entrada completa com getent:"
getent passwd "$user" || echo "❌ Usuário não encontrado com getent"
pause

echo "📁 Verificando home do usuário e permissões:"
home_dir=$(getent passwd "$user" | cut -d: -f6)
if [ -d "$home_dir" ]; then
    ls -ld "$home_dir"
else
    echo "⚠️ Diretório home '$home_dir' não existe"
fi
pause

echo "📝 Histórico de comandos úteis:"
cat <<EOF
# Criar usuário:
  sudo useradd <nome>
  sudo passwd <nome>
# Adequar usuário caso nececssário:
  sudo mkdir /home/userteste_01
  sudo chown userteste_01:userteste_01 /home/userteste_01
  sudo chmod 750 /home/userteste_01
  sudo usermod --shell /bin/bash userteste_01
  
  OU CRIAR DIRETO CORRETAMENTE:
  sudo useradd -m -s /bin/bash userteste_01
  sudo passwd userteste_01

# Bloquear/Desbloquear:
  sudo passwd -l <nome>   # bloqueia
  sudo passwd -u <nome>   # desbloqueia

# Apagar usuário:
  sudo userdel <nome>

# Ver logs:
  sudo grep <nome> /var/log/auth.log

# Ver grupos:
  groups <nome>
  id <nome>
EOF
echo
echo "🔐 Gerenciar validade de senha e bloqueio de contas"
echo "------------------------------------------------------"

echo "✅ Bloquear conta do usuário (senha):"
echo "  sudo passwd -l <user>  → bloqueia login por senha"
echo
echo "✅ Desbloquear:"
echo "  sudo passwd -u <user>"
pause

echo "🛡️ Configurar política de expiração de senha com chage:"
echo "  sudo chage -m 5 -M 90 -I 30 -W 14 <user>"
echo
echo "  Significado:"
echo "    -m 5   → Mínimo de 5 dias entre trocas de senha"
echo "    -M 90  → Senha expira após 90 dias"
echo "    -I 30  → Conta desativada 30 dias após senha expirada"
echo "    -W 14  → Alerta 14 dias antes da senha expirar"
pause

echo "🔍 Ver estado atual da senha com:"
echo "  chage -l <user>"
pause


echo
echo "✅ Fim! Agora pratique com 'adduser', 'userdel', 'grep', 'cut', 'awk', etc."
