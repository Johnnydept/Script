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
local Toggle_Equip = Tabs.Main:AddToggle("toggle_equip", { Title = "Auto Equip", Default = false })
local toggle_Buso = Tabs.Main:AddToggle("toggle_buso", { Title = "Auto Buso", Default = false })


Dropdown:OnChanged(function(Value)
    Weapon = Value
end)

Toggle_Mon:OnChanged(function()
    auto_mon = Options.auto_mon.Value
end)

Toggle_Equip:OnChanged(function()
    toggle_equip = Options.toggle_equip.Value
end)

toggle_Buso:OnChanged(function()
    toggle_buso = Options.toggle_buso.Value
end)

function LevelCheck()
    local LevelPlayer = game:GetService("Players").LocalPlayer.PlayerData.Experience.Level.Value
    if LevelPlayer == 1 or LevelPlayer <= 9 then
        MonName = "[Lv. 1] Thief"
        QuestNameMon = "Thief"
        QuestName = "1"
        QuestLevel = "Level 1"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
    elseif Level == 10 or LevelPlayer <= 24 then
        MonName = "[Lv. 10] Bandit"
        QuestNameMon = "Bandit"
        QuestName = "1"
        QuestLevel = "Level 10"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
    elseif Level == 24 or LevelPlayer <= 39 then
        MonName = "[Lv. 25] Bandit Boss"
        QuestNameMon = "Bandit Boss"
        QuestName = "1"
        QuestLevel = "Level 25"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
    elseif Level == 40 or LevelPlayer <= 59 then
        MonName = "[Lv. 40] Pirate Clown"
        QuestNameMon = "Pirate Clown"
        QuestName = "2"
        QuestLevel = "Level 40"
        QuestPointName = "Clown Island"
        SpawnPointName = "Clown Island"
    elseif Level == 60 or LevelPlayer <= 89 then
        MonName = "[Lv. 60] Clown Boss"
        QuestNameMon = "Clown Boss"
        QuestName = "2"
        QuestLevel = "Level 60"
        QuestPointName = "Clown Island"
        SpawnPointName = "Clown Island"
    elseif Level == 90 or LevelPlayer <= 119 then
        MonName = "[Lv. 90] Fishman"
        QuestNameMon = "Fishman"
        QuestName = "3"
        QuestLevel = "Level 90"
        QuestPointName = "Shark Park"
        SpawnPointName = "Shark Park"
    elseif Level == 120 or LevelPlayer <= 159 then
        MonName = "[Lv. 120] Shark Boss"
        QuestNameMon = "Shark Boss"
        QuestName = "3"
        QuestLevel = "Level 120"
        QuestPointName = "Shark Park"
        SpawnPointName = "Shark Park"
    elseif Level == 160 or LevelPlayer <= 199 then
        MonName = "[Lv. 160] Desert Thief"
        QuestNameMon = "Desert Thief"
        QuestName = "4"
        QuestLevel = "Level 160"
        QuestPointName = "Desert Ruins"
        SpawnPointName = "Desert Ruins"
    elseif Level == 200 or LevelPlayer <= 249 then
        MonName = "[Lv. 200] Bomb Boss"
        QuestNameMon = "Bomb Boss"
        QuestName = "4"
        QuestLevel = "Level 200"
        QuestPointName = "Desert Ruins"
        SpawnPointName = "Desert Ruins"
    elseif Level == 250 or LevelPlayer <= 299 then
        MonName = "[Lv. 250] Krieg Pirate"
        QuestNameMon = "Krieg Pirate"
        QuestName = "5"
        QuestLevel = "Level 250"
        QuestPointName = "Sea Restaurant"
        SpawnPointName = "Sea Restaurant"
    elseif Level == 300 or LevelPlayer <= 349 then
        MonName = "[Lv. 300] Krieg Boss"
        QuestNameMon = "Krieg Boss"
        QuestName = "5"
        QuestLevel = "Level 300"
        QuestPointName = "Sea Restaurant"
        SpawnPointName = "Sea Restaurant"
    elseif Level == 350 or LevelPlayer <= 399 then
        MonName = "[Lv. 350] Marine Recruit"
        QuestNameMon = "Marine Recruit"
        QuestName = "6"
        QuestLevel = "Level 350"
        QuestPointName = "Logue Town"
        SpawnPointName = "Logue City"
    elseif Level == 400 or LevelPlayer <= 449 then
        MonName = "[Lv. 400] Tashii"
        QuestNameMon = "Tashii"
        QuestName = "6"
        QuestLevel = "Level 400"
        QuestPointName = "Logue Town"
        SpawnPointName = "Logue City"
    elseif Level == 450 or LevelPlayer <= 499 then
        MonName = "[Lv. 450] Monkey"
        QuestNameMon = "Monkey"
        QuestName = "7"
        QuestLevel = "Level 450"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
    elseif Level == 500 or LevelPlayer <= 549 then
        MonName = "[Lv. 500] Gorilla"
        QuestNameMon = "Gorilla"
        QuestName = "7"
        QuestLevel = "Level 500"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
    elseif Level == 550 or LevelPlayer <= 599 then
        MonName = "[Lv. 550] King Gorilla"
        QuestNameMon = "King Gorilla"
        QuestName = "7"
        QuestLevel = "Level 550"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
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
                        for i,v in pairs(workspace["NPC Zones"][QuestPointName].NPCS:GetChildren()) do
                            if v.Humanoid.DisplayName == MonName then
                                if v.Humanoid.Health > 0 then
                                    repeat
                                        task.wait()
                                        local targetCFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 9, 3)
                                        local TweenService = game:GetService("TweenService")
                                        local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
                                        {CFrame = targetCFrame}):Play()
                                    until v.Humanoid.Health <= 0 or auto_mon == false or game:GetService("Players").LocalPlayer.Quest.NPCName.Value ~= QuestNameMon
                                end
                            end
                        end
                
                    else
                        local QuestPos = workspace.Npc_Workspace.QuestGivers[QuestName].Clicker.CFrame
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
                    local SpawnPointPosCFrame = workspace.Npc_Workspace["Spawn Setters"][SpawnPointName].Clicker.CFrame
                    local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), 
                    {CFrame = SpawnPointPosCFrame}):Play()

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

spawn(function()
    while wait() do
        if toggle_buso then
            pcall(function()
                if game.Players.LocalPlayer.Character.BusoEnabled.Value == false then
                    game:GetService("Players").LocalPlayer.Character.Buso_Server.Comunication:FireServer()
                end
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
