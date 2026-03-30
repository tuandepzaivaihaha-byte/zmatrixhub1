repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer

local player = game.Players.LocalPlayer

-- SETTINGS
local farming = false
local skill = false

-- TOGGLE (gắn vào nút của bạn)
FarmBtn.MouseButton1Click:Connect(function()
    farming = not farming
    FarmBtn.Text = farming and "Auto Farm: ON" or "Auto Farm: OFF"
end)

SkillBtn.MouseButton1Click:Connect(function()
    skill = not skill
    SkillBtn.Text = skill and "Skill Spam: ON" or "Skill Spam: OFF"
end)

-- FUNCTION: FIND MOB
local function getMob()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:FindFirstChild("Humanoid") and v ~= player.Character then
            return v
        end
    end
end

-- MAIN LOOP
task.spawn(function()
    while true do
        pcall(function()
            local char = player.Character
            if not char then return end

            local hrp = char:FindFirstChild("HumanoidRootPart")

            -- AUTO FARM
            if farming and hrp then
                local mob = getMob()
                if mob and mob:FindFirstChild("HumanoidRootPart") then
                    hrp.CFrame = mob.HumanoidRootPart.CFrame * CFrame.new(0,5,3)
                end
            end

            -- SKILL SPAM (KEY)
            if skill then
                game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)

                game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)

                game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)
                game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
            end
        end)
        task.wait(0.2)
    end
end)
