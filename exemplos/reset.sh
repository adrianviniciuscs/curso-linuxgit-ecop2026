#!/bin/bash

echo "🔄 Resetando exemplos do Dia 1..."
echo "⚠️  Isso vai remover arquivos criados durante os exercícios"
echo ""

read -p "Tem certeza? (s/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Ss]$ ]]; then
    echo "❌ Cancelado"
    exit 1
fi

echo "🗑️  Limpando..."

# Remove arquivos criados nos exercícios
rm -rf 1-terminal-basico/primeiro.txt 1-terminal-basico/arquivo.txt 1-terminal-basico/teste.sh 2>/dev/null
rm -rf 2-usuarios-permissoes/teste.sh 2>/dev/null
rm -rf 3-busca-grep-find/resultado.txt 3-busca-grep-find/usuarios-ativos.txt 3-busca-grep-find/lista-arquivos.txt 3-busca-grep-find/quantidade-erros.txt 2>/dev/null
rm -rf 4-pipes-encadeamento/usuarios-ativos.txt 4-pipes-encadeamento/usuarios-inativos.txt 4-pipes-encadeamento/resultado.txt 4-pipes-encadeamento/quantidade-txt.txt 4-pipes-encadeamento/contagem.txt 2>/dev/null
rm -rf 5-edicao-nano/primeiro.txt 5-edicao-nano/arquivo.txt 5-edicao-nano/arquivo.txt.backup 2>/dev/null
rm -rf exercicio-final/meu-projeto 2>/dev/null

echo "✅ Reset completo!"
echo ""
echo "Os arquivos de dados ainda estão lá:"
echo "  - 3-busca-grep-find/sistema.log"
echo "  - 4-pipes-encadeamento/usuarios.csv"
echo ""
echo "Você pode começar os exercícios novamente!"
