local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fluent " .. Fluent.Version,
    SubTitle = "by Jackey DUCKKK",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "Notification",
    Content = "COMMAND LINE",
    SubContent = "Fluent Is Open !!", -- Optional
    Duration = 5 -- Set to nil to make the notification not disappear
})

local Toggle_Mon = Tabs.Main:AddToggle("auto_mon", { Title = "AutoFarm", Default = false })
local Toggle_Potion = Tabs.Main:AddToggle("auto_use_potion", { Title = "AUTO USE POTIONS", Default = false })
local Toggle_Retry = Tabs.Main:AddToggle("auto_retry", { Title = "AUTO Retry", Default = false })
local Toggle_KillAura = Tabs.Main:AddToggle("kill_aura", { Title = "KillAura", Default = false})


Toggle_Mon:OnChanged(function()
    auto_mon = Options.auto_mon.Value
end)

Toggle_Potion:OnChanged(function()
    auto_use_potion = Options.auto_use_potion.Value
end)

Toggle_Retry:OnChanged(function()
    auto_retry = Options.auto_retry.Value
end)

Toggle_KillAura:OnChanged(function()
    kill_aura = Options.kill_aura.Value
end)
    
spawn(function()
    repeat
        wait() -- รอ 1 วินาที
        if auto_mon == true then
            pcall(function()
                local closestModel = nil
                local closestDistance = math.huge
                local player = game.Players.LocalPlayer
                
                for i, v in pairs(workspace.Mobs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        local mobRootPart = v.HumanoidRootPart
                        local playerRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        
                        if mobRootPart and playerRootPart then
                            local distance = (mobRootPart.Position - playerRootPart.Position).Magnitude
                            
                            if distance < closestDistance then
                                closestModel = v
                                closestDistance = distance
                            end
                        end
                    end
                end

                if closestModel then
                    local TweenService = game:GetService("TweenService")
                    local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
                    local targetCFrame = CFrame.new(closestModel.HumanoidRootPart.CFrame.p)
                    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                    
                    local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = targetCFrame})
                    tween:Play()
                end
            end)
        end
    until false -- ทำซ้ำตลอดไป (เนื่องจากเราใช้ "repeat...until false")
end)



spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        pcall(function()
            if auto_mon == true then
                game:GetService'VirtualUser':CaptureController()
                game:GetService'VirtualUser':Button1Down(Vector2.new(1280, 672))             
            end
        end)
    end) 
 end)

spawn(function()
    while wait() do
        if auto_use_potion == true then
            game:GetService("ReplicatedStorage").Knit.Services.HealingService.RF.UseHeal:InvokeServer()
        end
    end
end)

spawn(function()
 while wait(1) do
        if auto_retry == true then
            local args = {
                [1] = "Retry"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PartyService"):WaitForChild("RF"):WaitForChild("VoteOn"):InvokeServer(unpack(args))
            local args = {
                [1] = game:GetService("Players").LocalPlayer
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PartyService"):WaitForChild("RF"):WaitForChild("GetPartyFromPlayer"):InvokeServer(unpack(args))
            local args = {
                [1] = "820bf214-9ced-4ca9-a29c-f250ac2330b7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("PartyService"):WaitForChild("RF"):WaitForChild("ConvertUUIDToJSON"):InvokeServer(unpack(args))
            game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("DungeonService"):WaitForChild("RF"):WaitForChild("StartDungeon"):InvokeServer()            
        end
    end
end)

spawn(function()
    while wait() do
        pcall(function()
            if kill_aura == true then
                for i, v in pairs(workspace.Mobs:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        v.Humanoid.Health = die
                    end
                end
            end
        end)
    end
end)


Options.auto_mon:SetValue(false)
Options.auto_use_potion:SetValue(false)
Options.auto_retry:SetValue(false)
Options.kill_aura:SetValue(false)

-- ความห่างแยกต่าง ๆ ไปยังการตั้งค่าอื่น ๆ ที่เหลือ

-- นำไลบรารีไปยัง SaveManager และ InterfaceManager
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
