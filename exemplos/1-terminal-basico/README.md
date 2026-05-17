<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# 1. Terminal Básico — Atalhos e Anatomia

## 📖 Objetivo

Aprender a navegar no terminal usando atalhos e entender como os comandos funcionam.

## 🎯 Conceitos

- **Anatomia de um comando:** `comando [flags] [argumentos]`
- **Atalhos essenciais:** Tab, setas, Ctrl+C, Ctrl+L
- **Navegação:** pwd, ls, cd

## 📝 Exercícios

### Exercício 1: Estrutura de um comando

Analise este comando e identifique cada parte:

```bash
ls -la /home/usuario/Downloads
 │   │   └── argumento
 │   └── flag
 └── comando
```

**Comando:** `ls` (list)  
**Flag:** `-la` (long format + all files, including hidden)  
**Argumento:** `/home/usuario/Downloads` (qual diretório listar)

### Exercício 2: Praticando atalhos

Abra um terminal e faça:

```bash
# Use Tab para autocompleta — comece a digitar e pressione Tab
$ ls /h<TAB>
# Completa para /home

$ ls /home/us<TAB>
# Completa para /home/usuario (ou seu nome)

# Use setas para navegar no histórico
$ pwd
$ cd ..
$ <UP>  # volta para pwd
$ <UP>  # volta para cd ..
$ <DOWN> # vai para cd ..

# Use Ctrl+L para limpar a tela (igual a clear)
$ <CTRL+L>

# Use Ctrl+C para parar um comando (tente sleep)
$ sleep 100
$ <CTRL+C>  # interrompe
```

### Exercício 3: Navegação rápida

```bash
# Vá para seu home
$ cd ~

# Veja onde você está
$ pwd

# Vá para a pasta de Downloads
$ cd Downloads

# Volta um nível
$ cd ..

# Volta para o diretório anterior (atalho)
$ cd -

# Volta para home (atalho)
$ cd ~

# Vá para raiz do sistema
$ cd /

# Volte para home
$ cd
```

## 📊 Comandos importantes

```bash
pwd                    # print working directory
ls                     # list (basic)
ls -l                  # list (long format)
ls -a                  # list (show hidden)
ls -la                 # list (long + hidden) — MAIS USADO
cd <caminho>           # change directory
clear                  # limpa tela (ou Ctrl+L)
man <comando>          # mostra manual do comando
```

## ✅ Checklist

- [ ] Entendo a anatomia de um comando
- [ ] Consigo usar Tab para autocompleta
- [ ] Sei navegar com as setas do histórico
- [ ] Consigo mudar de diretório com cd
- [ ] Sei voltar com cd .. e cd -

---

**Próximo passo:** vá para `2-usuarios-permissoes/`
