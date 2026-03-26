local QuestModule = {}

QuestModule.Config = {
    -- Dados da missão atual (injetados pelo script principal)
    CurrentQuest = nil,           -- Tabela com dados da missão
    TargetMonster = nil,          -- Nome do monstro alvo
    QuestLevel = nil,             -- Nível da quest
    
    -- Configurações de comportamento
    AutoAcceptQuest = nil,        -- Aceitar missão automaticamente
    AutoCompleteQuest = nil,      -- Completar missão automaticamente
    
    -- Coordenadas (injetadas pelo script principal)
    QuestNPCPosition = nil,       -- Posição do NPC da missão
    MonsterFarmPosition = nil,    -- Posição para farmar monstros
    
    -- Integração com módulos externos
    CombatModule = nil,           -- Referência ao CombatModule carregado
    BringModule = nil             -- Referência ao BringModule carregado
}

function QuestModule:Init(config)
    self.Config = setmetatable(config or {}, {__index = self.Config})
    self.IsFarming = false
    self.QuestData = require("QuestDatabase") -- Carrega coordenadas do link externo
    return self
end

-- Encontra a missão adequada para o nível do jogador
function QuestModule:GetQuestForLevel(level, world)
    world = world or "World1"
    local quests = self.QuestData[world] or self.QuestData.World1
    
    for _, quest in ipairs(quests) do
        if level >= quest.Min and level <= quest.Max then
            return quest
        end
    end
    
    return nil
end

-- Inicia o farm de missão
function QuestModule:StartQuestFarm(questData)
    if not questData then return end
    
    self.Config.CurrentQuest = questData
    self.Config.TargetMonster = questData.Mon
    self.IsFarming = true
    
    -- Thread principal do farm
    task.spawn(function()
        while self.IsFarming do
            if not self:CheckQuestStatus() then
                self:AcceptQuest(questData)
            end
            
            self:FarmMonsters(questData)
            task.wait(0.1)
        end
    end)
end

-- Verifica se a missão está ativa
function QuestModule:CheckQuestStatus()
    local player = game.Players.LocalPlayer
    local questFolder = player:FindFirstChild("QuestFolder") or player:FindFirstChild("Quests")
    
    if questFolder then
        for _, quest in pairs(questFolder:GetChildren()) do
            if quest.Name == self.Config.CurrentQuest.NameQuest then
                return true
            end
        end
    end
    
    return false
end

-- Aceita a missão no NPC
function QuestModule:AcceptQuest(questData)
    if not self.Config.AutoAcceptQuest then return end
    if not questData.CFrameQuest then return end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    -- Teleporta para o NPC da missão
    hrp.CFrame = questData.CFrameQuest
    task.wait(0.5)
    
    -- Procura o NPC e ativa o diálogo
    local workspace = game:GetService("Workspace")
    local npcs = workspace:FindFirstChild("NPCs") or workspace
    
    for _, npc in pairs(npcs:GetChildren()) do
        if npc.Name == questData.NameQuest then
            local prompt = npc:FindFirstChildWhichIsA("ProximityPrompt")
            if prompt then
                fireproximityprompt(prompt)
                task.wait(0.3)
                
                -- Seleciona o nível da quest
                self:SelectQuestLevel(questData.LevelQuest)
            end
        end
    end
end

-- Seleciona o nível da missão no diálogo
function QuestModule:SelectQuestLevel(level)
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local questGui = playerGui:FindFirstChild("QuestGui") or playerGui:FindFirstChild("Dialogue")
    
    if questGui then
        local buttons = questGui:GetDescendants()
        for _, button in pairs(buttons) do
            if button:IsA("TextButton") and button.Text:match(tostring(level)) then
                button.MouseButton1Click:Fire()
                break
            end
        end
    end
end

-- Farm de monstros principal
function QuestModule:FarmMonsters(questData)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    -- Usa BringModule se disponível
    if self.Config.BringModule then
        self.Config.BringModule:BringAll(
            questData.Mon, 
            questData.CFrameMon.Position
        )
    end
    
    -- Encontra monstros para atacar
    local target = self:FindNearestMonster(questData.Mon)
    
    if target and target:FindFirstChild("HumanoidRootPart") then
        local targetPos = target.HumanoidRootPart.Position
        
        -- Usa CombatModule para atacar
        if self.Config.CombatModule then
            self.Config.CombatModule:Attack(targetPos, target)
        end
    else
        -- Se não encontrar monstro, vai para o spawn point
        if questData.CFrameMon then
            hrp.CFrame = questData.CFrameMon * CFrame.new(0, 30, 0)
        end
    end
end

-- Encontra o monstro mais próximo
function QuestModule:FindNearestMonster(monsterName)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return nil end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    
    local workspace = game:GetService("Workspace")
    local enemies = workspace:FindFirstChild("Enemies") or workspace
    
    local nearest = nil
    local minDistance = math.huge
    
    for _, enemy in pairs(enemies:GetChildren()) do
        if enemy.Name == monsterName and enemy:FindFirstChild("Humanoid") then
            if enemy.Humanoid.Health > 0 then
                local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
                if enemyHRP then
                    local distance = (hrp.Position - enemyHRP.Position).Magnitude
                    if distance < minDistance then
                        minDistance = distance
                        nearest = enemy
                    end
                end
            end
        end
    end
    
    return nearest
end

-- Para o farm
function QuestModule:Stop()
    self.IsFarming = false
    if self.Config.CombatModule then
        self.Config.CombatModule:Stop()
    end
end

return QuestModule
