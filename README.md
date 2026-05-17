# <div align="center">![Paradevs](materiais/figuras/logo-paradevs.png)</div>

<div align="center">

# Oficina de Git & Linux

**ECOP · UFERSA — Campus Pau dos Ferros**

Material de apoio, prática guiada e exercícios para os dois dias da oficina.

</div>

---

## Visão geral

Este repositório reúne tudo o que você precisa para acompanhar a oficina:

| Item | Descrição |
|---|---|
| `materiais/dia1-oficina-git-linux.md` | Teoria e prática do Dia 1 |
| `materiais/dia2-oficina-git-linux.md` | Teoria e prática do Dia 2 |
| `exemplos-dia1/` | Exemplos, exercícios e dados para praticar o Dia 1 |
| `slides/` | Material de apoio para apresentação |
| `figuras/` | Imagens e ilustrações usadas no conteúdo |

---

## Como usar

1. Leia o material do dia.
2. Pratique nos exemplos correspondentes.
3. Faça o exercício final quando estiver pronto.
4. Use o Dia 2 para consolidar Git e GitHub.

---

## Estrutura prática do Dia 1

```text
exemplos-dia1/
├── 1-terminal-basico/
├── 2-usuarios-permissoes/
├── 3-busca-grep-find/
├── 4-pipes-encadeamento/
├── 5-edicao-nano/
├── 6-pacotes/
└── exercicio-final/
```

---

## O que você vai praticar

| Tema | Conteúdo |
|---|---|
| Terminal | `pwd`, `ls`, `cd`, atalhos e navegação |
| Permissões | `whoami`, `id`, `sudo`, `chmod +x` |
| Busca | `find`, `grep`, `locate` |
| Texto | `nano`, `vim`, `cat`, `less`, `head`, `tail` |
| Fluxo | pipes `|`, redirecionamento `>`, `>>`, encadeamento `&&` |
| Pacotes | `apt update`, `apt install`, `apt search` |

---

## Reset dos exercícios

Dentro de `exemplos-dia1/`, use:

```bash
bash reset.sh
```

Isso limpa os arquivos criados nos exercícios sem apagar os dados de prática.

