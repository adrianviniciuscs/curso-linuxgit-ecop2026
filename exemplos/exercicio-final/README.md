<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# Exercício Final — Integração de tudo

## 📖 Objetivo

Colocar em prática **tudo** que você aprendeu: navegação, criação de arquivos, permissões, busca, pipes, edição e pacotes.

## 🎯 O Projeto

Você vai criar uma estrutura de projeto web completa, usando **apenas** o terminal.

```
meu-projeto/
├── README.md
├── .gitignore
├── src/
│   ├── index.html
│   ├── style.css
│   ├── script.js
│   └── utils.js
├── docs/
│   ├── README.md
│   ├── guia-instalacao.md
│   └── arquitetura.md
├── testes/
│   ├── teste1.sh
│   └── teste2.sh
├── backup/
│   └── (cópia de segurança)
└── assets/
    └── imagens/
```

## 📝 Passo a passo

### Fase 1: Criar estrutura com `mkdir`

```bash
# 1. Crie a pasta principal
mkdir meu-projeto
cd meu-projeto

# 2. Crie todas as subpastas de uma vez
mkdir -p src docs testes backup assets/imagens

# 3. Verifique a estrutura
ls -R
```

### Fase 2: Criar arquivos com `touch` e `echo`

```bash
# 1. README.md (com conteúdo)
echo "# Meu Projeto" > README.md
echo "Projeto criado na Oficina de Git & Linux — UFERSA" >> README.md
echo "Data: $(date)" >> README.md

# 2. .gitignore (arquivo especial)
touch .gitignore
echo "*.pyc" >> .gitignore
echo "__pycache__/" >> .gitignore
echo "node_modules/" >> .gitignore

# 3. Arquivos de código
touch src/index.html
touch src/style.css
touch src/script.js
touch src/utils.js

# 4. Documentação
touch docs/README.md
touch docs/guia-instalacao.md
touch docs/arquitetura.md

# 5. Testes
touch testes/teste1.sh
touch testes/teste2.sh

# Verifique
ls -la
ls -la src/
```

### Fase 3: Editar arquivos com `nano`

```bash
# Edite cada arquivo
nano src/index.html
# (escreva conteúdo básico de HTML)
# Ctrl + X, Y, Enter

nano src/style.css
# (escreva um pouco de CSS)

nano docs/README.md
# (escreva documentação)

nano testes/teste1.sh
# (escreva um script simples)
```

**Exemplo para teste1.sh:**
```bash
#!/bin/bash
echo "Teste 1 — verificar estrutura"
pwd
ls -la
```

### Fase 4: Dar permissão aos scripts

```bash
# Torne os scripts executáveis
chmod +x testes/teste1.sh
chmod +x testes/teste2.sh

# Verifique
ls -la testes/
# deve mostrar 'x' na coluna de permissões
```

### Fase 5: Buscar com `find` e `grep`

```bash
# 1. Encontre todos os arquivos .js
find . -name "*.js"

# 2. Encontre todos os arquivos em docs/
find docs -type f

# 3. Procure por "TODO" em todo o projeto
grep -r "TODO" .

# 4. Procure por "Teste" em testes/
grep -r "Teste" testes/

# 5. Conte quantos arquivos .md tem
find . -name "*.md" | wc -l
```

### Fase 6: Usar pipes para processar

```bash
# 1. Listar só arquivos (sem diretórios)
ls -la | grep "^-"

# 2. Contar arquivos em src/
ls src/ | wc -l

# 3. Listar arquivos e salvar em lista.txt
find . -type f > lista-arquivos.txt

# 4. Ver conteúdo de todos os README.md
find . -name "README.md" -exec cat {} \;
```

### Fase 7: Fazer backup

```bash
# Copie a pasta src para backup
cp -r src backup/src-backup

# Verifique
ls -la backup/

# Ou faça backup de um arquivo específico
cp README.md README.md.backup
```

### Fase 8: Limpar/Reorganizar

```bash
# 1. Ver o tamanho dos arquivos
du -sh src/

# 2. Remover arquivos desnecessários (com confirmação)
rm -i backup/src-backup/utils.js

# 3. Renomear um arquivo
mv testes/teste2.sh testes/teste_instalacao.sh

# Verifique resultado
ls -la testes/
```

### Fase 9: Criar resumo final

```bash
# Crie um arquivo com informações do projeto
cat > PROJETO-INFO.txt << 'AQUI'
=== INFORMAÇÕES DO PROJETO ===
Nome: Meu Projeto
Criado: $(date)
Arquivos totais: $(find . -type f | wc -l)
Diretórios: $(find . -type d | wc -l)
AQUI

# Mostre o resultado
cat PROJETO-INFO.txt
```

## 🎮 Desafios extras (se terminar cedo)

1. **Desafio 1:** Crie um arquivo de log com informações do sistema
   ```bash
   echo "Informações do sistema" > logs.txt
   echo "Usuário: $(whoami)" >> logs.txt
   echo "Data: $(date)" >> logs.txt
   ```

2. **Desafio 2:** Procure por todos os arquivos maiores que 100 bytes
   ```bash
   find . -size +100c
   ```

3. **Desafio 3:** Crie um script que lista todos os arquivos com suas permissões
   ```bash
   nano listar.sh
   # (dentro: find . -ls)
   # chmod +x listar.sh
   # ./listar.sh
   ```

4. **Desafio 4:** Use pipes para mostrar quantos arquivos de cada tipo tem
   ```bash
   find . -type f | cut -d'.' -f2 | sort | uniq -c
   ```

## ✅ Checklist final

- [ ] Criei estrutura com `mkdir -p`
- [ ] Criei arquivos com `touch` e `echo`
- [ ] Editei alguns com `nano`
- [ ] Dei permissão com `chmod +x`
- [ ] Usei `find` para procurar
- [ ] Usei `grep -r` para buscar
- [ ] Usei pipes com `|` para processar
- [ ] Fiz backup com `cp -r`
- [ ] Removi arquivos com `rm`
- [ ] Renomei com `mv`
- [ ] Entendo toda a estrutura que criei

## 🎯 Próximos passos

Parabéns! Você dominou o terminal. No **Dia 2**, você:

1. Vai inicializar Git neste projeto (`git init`)
2. Vai fazer commits (`git commit`)
3. Vai clonar repositórios (`git clone`)
4. Vai trabalhar com branches (`git branch`)
5. Vai fazer push para GitHub (`git push`)

**Dica:** guarde este projeto — você vai usar ele no Dia 2!

---

*Exercício Final — Oficina de Git & Linux · UFERSA*
