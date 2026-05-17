<p align="center">
  <img src="../../materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="180">
</p>

# 4. Pipes e Encadeamento de Comandos

## 📖 Objetivo

Aprender a conectar comandos usando pipes e redirecionamento, criando "pipelines" poderosos.

## 🎯 Conceitos

- **Pipe (`|`):** passa a saída de um comando para entrada de outro
- **Redirecionamento (`>`, `>>`):** salva saída em arquivo
- **Encadeamento (`&&`, `;`, `||`):** executa vários comandos em sequência

## 📂 Arquivos de exemplo

Esta pasta contém:
- `usuarios.csv` — dados de usuários para praticar pipes

## 📝 Exercícios

### Exercício 1: Pipe básico — `|`

O pipe pega a saída de um comando e passa como entrada para o próximo.

```bash
# Listar arquivos e filtrar só os que contêm "usuario"
$ ls -la | grep "usuario"

# Histórico de comandos que contêm "python"
$ history | grep "python"

# Ver processos e procurar por "bash"
$ ps aux | grep "bash"
```

**Como funciona:**
```
ls -la      (output: lista de arquivos)
    |       (pipe: passa para o próximo)
grep "usuario" (input: procura por "usuario")
```

### Exercício 2: Redirecionamento — `>` e `>>`

Salvar saída em arquivo.

```bash
# Criar arquivo novo (ou sobrescrever)
$ echo "Primeira linha" > teste.txt
$ cat teste.txt
Primeira linha

# Adicionar ao arquivo (NÃO sobrescreve)
$ echo "Segunda linha" >> teste.txt
$ cat teste.txt
Primeira linha
Segunda linha

# Salvar resultado de grep em arquivo
$ grep "ativo" usuarios.csv > usuarios-ativos.txt

# Salvar erro em arquivo (avançado)
$ comando-invalido 2> erro.txt
```

### Exercício 3: Combinando pipe + redirecionamento

```bash
# Procurar por usuários ativos e salvar em arquivo
$ grep "ativo" usuarios.csv > resultado.txt

# Procurar, contar linhas, e salvar
$ grep "ativo" usuarios.csv | wc -l > contagem.txt

# Procurar, ordenar, e salvar
$ grep "ativo" usuarios.csv | sort > usuarios-ativos-ordenados.txt
```

### Exercício 4: Múltiplos pipes

Encadear vários pipes para processar dados:

```bash
# 1. Pegar arquivo
# 2. Filtrar por "ativo"
# 3. Contar linhas
$ cat usuarios.csv | grep "ativo" | wc -l
6

# 1. Listar arquivos
# 2. Contar quantos são .txt
# 3. Salvar resultado
$ ls -la | grep ".txt" | wc -l > quantidade-txt.txt
```

### Exercício 5: Encadeamento — `&&`, `;`, `||`

#### `&&` — só roda o próximo se o anterior tiver SUCESSO

```bash
# Cria pasta E entra nela (só entra se mkdir suceder)
$ mkdir nova-pasta && cd nova-pasta

# Actualiza AND instala (só instala se update suceder)
$ sudo apt update && sudo apt install python3

# Se qualquer comando falhar, para
$ comando1 && comando2 && comando3
# Se comando1 falhar, comando2 e comando3 não rodam
```

#### `;` — roda independente do resultado

```bash
# Roda mesmo que o primeiro falhe
$ mkdir nova-pasta ; cd nova-pasta

# Se a pasta já existe, mkdir falha, mas cd tenta mesmo assim
```

#### `||` — roda SÓ SE o anterior FALHAR

```bash
# Se comando1 falhar, roda comando2
$ comando1 || comando2

# Exemplo prático:
$ npm start || echo "Erro ao iniciar!"

# Se npm start funcionar, echo não roda
# Se npm start falhar, echo roda
```

### Exercício 6: Prática com usuarios.csv

Responda estas perguntas usando pipes:

```bash
# 1. Contar usuários "ativo"
$ grep "ativo" usuarios.csv | wc -l

# 2. Ver só nomes de usuários ativos
$ grep "ativo" usuarios.csv | cut -d',' -f2

# 3. Ver usuários "bloqueado"
$ grep "bloqueado" usuarios.csv

# 4. Contar cada status
$ cut -d',' -f4 usuarios.csv | grep -v "status" | sort | uniq -c

# 5. Salvar usuários inativo em arquivo
$ grep "inativo" usuarios.csv > usuarios-inativos.txt
```

### Exercício 7: Pipeline real

Exemplo de caso de uso real — processar um log:

```bash
# Arquivo de log tem 1000 linhas
# 1. Filtrar linhas com "ERROR"
# 2. Contar quantas são
# 3. Salvar resultado
$ grep "ERROR" sistema.log | wc -l > quantidade-erros.txt

# Ou:
# 1. Pegar timestamps de erros
# 2. Ordenar
# 3. Salvar
$ grep "ERROR" sistema.log | cut -d' ' -f1-2 > erros-timeline.txt
```

## 📊 Comandos importantes

```bash
comando | próximo              # pipe
comando > arquivo              # redireciona (sobrescreve)
comando >> arquivo             # redireciona (adiciona)
comando1 && comando2           # só roda cmd2 se cmd1 suceder
comando1 ; comando2            # roda ambos (independente)
comando1 || comando2           # roda cmd2 se cmd1 falhar

cut -d',' -f2 arquivo.csv      # pega coluna 2 (separador ,)
sort arquivo.txt               # ordena
uniq arquivo.txt               # remove linhas duplicadas
wc -l arquivo.txt              # conta linhas
```

## 🎮 Desafios extras

1. **Desafio 1:** Contar quantas linhas o arquivo usuarios.csv tem
   ```bash
   cat usuarios.csv | wc -l
   ```

2. **Desafio 2:** Ver só os nomes dos usuários (sem header)
   ```bash
   tail -n +2 usuarios.csv | cut -d',' -f2
   ```

3. **Desafio 3:** Salvar usuários "ativo" ordenados em arquivo
   ```bash
   grep "ativo" usuarios.csv | sort > usuarios-ativo-ordenado.txt
   ```

4. **Desafio 4:** Encadeie 3 comandos
   ```bash
   mkdir teste && cd teste && echo "Sucesso!"
   ```

## ✅ Checklist

- [ ] Entendo o que é um pipe `|`
- [ ] Consigo redirecionar com `>` e `>>`
- [ ] Sei a diferença entre `&&`, `;` e `||`
- [ ] Consigo encadear vários comandos
- [ ] Entendo fluxo de dados entre comandos

---

**Próximo passo:** vá para `5-edicao-nano/`
