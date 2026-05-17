<p align="center">
  <img src="figuras/logo-paradevs.png" alt="Logo Paradevs" width="240">
</p>

# Oficina de Git & Linux
### UFERSA — Campus Pau dos Ferros
**ECOP · 17 e 18 de Maio de 2026 · 14h–16h · Laboratório 2 - LTI**

---

> **Para quem é esse material?**
> Essas notas acompanham os dois dias de oficina e servem como referência para consulta depois. Não precisa decorar nada — o objetivo é que você saia sabendo *onde* encontrar o que precisa e com prática suficiente pra não ter medo do terminal.

---

## Sumário

- [Dia 1 — Linux & Git](#dia-1--linux--git)
  - [A história do Linux](#1-a-história-do-linux)
  - [Open source — o que é e por que importa](#2-open-source--o-que-é-e-por-que-importa)
  - [Distribuições Linux](#3-distribuições-linux)
  - [Linux no seu computador — opções de uso](#4-linux-no-seu-computador--opções-de-uso)
  - [O terminal](#5-o-terminal)
  - [Navegando pelo sistema de arquivos](#6-navegando-pelo-sistema-de-arquivos)
  - [Manipulando arquivos e diretórios](#7-manipulando-arquivos-e-diretórios)
  - [Exercício guiado — Organize seu projeto](#8-exercício-guiado--organize-seu-projeto)
  - [Primeiro contato com Git](#9-primeiro-contato-com-git)
- [Dia 2 — Git & GitHub](#dia-2--git--github)
  - [Por que controle de versão?](#1-por-que-controle-de-versão)
  - [O ciclo Git](#2-o-ciclo-git)
  - [Repositório local — na prática](#3-repositório-local--na-prática)
  - [Inspecionando o histórico](#4-inspecionando-o-histórico)
  - [Branches](#5-branches)
  - [GitHub — indo para a nuvem](#6-github--indo-para-a-nuvem)
  - [Exercício final — Colaboração simulada](#7-exercício-final--colaboração-simulada)
- [Referência rápida](#referência-rápida)
- [Próximos passos](#próximos-passos)



# Dia 2 — Git & GitHub

**Ministrante:** Gustavo Fontes  
**Horário:** 14h00 – 16h00  
**Pré-requisito:** ter participado do Dia 1 (ou saber navegar pelo terminal) e, de preferência, ter conta no GitHub.

---

## 1. Por que controle de versão?

### O cenário sem Git

Quem nunca fez isso?

```
projeto-final.zip
projeto-final-v2.zip
projeto-final-AGORA-VAI.zip
projeto-final-entrega.zip
projeto-final-entrega-REAL.zip
```

Isso é controle de versão manual — e não escala. Problemas:

- Difícil saber o que mudou entre versões
- Impossível colaborar sem sobrescrever o trabalho dos outros
- Qualquer erro pode ser irreversível

### O que Git resolve

| Problema | Solução com Git |
|---|---|
| "Estraguei tudo e não consigo voltar" | `git checkout` para qualquer commit anterior |
| "Não sei o que mudou desde ontem" | `git diff` e `git log` |
| "Não consigo trabalhar com mais pessoas" | Branches + merge + pull requests |
| "Onde está a versão que funcionava na demo?" | Tags e hash de commits |

### Git ≠ GitHub

| Git | GitHub |
|---|---|
| Ferramenta de controle de versão | Plataforma web para hospedar repositórios Git |
| Roda localmente no seu computador | Serviço na nuvem |
| Criado por Linus Torvalds (2005) | Fundado em 2008, comprado pela Microsoft em 2018 |
| Open source | Serviço proprietário (com plano gratuito generoso) |

> Git é o motor. GitHub é uma das garagens onde você estaciona seu projeto. Existem alternativas: GitLab, Bitbucket, Codeberg.

---

## 2. O ciclo Git

Entender esse fluxo é a base de tudo:

```
┌─────────────────┐   git add    ┌───────────┐   git commit   ┌────────────────┐
│   Working Tree  │ ──────────▶  │   Stage   │ ─────────────▶ │  Repositório   │
│  (seus arquivos)│              │ (index)   │                │  local (.git)  │
└─────────────────┘              └───────────┘                └────────────────┘
                                                                       │
                                                                  git push
                                                                       │
                                                                       ▼
                                                              ┌────────────────┐
                                                              │    GitHub      │
                                                              │   (remoto)     │
                                                              └────────────────┘
```

- **Working Tree:** os arquivos que você vê e edita normalmente
- **Stage (index):** área de preparação — você escolhe o que vai para o próximo commit
- **Repositório local:** o histórico de commits, armazenado na pasta `.git`
- **Remoto (GitHub):** cópia do repositório na nuvem, acessível por qualquer pessoa autorizada

---

## 3. Repositório local — na prática

### Configuração inicial (uma vez por máquina)

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu@email.com"
git config --global core.editor nano        # editor padrão (opcional)
git config --list                           # confirma as configurações
```

### Iniciando um repositório

```bash
cd meu-projeto          # entrar na pasta do projeto do Dia 1
git init                # inicializa o repositório Git
ls -la                  # agora existe uma pasta .git aqui
```

A pasta `.git` é onde o Git guarda todo o histórico. **Nunca delete essa pasta.**

### O ciclo básico — passo a passo

#### 1. Verificar o estado

```bash
git status
```

Saída típica:

```
On branch main

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        README.md
        src/
        docs/

nothing added to commit but untracked files present
```

"Untracked" = Git sabe que o arquivo existe, mas não está rastreando ele ainda.

#### 2. Adicionar ao stage

```bash
git add README.md                  # adiciona um arquivo específico
git add src/                       # adiciona uma pasta inteira
git add .                          # adiciona tudo no diretório atual
```

Após o `git add`, o `git status` mostra:

```
Changes to be committed:
        new file:   README.md
        new file:   src/index.html
        ...
```

#### 3. Criar o commit

```bash
git commit -m "feat: estrutura inicial do projeto"
```

Boas mensagens de commit:

```bash
git commit -m "feat: adiciona página inicial"      # nova funcionalidade
git commit -m "fix: corrige link quebrado no menu" # correção de bug
git commit -m "docs: atualiza README"              # documentação
git commit -m "refactor: reorganiza pastas src"    # refatoração
```

### Fazendo mais commits — prática

```bash
# Editar o README
echo "## Tecnologias" >> README.md
echo "- HTML" >> README.md
echo "- CSS" >> README.md

# Ver o que mudou
git status
git diff README.md       # mostra as mudanças em detalhe

# Commitar
git add README.md
git commit -m "docs: adiciona seção de tecnologias ao README"

# Mais uma alteração
echo "<!-- Página inicial -->" > src/index.html
echo "<h1>Meu Projeto</h1>" >> src/index.html

git add src/index.html
git commit -m "feat: adiciona conteúdo básico ao index.html"
```

---

## 4. Inspecionando o histórico

### `git log`

```bash
git log                     # histórico completo
git log --oneline           # uma linha por commit (mais legível)
git log --oneline --graph   # com representação visual de branches
git log -5                  # apenas os 5 commits mais recentes
```

Exemplo de saída do `git log --oneline`:

```
a3f2c1d (HEAD -> main) feat: adiciona conteúdo básico ao index.html
9b1e4f0 docs: adiciona seção de tecnologias ao README
c7a8d3e feat: estrutura inicial do projeto
```

- O hash (`a3f2c1d`) identifica o commit de forma única
- `HEAD` aponta para onde você está agora
- `main` é o nome da branch atual

### `git diff`

```bash
git diff                    # mudanças não staged (working tree vs stage)
git diff --staged           # mudanças staged (stage vs último commit)
git diff a3f2c1d 9b1e4f0   # diferença entre dois commits
```

### `git show`

```bash
git show                    # detalha o último commit
git show a3f2c1d            # detalha um commit específico
```

---

## 5. Branches

### O que são branches?

Uma branch é uma linha paralela de desenvolvimento. Você pode trabalhar em uma nova funcionalidade sem afetar o código principal (`main`).

```
main:     A ── B ── C ──────────── F (merge)
                     \            /
feature:              D ── E ────
```

- Commits A, B, C aconteceram na `main`
- Você criou a branch `feature` a partir de C
- Fez commits D e E na feature
- Quando terminou, fez merge de volta na `main` (commit F)

### Comandos de branch

```bash
git branch                          # lista todas as branches
git branch nova-feature             # cria uma nova branch
git checkout nova-feature           # muda para a branch
git checkout -b outra-feature       # cria E já muda (atalho)
git branch -d nome                  # deleta a branch (após merge)
```

### Prática com branches

```bash
# Criar uma branch para desenvolver uma nova seção
git checkout -b feature/contato

# Fazer alterações nessa branch
echo "<h2>Contato</h2>" >> src/index.html
echo "<p>email@exemplo.com</p>" >> src/index.html

# Commitar na branch
git add src/index.html
git commit -m "feat: adiciona seção de contato"

# Ver a diferença entre as branches
git log --oneline --graph --all

# Voltar para a main
git checkout main

# Verificar: a alteração NÃO está na main ainda
cat src/index.html

# Fazer o merge
git merge feature/contato

# Agora está!
cat src/index.html

# Deletar a branch (já foi integrada)
git branch -d feature/contato
```

### O que fazer quando tem conflito?

Um conflito acontece quando dois commits modificaram a mesma linha de formas diferentes. O Git marca o arquivo assim:

```
<<<<<<< HEAD
conteúdo da branch atual
=======
conteúdo da branch que está sendo mergeada
>>>>>>> feature/contato
```

**Como resolver:**

1. Abrir o arquivo com conflito
2. Escolher qual versão manter (ou combinar as duas)
3. Remover as marcações (`<<<<<<<`, `=======`, `>>>>>>>`)
4. Salvar, `git add` e `git commit`

> Na maioria dos projetos pequenos, conflitos são raros. Quando acontecem, não entre em pânico — o Git está te dizendo exatamente onde o problema está.

---

## 6. GitHub — indo para a nuvem

### Criando um repositório no GitHub

1. Acesse [github.com](https://github.com) e faça login
2. Clique em **New repository** (botão verde ou ícone `+`)
3. Dê um nome ao repositório (ex: `meu-projeto`)
4. Deixe como **Public**
5. **Não** marque "Add a README" (já temos um)
6. Clique em **Create repository**

O GitHub vai mostrar os comandos. Siga a segunda opção (*"push an existing repository"*):

### Conectando o repositório local ao GitHub

```bash
# Adicionar o repositório remoto
git remote add origin https://github.com/seu-usuario/meu-projeto.git

# Verificar se foi configurado
git remote -v

# Enviar os commits para o GitHub
git push -u origin main
```

- `origin` é o nome que damos ao remoto (convenção, pode ser qualquer nome)
- `-u` configura o upstream — depois, só precisar de `git push`

### Comandos do dia a dia com remoto

```bash
git push                        # envia commits locais para o GitHub
git pull                        # baixa e aplica mudanças do GitHub
git fetch                       # baixa mudanças mas não aplica
git clone URL                   # clona um repositório do zero
git remote -v                   # lista os remotos configurados
```

### Clonando um repositório

```bash
git clone https://github.com/usuario/repositorio.git
cd repositorio
```

Isso cria uma cópia local completa, já com todo o histórico.

### Pull Requests (PR)

Um **Pull Request** é uma solicitação para que suas alterações (de uma branch ou fork) sejam incorporadas ao repositório principal. É o fluxo de colaboração padrão no GitHub.

**Fluxo típico em um projeto colaborativo:**

```
1. fork ou clone do repositório
2. criar branch: git checkout -b feature/minha-funcionalidade
3. fazer alterações e commits
4. git push origin feature/minha-funcionalidade
5. abrir Pull Request no GitHub
6. alguém revisa o código
7. PR é aprovado e mergeado na main
```

---

## 7. Exercício final — Colaboração simulada

**O objetivo é simular o fluxo real de contribuição em um projeto open source.**

O repositório da oficina foi criado pelo ministrante e está disponível no GitHub. Cada participante vai:

### Passo 1 — Clonar o repositório da oficina

```bash
git clone https://github.com/[usuario-do-ministrante]/oficina-ufersa.git
cd oficina-ufersa
ls
```

### Passo 2 — Criar sua branch

```bash
git checkout -b participante/seu-nome
```

Use seu nome sem espaços e com letras minúsculas, por exemplo:
`participante/joao-silva`

### Passo 3 — Fazer sua contribuição

Adicione uma linha no arquivo `participantes.txt`:

```bash
echo "Seu Nome — o que achou da oficina" >> participantes.txt
cat participantes.txt     # verificar
```

### Passo 4 — Commitar e enviar

```bash
git add participantes.txt
git commit -m "feat: adiciona participante Seu Nome"
git push origin participante/seu-nome
```

### Passo 5 (bônus) — Abrir um Pull Request

1. Acesse o repositório no GitHub
2. Você vai ver um banner: *"Compare & pull request"*
3. Clique, adicione uma descrição e abra o PR
4. O ministrante vai fazer o merge ao vivo!

---

# Referência rápida

## Linux

| Comando | O que faz |
|---|---|
| `pwd` | Mostra o diretório atual |
| `ls` | Lista arquivos e pastas |
| `ls -la` | Lista com detalhes e ocultos |
| `cd pasta/` | Entra em um diretório |
| `cd ..` | Volta um nível |
| `cd ~` | Vai para o home |
| `mkdir nome` | Cria um diretório |
| `mkdir -p a/b/c` | Cria estrutura aninhada |
| `touch arq` | Cria arquivo vazio |
| `echo "txt" > arq` | Escreve em arquivo |
| `cat arq` | Exibe conteúdo do arquivo |
| `cp origem dest` | Copia arquivo |
| `cp -r dir/ dest/` | Copia diretório |
| `mv origem dest` | Move ou renomeia |
| `rm arq` | Remove arquivo |
| `rm -r pasta/` | Remove pasta e conteúdo |
| `man cmd` | Abre o manual do comando |
| `history` | Histórico de comandos |
| `clear` | Limpa a tela |

## Git

| Comando | O que faz |
|---|---|
| `git config --global user.name "Nome"` | Define seu nome |
| `git config --global user.email "e@mail"` | Define seu e-mail |
| `git init` | Inicializa um repositório |
| `git status` | Mostra o estado dos arquivos |
| `git add arquivo` | Adiciona arquivo ao stage |
| `git add .` | Adiciona tudo ao stage |
| `git commit -m "msg"` | Cria um commit |
| `git log` | Exibe histórico de commits |
| `git log --oneline` | Histórico resumido |
| `git diff` | Mostra mudanças não staged |
| `git diff --staged` | Mostra mudanças staged |
| `git show` | Detalha o último commit |
| `git branch` | Lista branches |
| `git branch nome` | Cria uma nova branch |
| `git checkout nome` | Muda para a branch |
| `git checkout -b nome` | Cria e já muda de branch |
| `git merge nome` | Faz merge na branch atual |
| `git branch -d nome` | Deleta uma branch |
| `git remote add origin URL` | Conecta ao repositório remoto |
| `git remote -v` | Lista remotos configurados |
| `git push -u origin main` | Envia commits (primeira vez) |
| `git push` | Envia commits |
| `git pull` | Atualiza do remoto |
| `git clone URL` | Clona um repositório |

## Erros comuns e soluções

| Erro | Causa provável | Solução |
|---|---|---|
| `not a git repository` | Pasta sem `.git` | Rode `git init` ou entre na pasta correta |
| `nothing to commit` | Nenhum arquivo no stage | Rode `git add .` antes do commit |
| `rejected (non-fast-forward)` | Remoto tem commits que você não tem | Rode `git pull` antes do `git push` |
| `detached HEAD` | Você fez checkout num commit direto | Rode `git checkout main` |
| `CONFLICT` durante merge | Dois commits editaram a mesma linha | Abra os arquivos, resolva e commite |

---

# Próximos passos

Você saiu da oficina sabendo usar o terminal e versionar projetos com Git. O que vem depois?

### Recursos gratuitos

| Recurso | Link | Para quê |
|---|---|---|
| **Pro Git** (livro) | [git-scm.com/book/pt-br](https://git-scm.com/book/pt-br) | Referência completa em português |
| **Learn Git Branching** | [learngitbranching.js.org](https://learngitbranching.js.org) | Visualizar branches interativamente |
| **Oh Shit, Git!** | [ohshitgit.com/pt_BR](https://ohshitgit.com/pt_BR) | Quando der errado |
| **GitHub Student Pack** | [education.github.com/pack](https://education.github.com/pack) | Ferramentas gratuitas para estudantes |
| **The Linux Command Line** | [linuxcommand.org](https://linuxcommand.org) | Aprofundar no terminal |

### Próximo nível em Git

Quando o básico estiver confortável, explore:

- `.gitignore` — quais arquivos o Git deve ignorar
- `git stash` — guardar alterações temporariamente
- `git revert` — desfazer um commit de forma segura
- `git rebase` — reescrever histórico (use com cuidado)
- GitHub Actions — automatizar testes e deploys
- Conventional Commits — padrão de mensagens de commit

### Próximo nível em Linux

- `grep` — buscar texto em arquivos
- `|` (pipe) — encadear comandos
- `chmod` — permissões de arquivos
- `nano` ou `vim` — editar arquivos pelo terminal
- `ssh` — conectar em servidores remotos
- `bash scripting` — automatizar tarefas com scripts

---

> **Uma dica final:** a melhor forma de consolidar o que aprendeu é ter um projeto real para versionar. Pode ser qualquer coisa — um site simples, um script, notas de aula. O que importa é usar Git todo dia até virar hábito.

---

*Oficina de Git & Linux · UFERSA — Campus Pau dos Ferros*  
*Material produzido para uso livre pelos participantes*
