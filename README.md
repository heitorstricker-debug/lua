# Dress to Impress Map (Roblox Lua)

Este projeto cria um mapa inspirado no estilo "Dress to Impress" com mais de 14 roupas (20 looks exibidos), passarela detalhada e uma UI mais rica para o lobby.

## Conteúdo
- **Mapa** com passarela expandida, luzes de palco, estandes de foto e lounge VIP.
- **Looks** com 20 manequins estilizados e iluminação individual.
- **UI** com painel principal, destaque visual, botões nomeados e dica de exploração.

## Como usar no Roblox Studio
1. Crie um Script em `ServerScriptService` e copie o conteúdo de `src/main.server.lua`.
2. Copie `MapBuilder.lua` e `UIBuilder.lua` para o mesmo local do Script principal.
3. Rode o jogo para gerar o mapa e a UI automaticamente.

## Personalização rápida
- Edite a tabela `OUTFITS` em `MapBuilder.lua` para alterar nomes e cores dos looks.
- Ajuste tamanhos/posições da UI em `UIBuilder.lua`.
- Ajuste as funções `buildStageLights`, `buildPhotoBooths` e `buildVIPLounge` para variar o cenário.
