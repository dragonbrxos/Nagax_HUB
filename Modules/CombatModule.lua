local CombatModule = {}

CombatModule.Config = {
    -- Configurações de posicionamento (recebidas do script principal)
    AttackHeight = nil,           -- Altura acima do inimigo (ex: 15-40 studs)
    AttackDistance = nil,         -- Distância do ataque (ex: 10-50 studs)
    
    -- Configurações de combate
    AttackDelay = nil,            -- Delay entre ataques (ex: 0.1-1.0)
    AutoClick = nil,              -- true/false
    UseSkill = nil,               -- true/false para usar skills automáticas
    
    -- Tipo de combate (definido pelo script principal)
    CombatType = nil,             -- "Melee", "Sword", "Fruit", "Gun"
    
    -- Configurações específicas por tipo
    SkillZ = nil,                 -- true/false
    SkillX = nil,                 -- true/false  
    SkillC = nil,                 -- true/false
    SkillV = nil,                 -- true/false
    SkillF = nil,                 -- true/false
    
    -- Configurações avançadas
    FastAttack = nil,             -- true/false
    BypassAttack = nil,           -- true/false
    TeamCheck = nil               -- true/false - não atacar aliados
}

function CombatModule:Init(config)
    self.Config = setmetatable(config or {}, {__index = self.Config})
    self.IsAttacking = false
    self.CurrentTarget = nil
    return self
end

-- Posiciona o jogador acima do alvo
function CombatModule:PositionAbove(targetPosition)
    if not self.Config.AttackHeight or not self.Config.AttackDistance then return end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    -- Calcula posição acima do alvo
    local targetCFrame = CFrame.new(targetPosition)
    local abovePosition = targetCFrame.Position + Vector3.new(0, self.Config.AttackHeight, 0)
    
    -- Mantém distância configurada
    local direction = (hrp.Position - abovePosition).Unit
    local finalPosition = abovePosition + (direction * self.Config.AttackDistance)
    
    hrp.CFrame = CFrame.new(finalPosition, targetPosition)
end

-- Sistema de ataque melee (soco)
function CombatModule:MeleeAttack()
    if not self.Config.AutoClick then return end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    -- Simula clique para ataque melee
    local tool = character:FindFirstChildOfClass("Tool")
    if tool and tool.Name == "Combat" then
        tool:Activate()
    end
    
    -- Fast attack implementation
    if self.Config.FastAttack then
        for i = 1, 5 do
            if tool then tool:Activate() end
            if self.Config.AttackDelay then
                task.wait(self.Config.AttackDelay / 5)
            end
        end
    end
end

-- Sistema de ataque com espada
function CombatModule:SwordAttack()
    if not self.Config.AutoClick then return end
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local tool = character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("SwordScript") then
        tool:Activate()
        
        -- Skills da espada
        if self.Config.UseSkill then
            self:UseSkills()
        end
    end
end

-- Sistema de ataque com fruta
function CombatModule:FruitAttack()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    -- Verifica se tem fruta equipada
    local tool = character:FindFirstChildOfClass("Tool")
    if tool and (tool:FindFirstChild("FruitScript") or tool.Name:match("Fruit")) then
        if self.Config.AutoClick then
            tool:Activate()
        end
        
        -- Usa skills da fruta
        if self.Config.UseSkill then
            self:UseSkills()
        end
    end
end

-- Usa skills configuradas (Z, X, C, V, F)
function CombatModule:UseSkills()
    local player = game.Players.LocalPlayer
    
    local skills = {
        Z = self.Config.SkillZ,
        X = self.Config.SkillX,
        C = self.Config.SkillC,
        V = self.Config.SkillV,
        F = self.Config.SkillF
    }
    
    for key, enabled in pairs(skills) do
        if enabled then
            game:GetService("VirtualInputManager"):SendKeyEvent(true, key, false, game)
            task.wait(0.1)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, key, false, game)
            
            if self.Config.AttackDelay then
                task.wait(self.Config.AttackDelay)
            end
        end
    end
end

-- Função principal de ataque - decide qual tipo usar
function CombatModule:Attack(targetPosition, targetInstance)
    if not self.Config.CombatType then return end
    
    self.IsAttacking = true
    self.CurrentTarget = targetInstance
    
    -- Posiciona acima do alvo
    self:PositionAbove(targetPosition)
    
    -- Executa ataque baseado no tipo configurado
    if self.Config.CombatType == "Melee" then
        self:MeleeAttack()
    elseif self.Config.CombatType == "Sword" then
        self:SwordAttack()
    elseif self.Config.CombatType == "Fruit" then
        self:FruitAttack()
    elseif self.Config.CombatType == "Gun" then
        self:GunAttack()
    end
    
    if self.Config.AttackDelay then
        task.wait(self.Config.AttackDelay)
    end
end

-- Ataque com arma de fogo (se necessário)
function CombatModule:GunAttack()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local tool = character:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("GunScript") then
        tool:Activate()
    end
end

-- Para o ataque
function CombatModule:Stop()
    self.IsAttacking = false
    self.CurrentTarget = nil
end

-- Verifica se pode atacar (cooldown, stamina, etc)
function CombatModule:CanAttack()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return false end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if not humanoid or humanoid.Health <= 0 then return false end
    
    return true
end

return CombatModule
