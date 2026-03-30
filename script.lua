local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui", PlayerGui)

-- MAIN MENU
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 300, 0, 200)
Main.Position = UDim2.new(0.4, 0, 0.4, 0)
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- TITLE
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,30)
Title.Text = "ZMatrix Hub"
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(0,255,255)
Title.TextScaled = true

-- CLOSE BUTTON ❌
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0,30,0,30)
Close.Position = UDim2.new(1,-30,0,0)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(255,0,0)

-- OPEN BUTTON (nút nhỏ)
local Open = Instance.new("TextButton", ScreenGui)
Open.Size = UDim2.new(0,100,0,30)
Open.Position = UDim2.new(0,10,0,100)
Open.Text = "Open Hub"
Open.Visible = false

-- AUTO FARM BUTTON
local FarmBtn = Instance.new("TextButton", Main)
FarmBtn.Size = UDim2.new(0.8,0,0,40)
FarmBtn.Position = UDim2.new(0.1,0,0.3,0)
FarmBtn.Text = "Auto Farm: OFF"

local farming = false

FarmBtn.MouseButton1Click:Connect(function()
    farming = not farming
    FarmBtn.Text = farming and "Auto Farm: ON" or "Auto Farm: OFF"
end)

-- SKILL SPAM BUTTON
local SkillBtn = Instance.new("TextButton", Main)
SkillBtn.Size = UDim2.new(0.8,0,0,40)
SkillBtn.Position = UDim2.new(0.1,0,0.6,0)
SkillBtn.Text = "Skill Spam: OFF"

local skill = false

SkillBtn.MouseButton1Click:Connect(function()
    skill = not skill
    SkillBtn.Text = skill and "Skill Spam: ON" or "Skill Spam: OFF"
end)

-- CLOSE FUNCTION
Close.MouseButton1Click:Connect(function()
    Main.Visible = false
    Open.Visible = true
end)

-- OPEN FUNCTION
Open.MouseButton1Click:Connect(function()
    Main.Visible = true
    Open.Visible = false
end)

-- LOOP TEST
task.spawn(function()
    while true do
        if farming then
            print("Auto Farm Running")
        end
        if skill then
            print("Skill Spam Running")
        end
        task.wait(1)
    end
end)
