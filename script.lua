-- FIX VERSION

local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", PlayerGui)

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local FarmBtn = Instance.new("TextButton", Frame)
FarmBtn.Size = UDim2.new(0.8,0,0,40)
FarmBtn.Position = UDim2.new(0.1,0,0.3,0)
FarmBtn.Text = "Auto Farm: OFF"

local SkillBtn = Instance.new("TextButton", Frame)
SkillBtn.Size = UDim2.new(0.8,0,0,40)
SkillBtn.Position = UDim2.new(0.1,0,0.6,0)
SkillBtn.Text = "Skill Spam: OFF"

local farming = false
local skill = false

FarmBtn.MouseButton1Click:Connect(function()
    farming = not farming
    FarmBtn.Text = farming and "Auto Farm: ON" or "Auto Farm: OFF"
end)

SkillBtn.MouseButton1Click:Connect(function()
    skill = not skill
    SkillBtn.Text = skill and "Skill Spam: ON" or "Skill Spam: OFF"
end)

-- LOOP FIX
task.spawn(function()
    while true do
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")

        if hrp then
            if farming then
                -- TELE (bạn sửa tọa độ thật)
                hrp.CFrame = CFrame.new(100, 10, 100)
            end

            if skill then
                -- THAY vì VirtualInput → dùng tool
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end
        end

        task.wait(1)
    end
end)
