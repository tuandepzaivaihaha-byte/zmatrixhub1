-- ZMatrix Hub v1.0 (Stable)

repeat task.wait() until game:IsLoaded()

local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- Remove old UI
pcall(function()
    PlayerGui:FindFirstChild("ZMatrixHub"):Destroy()
end)

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZMatrixHub"
ScreenGui.Parent = PlayerGui

-- MAIN FRAME
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 320, 0, 220)
Main.Position = UDim2.new(0.35, 0, 0.35, 0)
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- TITLE
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,35)
Title.Text = "ZMatrix Hub"
Title.TextColor3 = Color3.fromRGB(0,255,255)
Title.BackgroundTransparency = 1
Title.TextScaled = true

-- CLOSE BUTTON
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-30,0,0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(255,0,0)

-- OPEN BUTTON
local Open = Instance.new("TextButton", ScreenGui)
Open.Size = UDim2.new(0,110,0,30)
Open.Position = UDim2.new(0,10,0,120)
Open.Text = "Open Hub"
Open.Visible = false

-- AUTO FARM
local FarmBtn = Instance.new("TextButton", Main)
FarmBtn.Size = UDim2.new(0.8,0,0,45)
FarmBtn.Position = UDim2.new(0.1,0,0.3,0)
FarmBtn.Text = "Auto Farm: OFF"

local farming = false

FarmBtn.MouseButton1Click:Connect(function()
    farming = not farming
    FarmBtn.Text = farming and "Auto Farm: ON" or "Auto Farm: OFF"
end)

-- SKILL SPAM
local SkillBtn = Instance.new("TextButton", Main)
SkillBtn.Size = UDim2.new(0.8,0,0,45)
SkillBtn.Position = UDim2.new(0.1,0,0.6,0)
SkillBtn.Text = "Skill Spam: OFF"

local skill = false

SkillBtn.MouseButton1Click:Connect(function()
    skill = not skill
    SkillBtn.Text = skill and "Skill Spam: ON" or "Skill Spam: OFF"
end)

-- OPEN / CLOSE
Close.MouseButton1Click:Connect(function()
    Main.Visible = false
    Open.Visible = true
end)

Open.MouseButton1Click:Connect(function()
    Main.Visible = true
    Open.Visible = false
end)

-- LOOP (SAFE)
task.spawn(function()
    while true do
        pcall(function()
            local char = player.Character

            if skill and char then
                local tool = char:FindFirstChildOfClass("Tool")
                if tool then
                    tool:Activate()
                end
            end

            if farming then
                print("Auto Farm Running")
            end
        end)
        task.wait(1)
    end
end)
