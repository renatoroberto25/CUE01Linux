# ✅ Checklist de Domínio – CUE.01 Linux (Administração Ubuntu)

## 🛡 Secure System Access

- [X] Criar, bloquear, desbloquear e excluir usuários com `adduser`, `passwd`, `deluser`
    plus:   id user e getent passwd user - DETALHES SOBRE UM USUÁRIO
            grep user /etc/passwd - INFOS SOBRE USUÁRIO NO PASSWD
            cut -d: -f1 /etc/passwd - LISTA TODOS USUÁRIOS DO SISTEMA
            awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd - APENAS USUÁRIOS COM UID ≥ 1000 (usuários reais)
            awk -F: '{printf "%-20s UID=%-5s GID=%-5s\n", $1, $3, $4}' /etc/passwd - MOSTRAR NOME + UID + GID
            cut -d: -f1 /etc/group - LISTA TODOS GRUPOS DO SISTEMA
            awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/group - APENAS GRUPOS COM GID ≥ 1000 (ignorando nobody)
            awk -F: '{printf "%-20s GID=%-5s MEMBROS=%s\n", $1, $3, $4}' /etc/group - MOSTRAR NOME + GID + MEMBROS
            sudo setfacl -m g:grupoteste_04:rx /home/GLOBALHOME

- [X] Criar e gerenciar grupos com `addgroup`, `adduser user group`, `delgroup`
    plus: usermod -aG grupo user
- [X] Alterar permissões de `/home` com `chmod` e entender `0750`
    plus:   rsync -a origem.txt destino.txt copia arquivo com permissões e tudo

- [X] Conceder privilégios de administrador com `sudo`
- [X] Usar `sudo -i`, `sudo -s` e `sudo -u outro_user`
- [X] Gerar par de chaves SSH com `ssh-keygen` e testar login sem senha
- [X] Configurar SSH seguro: trocar porta, desativar root, `AllowGroups`
- [X] Editar `/etc/ssh/sshd_config` com segurança
- [X] Restart seguro do serviço SSH com `sudo systemctl restart ssh`

---

## 📁 Use the Filesystem

- [X] Navegar com `cd`, `pwd`, `ls`, `mkdir`, `touch`
- [X] Buscar arquivos com `find` por nome, tamanho e tipo
    plus:   find teste1/ -iname '*.txt'
            find teste1/ -iname '*.txt' -exec ls -l {} \;
    
- [ ] Buscar conteúdo em arquivos com `grep`
- [ ] Comparar arquivos com `diff`
- [ ] Ver partições com `lsblk`, `df -hT`, `fdisk -l`
- [X] Saber interpretar permissões `rwx` e alterá-las com `chmod`
- [X] Usar `chown` e `chgrp` para alterar dono e grupo de arquivos
    plus: acl usado com sucesso

---

## 🛠 Maintain System Resources

- [ ] Visualizar logs com `journalctl`, `tail /var/log/*`
- [ ] Criar entrada no `/etc/fstab` e montar partição com `mount -a`
- [ ] Criar ponto de montagem com `mkdir /mnt/usb` e testar montagem
- [ ] Instalar e usar `mlabel` para renomear unidades USB (vfat)
- [ ] Criar e listar tarefas agendadas com `crontab -e` e `crontab -l`
- [ ] Carregar e remover módulos com `modprobe` e `rmmod`
- [ ] Simular rotação de logs com `logrotate -d`

---

## 📖 Man Pages (Estudar/Consultar)

- [ ] `man adduser`
- [ ] `man usermod`
- [ ] `man chmod`
- [ ] `man chown`
- [ ] `man find`
- [ ] `man grep`
- [ ] `man diff`
- [ ] `man fstab`
- [ ] `man mount`
- [ ] `man crontab`
- [ ] `man logrotate`
- [ ] `man modprobe`
- [ ] `man rmmod`
