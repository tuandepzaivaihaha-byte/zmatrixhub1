repeat task.wait() until game:IsLoaded()
repeat task.wait() until game.Players.LocalPlayer

local player = game.Players.LocalPlayer

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

            if farming and char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = hrp.CFrame * CFrame.new(0,0,-3)
                end
            end
        end)
        task.wait(0.1)
    end
end)
