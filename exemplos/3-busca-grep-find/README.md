<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# 3. Busca — find e grep

## 📖 Objetivo

Aprender a procurar por arquivos e textos dentro de arquivos usando `find` e `grep`.

## 🎯 Conceitos

- **find:** procura arquivos por nome, tipo, tamanho, etc
- **grep:** procura por padrão de texto dentro de arquivos
- **locate:** busca rápida (usa banco de dados)

## 📂 Arquivos de exemplo

Esta pasta contém:
- `sistema.log` — arquivo de log para praticar grep

## 📝 Exercícios

### Exercício 1: find — procurar por nome

```bash
# Listar todos os arquivos .txt a partir da pasta atual
$ find . -name "*.txt"

# Procurar por padrão específico
$ find . -name "sistema*"

# Procurar em uma pasta específica
$ find /home -name "*.log"

# Procurar por tipo (só diretórios)
$ find . -type d -name "test*"

# Procurar por tipo (só arquivos)
$ find . -type f -name "*.py"
```

### Exercício 2: grep — procurar dentro de arquivos

Vamos usar o arquivo `sistema.log` que já existe aqui.

```bash
# Mostrar todas as linhas com "ERROR"
$ grep "ERROR" sistema.log

# Contar quantas linhas contêm "ERROR"
$ grep -c "ERROR" sistema.log

# Mostrar linhas com "ERROR" E o número da linha
$ grep -n "ERROR" sistema.log

# Procurar case-insensitive (tanto "error" como "ERROR")
$ grep -i "error" sistema.log

# Mostrar linhas que NÃO contêm "INFO"
$ grep -v "INFO" sistema.log

# Procurar em múltiplos arquivos
$ grep "WARN" sistema.log outro-arquivo.log
```

### Exercício 3: grep recursivo

```bash
# Procurar por padrão em TODOS os arquivos a partir daqui
$ grep -r "erro" .

# Procurar recursivo em arquivos .py
$ grep -r "def " --include="*.py" .

# Procurar recursivo só em diretório específico
$ grep -r "TODO" ./src/
```

### Exercício 4: Combinando find + grep

Procurar por padrão em todos os arquivos de um tipo:

```bash
# Encontre todos os .txt, depois procure por "importante"
$ find . -name "*.txt" -type f -exec grep "importante" {} \;

# Ou mais simples: procure recursivo
$ grep -r "importante" --include="*.txt" .
```

### Exercício 5: Prática com o arquivo sistema.log

Responda estas perguntas usando grep:

```bash
# 1. Quantas mensagens de ERRO (ERROR) existem?
$ grep -c "ERROR" sistema.log

# 2. Quais são os números das linhas com WARN?
$ grep -n "WARN" sistema.log

# 3. Que linhas não são INFO?
$ grep -v "INFO" sistema.log

# 4. Quantas mensagens de cada tipo? (desafio)
$ grep -c "ERROR" sistema.log
$ grep -c "WARN" sistema.log
$ grep -c "INFO" sistema.log
```

### Exercício 6: locate — busca rápida

```bash
# Procurar por "python3" em todo o sistema (rápido!)
$ locate python3

# Procurar por ".bashrc"
$ locate .bashrc

# Se não funcionar, atualize o banco de dados:
$ sudo updatedb
```

## 📊 Comandos importantes

```bash
find . -name "*.txt"                # arquivos .txt
find . -type f -name "log*"         # arquivos que começam com "log"
find . -type d -name "node_*"       # diretórios que começam com "node_"
find /etc -name "*.conf"            # em /etc, arquivos .conf

grep "padrão" arquivo.txt           # procura simples
grep -n "padrão" arquivo.txt        # com número de linha
grep -i "padrão" arquivo.txt        # case-insensitive
grep -v "padrão" arquivo.txt        # linhas que NÃO contêm
grep -c "padrão" arquivo.txt        # conta linhas
grep -r "padrão" .                  # recursivo
grep -l "padrão" *.txt              # só nomes de arquivos

locate arquivo                      # busca rápida
```

## 🎮 Desafios extras

1. **Desafio 1:** Encontre todos os arquivos `.md` a partir daqui
   ```bash
   find . -name "*.md"
   ```

2. **Desafio 2:** Conte quantas linhas com "ERROR" ou "WARN" existem
   ```bash
   grep -E "ERROR|WARN" sistema.log | wc -l
   ```

3. **Desafio 3:** Mostre todas as linhas de ERROR com seus números de linha
   ```bash
   grep -n "ERROR" sistema.log
   ```

4. **Desafio 4:** Procure por arquivos que foram modificados nos últimos 7 dias
   ```bash
   find . -type f -mtime -7
   ```

## ✅ Checklist

- [ ] Consigo usar `find` para procurar por nome
- [ ] Consigo usar `grep` para procurar dentro de arquivos
- [ ] Sei a diferença entre `find` e `grep`
- [ ] Consigo usar flags como `-n`, `-i`, `-v`
- [ ] Consigo procurar recursivamente com `grep -r`

---

**Próximo passo:** vá para `4-pipes-encadeamento/`
