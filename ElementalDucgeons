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

local Toggle_Box = Tabs.Main:AddToggle("auto_collect_box", { Title = "Auto Collect GEM!", Default = false })
local Toggle_Mon = Tabs.Main:AddToggle("auto_mon", { Title = "Test", Default = false })
local Toggle_Attack = Tabs.Main:AddToggle("auto_attack", { Title = "AUTO ATTACK", Default = false })
local Toggle_Potion = Tabs.Main:AddToggle("auto_use_potion", { Title = "AUTO USE POTIONS", Default = false })
local Toggle_Retry = Tabs.Main:AddToggle("auto_retry", { Title = "AUTO Retry", Default = false })
local Toggle_Collect = Tabs.Main:AddToggle("auto_collect", { Title = "AUTO COLLECT ITEM", Default = false})

Toggle_Box:OnChanged(function()
    auto_collect_box = Options.auto_collect_box.Value
end)

Toggle_Mon:OnChanged(function()
    auto_mon = Options.auto_mon.Value
end)

Toggle_Attack:OnChanged(function()
    auto_attack = Options.auto_attack.Value
end)

Toggle_Potion:OnChanged(function()
    auto_use_potion = Options.auto_use_potion.Value
end)

Toggle_Retry:OnChanged(function()
    auto_retry = Options.auto_retry.Value
end)

Toggle_Collect:OnChanged(function()
    auto_collect = Options.auto_collect.Value
end)

spawn(function()
    while wait() do
        if auto_collect_box == true then
            for i, v in pairs(workspace.Chests:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                local args = {
                    [1] = workspace:WaitForChild("Chests"):WaitForChild("Chest5")
                }
                
                game:GetService("ReplicatedStorage").Knit.Services.MiscContentService.RF.ClaimChest:InvokeServer(unpack(args))
                
            end
        end
    end
end)

spawn(function()
    while wait() do
        if auto_attack == true then
            pcall(function()
                local args = {
                    [1] = {
                        ["Direction"] = Vector3.new(0, 0, 0),
                        ["Origin"] = Vector3.new(0, 0, 0),
                        ["Position"] = Vector3.new(0, 0, 0)
                    }
                }
    
                game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("WeaponService"):WaitForChild("RF"):WaitForChild("UseSword"):InvokeServer(unpack(args))
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if auto_mon == true then
            pcall(function()
                local closestModel = nil
                local closestDistance = math.huge  -- ตั้งค่าระยะห่างเริ่มต้นเป็นค่าสูงสุด
                
                for i1, v1 in pairs(workspace.Mobs:GetChildren()) do
                    if v1.ClassName == "Model" then
                        if v1.Humanoid.Health > 0 then
                            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v1.HumanoidRootPart.Position).Magnitude
                            if distance < closestDistance then
                                closestDistance = distance
                                closestModel = v1
                            end
                        end
                    end
                end

                if closestModel then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(closestModel.HumanoidRootPart.Position)
                end
            end)
        end
    end
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

-- spawn(function()
--     while wait() do
--         if auto_collect == true then
            
--         end
--     end
-- end)

Options.auto_collect_box:SetValue(false)
Options.auto_mon:SetValue(false)
Options.auto_attack:SetValue(false)
Options.auto_use_potion:SetValue(false)
Options.auto_retry:SetValue(false)
Options.auto_collect:SetValue(false)

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
