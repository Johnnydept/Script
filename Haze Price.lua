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
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when there's no MinimizeKeybind
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

local TweenService = game:GetService("TweenService")
local Weaponlist = {}
local Weapon = nil

for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
    table.insert(Weaponlist,v.Name)
end

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Values = Weaponlist,
    Multi = false,
    Default = 1,
})

Tabs.Main:AddButton({
    Title = "Refresh",
    Description = "Refresh Item",
    Callback = function()
        Window:Dialog({
            Title = "Refresh Item",
            Content = "This is a dialog",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                            table.insert(Weaponlist,v.Name)
                        end
                    end
                },
                {
                    Title = "Cancel",
                    Callback = function()
                        print("Cancelled the dialog.")
                    end
                }
            }
        })
    end
})

local Toggle_Mon = Tabs.Main:AddToggle("auto_mon", { Title = "AutoFarm", Default = false })
local Toggle_Equip = Tabs.Main:AddToggle("toggle_equip", { Title = "equip", Default = false })


Dropdown:OnChanged(function(Value)
    Weapon = Value
end)

Toggle_Mon:OnChanged(function()
    auto_mon = Options.auto_mon.Value
end)

Toggle_Equip:OnChanged(function()
    toggle_equip = Options.toggle_equip.Value
end)

function LevelCheck()
    local LevelPlayer = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
    if LevelPlayer == 1 or LevelPlayer <= 9 then
        MonName = "[Lv. 1] Thief"
        QuestNameMon = "Thief"
        QuestPos = CFrame.new(-2146.86938, 44.5099335, -3200.47681, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        QuestName = "1"
        QuestLevel = "Level 1"
        SpawnPointName = "Starter Island"
        SpawnPointPos = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 10 or LevelPlayer <= 24 then
        MonName = "[Lv. 10] Bandit"
        QuestNameMon = "Bandit"
        QuestPos = CFrame.new(-2146.86938, 44.5099335, -3200.47681, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        QuestName = "1"
        QuestLevel = "Level 10"
        SpawnPointName = "Starter Island"
        SpawnPointPos = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 24 or LevelPlayer <= 39 then
        MonName = "[Lv. 25] Bandit Boss"
        QuestNameMon = "Bandit Boss"
        QuestPos = CFrame.new(-2146.86938, 44.5099335, -3200.47681, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        QuestName = "1"
        QuestLevel = "Level 25"
        SpawnPointName = "Starter Island"
        SpawnPointPos = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 40 or LevelPlayer <= 59 then
        MonName = "[Lv. 40] Pirate Clown"
        QuestNameMon = "Pirate Clown"
        QuestPos = CFrame.new(-2275.4585, 13.9280519, -187.222168, 0.966057539, 0, 0.258327097, 0, 1, 0, -0.258327097, 0, 0.966057539)
        QuestName = "2"
        QuestLevel = "Level 40"
        SpawnPointName = "Clown Island"
        SpawnPointPos = CFrame.new(-2173.27515, 14.5428219, -611.056152, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 60 or LevelPlayer <= 89 then
        MonName = "[Lv. 60] Clown Boss"
        QuestNameMon = "Clown Boss"
        QuestPos = CFrame.new(-2275.4585, 13.9280519, -187.222168, 0.966057539, 0, 0.258327097, 0, 1, 0, -0.258327097, 0, 0.966057539)
        QuestName = "2"
        QuestLevel = "Level 60"
        SpawnPointName = "Clown Island"
        SpawnPointPos = CFrame.new(-2173.27515, 14.5428219, -611.056152, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    else
        print("Not Found Level")
    end
end

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
        if auto_mon == true then
            pcall(function()
                LevelCheck()
                if game:GetService("Players").LocalPlayer.PlayerData.SpawnPoint.Value == SpawnPointName then
                    if game:GetService("Players").LocalPlayer.Quest.NPCName.Value == QuestNameMon then
                        for i,v in pairs(workspace["NPC Zones"][SpawnPointName].NPCS:GetChildren()) do
                            if v.Humanoid.DisplayName == MonName then
                                if v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        local targetCFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 9, 3)
                                        local TweenService = game:GetService("TweenService")
                                        local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
                                        {CFrame = targetCFrame}):Play()
                                    until v.Humanoid.Health <= 0 or auto_mon == false
                                end
                            end
                        end
                
                    else
                        local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
                        {CFrame = QuestPos}):Play()

                        wait(3)
                        
                        local args = {
                            [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild(QuestName),
                            [2] = QuestLevel
                        }
                        
                        game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                    end
                else
                    local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
                    {CFrame = SpawnPointPos}):Play()

                    wait(3)

                    local args = {
                        [1] = SpawnPointName
                    }
                    
                    game:GetService("ReplicatedStorage").Replication.ClientEvents.SetSpawnPoint:FireServer(unpack(args))
                end
            end)
        end
    end
end)

spawn(function()
    while wait(1) do
        if toggle_equip then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))
            end)
        end
    end
end)

-- Options.auto_mon:SetValue(false)
-- Options.toggle_equip:SetValue(false)

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
