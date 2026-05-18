<div align="center">
  <img src="materiais/figuras/logo-paradevs.png" alt="Logo Paradevs" width="170">

# Oficina de Git & Linux

**ECOP · UFERSA Campus Pau dos Ferros** · **Paradevs**  

Material oficial da oficina com conteúdo teórico, prática guiada, exercícios e referência rápida.
</div>

---

## Navegação rápida

- [Visão geral](#visão-geral)
- [Estrutura do repositório](#estrutura-do-repositório)
- [Como estudar este material](#como-estudar-este-material)
- [Guia rápido de uso](#guia-rápido-de-uso)
- [Reset dos exercícios](#reset-dos-exercícios)

---

## Visão geral

Este repositório foi organizado para apoiar os dois dias da oficina:

| Dia | Foco | Material principal |
|---|---|---|
| **Dia 1** | Linux, terminal, comandos essenciais e prática | [`materiais/dia1-oficina-git-linux.md`](materiais/dia1-oficina-git-linux.md) |
| **Dia 2** | Git aplicado ao fluxo real de desenvolvimento | [`materiais/dia2-oficina-git-linux.md`](materiais/dia2-oficina-git-linux.md) |

---

## Estrutura do repositório

| Caminho | Descrição |
|---|---|
| [`materiais/`](materiais) | Apostilas, PDFs e figuras da oficina |
| [`materiais/dia1-oficina-git-linux.md`](materiais/dia1-oficina-git-linux.md) | Material completo do Dia 1 |
| [`materiais/dia2-oficina-git-linux.md`](materiais/dia2-oficina-git-linux.md) | Material completo do Dia 2 |
| [`materiais/Cheatsheet Git & Linux — Oficina UFERSA.pdf`](materiais/Cheatsheet%20Git%20%26%20Linux%20%E2%80%94%20Oficina%20UFERSA.pdf) | Cheatsheet de consulta rápida |
| [`materiais/Linux & Git - Dia 1.pdf`](materiais/Linux%20%26%20Git%20-%20Dia%201.pdf) | Slides de apresentação |
| [`exemplos/`](exemplos) | Exercícios práticos por tópico |
| [`exemplos/reset.sh`](exemplos/reset.sh) | Script para limpar arquivos gerados durante a prática |

---

## Como estudar este material

1. Comece pela apostila do **Dia 1**.
2. Pratique em paralelo com as pastas de `exemplos/`.
3. Avance para o **Dia 2** com base no projeto criado.
4. Use o cheatsheet para revisão e consulta rápida.

### Trilha prática sugerida

| Etapa | Pasta |
|---|---|
| Terminal básico | `exemplos/1-terminal-basico/` |
| Usuários e permissões | `exemplos/2-usuarios-permissoes/` |
| Busca com grep/find | `exemplos/3-busca-grep-find/` |
| Pipes e encadeamento | `exemplos/4-pipes-encadeamento/` |
| Edição de texto | `exemplos/5-edicao-nano/` |
| Pacotes | `exemplos/6-pacotes/` |
| Desafio final | `exemplos/exercicio-final/` |

---

## Guia rápido de uso

```bash
# 1) Clonar o repositório
git clone https://github.com/adrianviniciuscs/curso-linuxgit-ecop2026.git
cd curso-linuxgit-ecop2026

# 2) Abrir o conteúdo principal do Dia 1
xdg-open dia1-oficina-gitlinux.pdf

# 3) Ir para os exercícios
cd exemplos
```

---

## Reset dos exercícios

Para limpar os arquivos gerados durante as práticas:

```bash
cd exemplos
bash reset.sh
```

---

<div align="center">
  Feito para a <strong>Oficina de Git & Linux</strong> · UFERSA — Campus Pau dos Ferros

</div>
