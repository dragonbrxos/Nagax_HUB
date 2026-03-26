local AttackModule = {}

AttackModule.Config = {
    -- Velocidade de ataque (quanto menor, mais rápido)
    AttackSpeed = nil,            -- Ex: 0.1 (rápido) a 1.0 (lento)
    
    -- Configurações de click automático
    ClickDelay = nil,             -- Delay entre cliques
    MultiClick = nil,             -- Número de cliques por ciclo (1-10)
    
    -- Configurações de dano
    DamageMultiplier = nil,       -- Multiplicador de dano (se aplicável)
    CriticalHit = nil,            -- true/false para hits críticos
    
    -- Configurações de alcance
    HitboxExpansion = nil,        -- Expansão da hitbox (studs)
    AttackRange = nil,            -- Alcance máximo do ataque
    
    -- Configurações de animação
    NoAnimation = nil,            -- true/false - remove animações para velocidade
    InstantAttack = nil           -- true/false - ataque instantâneo sem delay
}

function AttackModule:Init(config)
    self.Config = setmetatable(config or {}, {__index = self.Config})
    self.LastAttack = 0
    return self
end

-- Sistema de ataque rápido otimizado
function AttackModule:FastAttack(target)
    if not self.Config.AttackSpeed then return end
    
    local currentTime = tick()
    if currentTime - self.LastAttack < self.Config.AttackSpeed then return end
    
    self.LastAttack = currentTime
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    -- Multi-click system
    local clicks = self.Config.MultiClick or 1
    for i = 1, clicks do
        self:ExecuteAttack(target)
        if self.Config.ClickDelay then
            task.wait(self.Config.ClickDelay)
        end
    end
end

-- Executa o ataque físico
function AttackModule:ExecuteAttack(target)
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local tool = character:FindFirstChildOfClass("Tool")
    if not tool then return end
    
    -- Remove animações se configurado
    if self.Config.NoAnimation then
        local animator = character:FindFirstChild("Humanoid"):FindFirstChild("Animator")
        if animator then
            for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                track:Stop()
            end
        end
    end
    
    -- Ativa a ferramenta
    tool:Activate()
    
    -- Expande hitbox se configurado
    if self.Config.HitboxExpansion and target and target:FindFirstChild("HumanoidRootPart") then
        self:ExpandHitbox(target)
    end
end

-- Expande hitbox do alvo temporariamente
function AttackModule:ExpandHitbox(target)
    if not target:FindFirstChild("HumanoidRootPart") then return end
    
    local hrp = target.HumanoidRootPart
    local originalSize = hrp.Size
    
    hrp.Size = Vector3.new(
        originalSize.X + (self.Config.HitboxExpansion or 10),
        originalSize.Y + (self.Config.HitboxExpansion or 10),
        originalSize.Z + (self.Config.HitboxExpansion or 10)
    )
    
    -- Restaura após curto período
    task.delay(0.5, function()
        if hrp then
            hrp.Size = originalSize
        end
    end)
end

-- Sistema de ataque a distância (para frutas/guns)
function AttackModule:RangedAttack(targetPosition, skillKey)
    local player = game.Players.LocalPlayer
    
    -- Simula mira e disparo
    if skillKey then
        game:GetService("VirtualInputManager"):SendKeyEvent(true, skillKey, false, game)
        task.wait(0.1)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, skillKey, false, game)
    end
end

-- Combo attack system
function AttackModule:ComboAttack(target, comboSequence)
    -- comboSequence exemplo: {"Click", "Click", "SkillZ", "Click", "SkillX"}
    if not comboSequence then return end
    
    for _, action in ipairs(comboSequence) do
        if action == "Click" then
            self:ExecuteAttack(target)
        elseif action:match("Skill") then
            local key = action:gsub("Skill", "")
            self:RangedAttack(nil, key)
        end
        
        if self.Config.AttackSpeed then
            task.wait(self.Config.AttackSpeed)
        end
    end
end

return AttackModule
