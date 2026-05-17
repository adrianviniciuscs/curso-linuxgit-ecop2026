<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# 5. Edição de Texto — nano e vim

## 📖 Objetivo

Aprender a editar arquivos diretamente no terminal usando nano (amigável) e ter uma prévia de vim (poderoso).

## 🎯 Conceitos

- **nano:** editor simples, bom para iniciantes
- **vim:** editor poderoso mas com curva de aprendizado
- **Leitura:** cat, less, head, tail (sem editar)

## 📝 Exercícios

### Exercício 1: Editar com nano (recomendado)

```bash
# Abrir arquivo novo (ou existente) no nano
$ nano meu-arquivo.txt

# Dentro do nano:
# - Digite normalmente
# - Ctrl + X: sair
# - Ctrl + O: salvar (write Out)
# - Ctrl + W: buscar (Find What)
# - Ctrl + \: buscar e substituir
# - Ctrl + A: ir para início da linha
# - Ctrl + E: ir para fim da linha
```

**Prática:**
```bash
# Criar arquivo novo
$ nano primeiro.txt
# (digita "Olá, mundo!")
# Ctrl + X
# Y (sim, salvar)
# Enter (confirma nome)

# Verificar
$ cat primeiro.txt
Olá, mundo!

# Editar novamente
$ nano primeiro.txt
# (adiciona mais texto)
# Ctrl + X, Y, Enter
```

### Exercício 2: Editar existente

```bash
# Criar arquivo com echo
$ echo "Linha 1" > arquivo.txt
$ echo "Linha 2" >> arquivo.txt

# Editar com nano
$ nano arquivo.txt
# (modifica conteúdo)
# Ctrl + X, Y, Enter
```

### Exercício 3: vim — preview (não é para aprender agora)

```bash
# Abrir vim
$ vim teste.txt

# Modo normal (padrão):
# i = entrar em modo INSERT (digitar)
# Esc = sair de INSERT, volta ao modo normal

# Do modo normal:
# :w = salvar (write)
# :q = sair (quit)
# :wq = salvar e sair
# :q! = sair SEM salvar

# Exemplo:
$ vim teste.txt
# i
# digita algo
# Esc
# :wq
# Enter
```

### Exercício 4: Leitura (sem editar)

```bash
# Ver arquivo inteiro
$ cat arquivo.txt

# Ver com paginação (útil para arquivos grandes)
$ less arquivo.txt
# (use espaço para próxima página, q para sair)

# Ver primeiras 5 linhas
$ head -5 arquivo.txt

# Ver últimas 5 linhas
$ tail -5 arquivo.txt

# Ver última linha
$ tail -1 arquivo.txt
```

### Exercício 5: Comparar antes e depois

```bash
# Salve versão anterior
$ cp arquivo.txt arquivo.txt.backup

# Edite
$ nano arquivo.txt

# Veja as diferenças
$ diff arquivo.txt arquivo.txt.backup

# Ou use less para comparar
$ less arquivo.txt
# vs
$ less arquivo.txt.backup
```

## 📊 Atalhos importantes

### nano

| Atalho | Função |
|--------|--------|
| `Ctrl + X` | Sair |
| `Ctrl + O` | Salvar |
| `Ctrl + W` | Buscar |
| `Ctrl + \` | Buscar e substituir |
| `Ctrl + A` | Início da linha |
| `Ctrl + E` | Fim da linha |
| `Ctrl + Y` | Página anterior |
| `Ctrl + V` | Próxima página |

### vim (básico)

| Comando | Função |
|---------|--------|
| `i` | Modo INSERT (digitar) |
| `Esc` | Volta ao modo normal |
| `:w` | Salva |
| `:q` | Sai |
| `:wq` | Salva e sai |
| `:q!` | Sai sem salvar |

## ⚠️ Se entrou no vim sem querer

```bash
# Está preso no vim?
# Pressione: Esc, depois digita :q! e Enter
Esc
:q!
Enter

# Pronto, saiu!
```

## 🎮 Desafios

1. **Desafio 1:** Crie um arquivo com nano e escreva seu nome
2. **Desafio 2:** Edite um arquivo existente e adicione uma linha
3. **Desafio 3:** Use `head` e `tail` para ver partes de um arquivo
4. **Desafio 4:** Compare dois arquivos com `diff`

## ✅ Checklist

- [ ] Consigo abrir nano e editar um arquivo
- [ ] Sei como salvar e sair do nano
- [ ] Consigo usar head, tail, less
- [ ] Entendo que vim existe (não precisa dominar agora)
- [ ] Sei como sair do vim sem salvar

---

**Próximo passo:** vá para `6-pacotes/`
