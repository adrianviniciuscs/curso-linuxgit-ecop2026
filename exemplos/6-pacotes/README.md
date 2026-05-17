<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# 6. Instalação de Pacotes — apt

## 📖 Objetivo

Aprender a instalar, procurar e atualizar programas usando `apt` (gerenciador de pacotes do Ubuntu/Debian).

## 🎯 Conceitos

- **Pacote:** um programa pronto para instalar
- **apt:** gerenciador de pacotes (apt = Advanced Package Tool)
- **sudo:** necessário para instalar (requer privilégios de admin)

## 📝 Exercícios

### Exercício 1: Ver pacotes instalados

```bash
# Ver TODOS os pacotes instalados (muitos!)
$ apt list --installed | head -20

# Procurar por pacotes específicos
$ apt list --installed | grep "python"

# Ver quantos pacotes tem instalado
$ apt list --installed | wc -l
```

### Exercício 2: Procurar pacotes

```bash
# Procurar por pacotes com "git" no nome
$ apt search git

# Procurar por pacotes com "curl" no nome
$ apt search curl

# Procurar por editor de texto
$ apt search "text editor"
```

### Exercício 3: Atualizar lista de pacotes

Precisa fazer isso antes de instalar qualquer coisa:

```bash
# Sincroniza a lista de pacotes disponíveis
$ sudo apt update

# Você verá:
# Get:1 http://... Release [XX KB]
# Get:2 http://... Packages [XX MB]
# ... várias linhas ...
# Reading package lists... Done
```

### Exercício 4: Instalar um pacote

```bash
# Instalar curl (ferramenta para baixar da internet)
$ sudo apt install curl

# Instalar python3-pip (gerenciador de pacotes Python)
$ sudo apt install python3-pip

# Instalar múltiplos pacotes
$ sudo apt install git vim curl

# Você pode precisar digitar sua senha
```

### Exercício 5: Atualizar pacotes instalados

```bash
# Atualizar pacotes que você já tem
$ sudo apt upgrade

# Atualizar tudo (mais agressivo)
$ sudo apt full-upgrade
```

### Exercício 6: Remover um pacote

```bash
# Desinstalar um pacote
$ sudo apt remove vim

# Remover e limpar arquivos de configuração
$ sudo apt purge vim
```

### Exercício 7: Instalar programas úteis

Alguns programas que valem a pena ter:

```bash
# Git (controle de versão)
$ sudo apt install git

# Vim (editor poderoso)
$ sudo apt install vim

# Curl (baixar da internet via linha de comando)
$ sudo apt install curl

# wget (alternativa a curl)
$ sudo apt install wget

# Htop (monitor de sistema melhor que top)
$ sudo apt install htop

# Tree (mostra estrutura de pastas em árvore)
$ sudo apt install tree
```

Depois de instalar, você pode usar. Exemplo:

```bash
# Depois de "sudo apt install tree"
$ tree .
# Mostra estrutura de pastas

# Depois de "sudo apt install git"
$ git --version
# Mostra versão do git
```

### Exercício 8: Atualizar o sistema inteiro

```bash
# 1. Atualizar lista
$ sudo apt update

# 2. Atualizar pacotes
$ sudo apt upgrade

# 3. Ocasionalmente, atualização maior
$ sudo apt full-upgrade

# Pronto! Sistema atualizado
```

## 📊 Comandos importantes

```bash
apt update                      # atualiza lista
apt search nome                 # procura pacote
apt list --installed            # lista pacotes instalados
sudo apt install nome           # instala
sudo apt remove nome            # desinstala
sudo apt upgrade                # atualiza pacotes
apt show nome                   # mostra informações do pacote
```

## ⚠️ Importante: Outras distribuições

Se você não está em Ubuntu/Debian (Mint, Pop!_OS, etc):

### Fedora/Red Hat
```bash
sudo dnf update                 # atualiza lista
sudo dnf search nome            # procura
sudo dnf install nome           # instala
sudo dnf remove nome            # desinstala
```

### Arch Linux
```bash
sudo pacman -Sy                 # sincroniza lista
sudo pacman -Ss nome            # procura
sudo pacman -S nome             # instala
sudo pacman -R nome             # desinstala
```

## 🎮 Desafios

1. **Desafio 1:** Atualize sua lista de pacotes
   ```bash
   sudo apt update
   ```

2. **Desafio 2:** Procure por pacotes que começam com "python"
   ```bash
   apt search ^python
   ```

3. **Desafio 3:** Instale um pacote (exemplo: curl)
   ```bash
   sudo apt install curl
   ```

4. **Desafio 4:** Veja quantos pacotes tem instalado
   ```bash
   apt list --installed | wc -l
   ```

## ✅ Checklist

- [ ] Consigo usar `apt update`
- [ ] Consigo procurar pacotes com `apt search`
- [ ] Consigo instalar com `sudo apt install`
- [ ] Entendo por que preciso de `sudo`
- [ ] Consigo listar pacotes instalados

---

**Próximo passo:** vá para `exercicio-final/`
