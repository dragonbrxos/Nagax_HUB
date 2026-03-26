# Manual de Uso - Nagax HUB

Este manual detalha como configurar e operar cada módulo do Nagax HUB.

---

## Módulo Principal (Main.lua)
O Main.lua é o coração do script. Ele gerencia o carregamento de todos os outros módulos.
- **Smart Orchestrator:** Gerencia a lógica de decisão.
- **LoadModule:** Carrega scripts do GitHub de forma assíncrona.

## Modo Auto (Kaitun)
Ao executar o Auto.lua, o script entra no modo de automação total:
1.  **Check Special:** Verifica se há eventos de mar (Sea Beasts, Terrorsharks) ou Lua Cheia.
2.  **Item Quest:** Se o nível for suficiente, tenta completar puzzles de itens (Saber, etc.).
3.  **Level Farm:** Se nada especial estiver acontecendo, foca em subir de nível no Sea atual.

## Modo Manual (UI)
Ao executar o Manual.lua, a interface PiHub será aberta com as seguintes abas:

### Combat & Bounty
- **Auto Bounty:** Ataca jogadores próximos automaticamente para ganhar recompensa.
- **Combat Bypass:** Desativa detecções de velocidade e teleporte.

### Sea Events
- **Kitsune Event:** Automação completa para a ilha Kitsune.
- **Sea Beast Farm:** Ataca e mata Sea Beasts automaticamente.

### Fruit System
- **Fruit Sniper:** Monitora a loja e compra frutas específicas assim que entram em estoque.
- **Auto Eat:** Come a fruta selecionada automaticamente.
- **Fruit Notifier:** Avisa quando uma fruta spawna no servidor.

### Auto Stats
- **Point Distribution:** Escolha onde gastar seus pontos (Melee, Defense, Sword, Gun, Fruit).
- **Point Stats:** Define a quantidade de pontos a serem gastos por vez.

### World Teleport
- **Sea Teleport:** Viaje entre World 1, 2 e 3 instantaneamente.
- **Island Teleport:** Teleporte-se para qualquer ilha do mapa atual.

---

## Solução de Problemas (Troubleshooting)

| Problema | Causa Provável | Solução |
| :--- | :--- | :--- |
| **Script não carrega** | Conexão com GitHub falhou | Verifique se o seu executor tem acesso à internet. |
| **Teleporte Detectado** | Safe Farm desativado | Certifique-se de que a opção _G.SafeFarm está como true. |
| **Auto Farm não ataca** | Arma não equipada | Selecione uma arma na aba de configurações (Melee, Sword ou Fruit). |

---

## Para Desenvolvedores
Se você deseja adicionar um novo módulo:
1.  Crie o arquivo .lua na pasta /Modules.
2.  Adicione a chamada Main:GetModule("Pasta/Arquivo") no Manual.lua.
3.  Certifique-se de que o módulo retorne uma tabela ou função se precisar ser chamado pelo Main.lua.
