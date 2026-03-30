-- ZMatrix Hub v1.0 (FIX VERSION)

local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

-- Main
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 400, 0, 230)
Main.Position = UDim2.new(0.35, 0, 0.35, 0)
Main.BackgroundColor3 = Color3.fromRGB(30,30,30)

-- Sidebar
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 120, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(20,20,20)

-- Title
local Title = Instance.new("TextLabel", Side)
Title.Size = UDim2.new(1,0,0,40)
Title.Text = "ZMatrix Hub"
Title.TextColor3 = Color3.fromRGB(0,255,255)
Title.BackgroundTransparency = 1
Title.TextScaled = true

-- Tabs
local MainTab = Instance.new("TextButton", Side)
MainTab.Size = UDim2.new(1,0,0,35)
MainTab.Position = UDim2.new(0,0,0.2,0)
MainTab.Text = "Main"

-- Content
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -120, 1, 0)
Content.Position = UDim2.new(0, 120, 0, 0)
Content.BackgroundTransparency = 1

-- Auto Farm Button
local FarmBtn = Instance.new("TextButton", Content)
FarmBtn.Size = UDim2.new(0.8,0,0,40)
FarmBtn.Position = UDim2.new(0.1,0,0.3,0)
FarmBtn.Text = "Auto Farm: OFF"

local farming = false

FarmBtn.MouseButton1Click:Connect(function()
    farming = not farming
    FarmBtn.Text = farming and "Auto Farm: ON" or "Auto Farm: OFF"
end)

-- Skill Spam Button
local SkillBtn = Instance.new("TextButton", Content)
SkillBtn.Size = UDim2.new(0.8,0,0,40)
SkillBtn.Position = UDim2.new(0.1,0,0.5,0)
SkillBtn.Text = "Skill Spam: OFF"

local skill = false

SkillBtn.MouseButton1Click:Connect(function()
    skill = not skill
    SkillBtn.Text = skill and "Skill Spam: ON" or "Skill Spam: OFF"
end)

-- Footer
local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1,0,0,25)
Footer.Position = UDim2.new(0,0,1,-25)
Footer.Text = "ZMatrix Hub v1.0"
Footer.TextColor3 = Color3.fromRGB(0,255,255)
Footer.BackgroundTransparency = 1
Footer.TextScaled = true

-- Demo loop (để test nút có chạy)
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
