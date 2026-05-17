<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# 2. Usuários e Permissões

## 📖 Objetivo

Entender quem você é no sistema, como usar `sudo`, e como dar permissão de execução a arquivos.

## 🎯 Conceitos

- **Usuários:** cada pessoa tem um login no sistema
- **Grupos:** usuários podem pertencer a grupos
- **root:** administrador (superuser)
- **sudo:** executar um comando como admin
- **Permissões:** rwx (read, write, execute)

## 📝 Exercícios

### Exercício 1: Descobrir quem você é

```bash
# Mostra seu nome de usuário
$ whoami
usuario

# Mostra seu ID (UID) e grupos (GID)
$ id
uid=1000(usuario) gid=1000(usuario) groups=1000(usuario),27(sudo)

# Mostra grupos a que você pertence
$ groups
usuario sudo
```

**O que significa?**
- Você é o usuário `usuario` (UID 1000)
- Seu grupo principal é `usuario` (GID 1000)
- Você está no grupo `sudo` — pode usar `sudo`!

### Exercício 2: Entender permissões

```bash
# Liste com detalhes
$ ls -la

# Saída exemplo:
# drwxr-xr-x  2 usuario grupo  4096 mai 15 14:00 Downloads
# -rw-r--r--  1 usuario grupo  1024 mai 15 10:30 arquivo.txt
# -rwxr-xr-x  1 usuario grupo  8192 mai 15 11:00 script.sh
```

**Decodificar permissões:**

```
-rw-r--r--
│││││││││
││└─┬──┬─ Outros (others): r-- = lê, não escreve, não executa
│└──┬──┬─ Grupo (group): r-- = lê, não escreve, não executa
└───┬──┬─ Dono (user): rw- = lê, escreve, mas não executa
    └─┬─ Tipo: - = arquivo, d = diretório

r = read (ler)
w = write (escrever/modificar)
x = execute (executar/entrar no diretório)
- = sem permissão
```

### Exercício 3: Dar permissão de execução

```bash
# Crie um script de teste
$ echo '#!/bin/bash' > teste.sh
$ echo 'echo "Olá, mundo!"' >> teste.sh

# Tente executar (vai dar erro)
$ ./teste.sh
bash: ./teste.sh: Permission denied

# Dê permissão de execução
$ chmod +x teste.sh

# Agora funciona!
$ ./teste.sh
Olá, mundo!

# Veja a permissão mudou
$ ls -la teste.sh
-rwxr-xr-x  1 usuario grupo  39 mai 17 10:30 teste.sh
# Note o 'x' na posição de execução para o dono
```

### Exercício 4: Remover permissão

```bash
# Remova permissão de execução
$ chmod -x teste.sh

# Veja que 'x' desapareceu
$ ls -la teste.sh
-rw-r--r--  1 usuario grupo  39 mai 17 10:30 teste.sh

# Não consegue executar mais
$ ./teste.sh
bash: ./teste.sh: Permission denied
```

### Exercício 5: Usar sudo (com cuidado!)

```bash
# Tentando editar arquivo de sistema (vai dar erro)
$ rm /etc/hosts
rm: cannot remove '/etc/hosts': Permission denied

# Com sudo, consegue
$ sudo rm /etc/hosts
[sudo] password for usuario: 
# (digita sua senha)

# CUIDADO! Isso deletaria um arquivo importante!
# Não faça isso de verdade!

# Um exemplo seguro:
$ sudo whoami
root

# Mostra que você "virou" root temporariamente
```

## 📊 Comandos importantes

```bash
whoami              # mostra seu usuário
id                  # mostra ID e grupos
groups              # mostra grupos a que pertence
chmod +x arquivo    # dá permissão de execução
chmod -x arquivo    # remove permissão de execução
sudo comando        # executa como admin (peça cuidado!)
```

## ✅ Checklist

- [ ] Sei quem sou no sistema (whoami)
- [ ] Entendo o que significa rwx
- [ ] Consigo dar permissão com chmod +x
- [ ] Entendo quando usar sudo
- [ ] Consigo ler permissões no ls -la

---

**Próximo passo:** vá para `3-busca-grep-find/`
