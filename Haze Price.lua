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
    Misc = Window:AddTab({ Title = "Misc", Icon = "" }), 
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

local Toggle_Status1 = Tabs.Misc:AddToggle("toggle_status1", { Title = "COMBAT", Default = false })
local Toggle_Status2 = Tabs.Misc:AddToggle("toggle_status2", { Title = "DEFENSE", Default = false })
local Toggle_Status3 = Tabs.Misc:AddToggle("toggle_status3", { Title = "SWORD", Default = false })
local Toggle_Status4 = Tabs.Misc:AddToggle("toggle_status4", { Title = "FRUIT", Default = false })


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

Toggle_Status1:OnChanged(function()
    toggle_status1 = Options.toggle_status1.Value
end)

Toggle_Status2:OnChanged(function()
    toggle_status2 = Options.toggle_status2.Value
end)

Toggle_Status3:OnChanged(function()
    toggle_status3 = Options.toggle_status3.Value
end)

Toggle_Status4:OnChanged(function()
    toggle_status4 = Options.toggle_status4.Value
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
        SpawnPointCFrame = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 10 or LevelPlayer <= 24 then
        MonName = "[Lv. 10] Bandit"
        QuestNameMon = "Bandit"
        QuestName = "1"
        QuestLevel = "Level 10"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
        SpawnPointCFrame = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 24 or LevelPlayer <= 39 then
        MonName = "[Lv. 25] Bandit Boss"
        QuestNameMon = "Bandit Boss"
        QuestName = "1"
        QuestLevel = "Level 25"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
        SpawnPointCFrame = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 40 or LevelPlayer <= 59 then
        MonName = "[Lv. 40] Pirate Clown"
        QuestNameMon = "Pirate Clown"
        QuestName = "2"
        QuestLevel = "Level 40"
        QuestPointName = "Clown Island"
        SpawnPointName = "Clown Island"
        SpawnPointCFrame = CFrame.new(-2173.27515, 14.5428219, -611.056152, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 60 or LevelPlayer <= 89 then
        MonName = "[Lv. 60] Clown Boss"
        QuestNameMon = "Clown Boss"
        QuestName = "2"
        QuestLevel = "Level 60"
        QuestPointName = "Clown Island"
        SpawnPointName = "Clown Island"
        SpawnPointCFrame = CFrame.new(-2173.27515, 14.5428219, -611.056152, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 90 or LevelPlayer <= 119 then
        MonName = "[Lv. 90] Fishman"
        QuestNameMon = "Fishman"
        QuestName = "3"
        QuestLevel = "Level 90"
        QuestPointName = "Shark Park"
        SpawnPointName = "Shark Park"
        SpawnPointCFrame = CFrame.new(-4903.91309, 17.8224983, -2819.60059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 120 or LevelPlayer <= 159 then
        MonName = "[Lv. 120] Shark Boss"
        QuestNameMon = "Shark Boss"
        QuestName = "3"
        QuestLevel = "Level 120"
        QuestPointName = "Shark Park"
        SpawnPointName = "Shark Park"
        SpawnPointCFrame = CFrame.new(-4903.91309, 17.8224983, -2819.60059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 160 or LevelPlayer <= 199 then
        MonName = "[Lv. 160] Desert Thief"
        QuestNameMon = "Desert Thief"
        QuestName = "4"
        QuestLevel = "Level 160"
        QuestPointName = "Desert Ruins"
        SpawnPointName = "Desert Ruins"
        SpawnPointCFrame = CFrame.new(-5274.35449, 31.5086288, -687.57074, -0.0707290173, 0, -0.997495532, 0, 1, 0, 0.997495532, 0, -0.0707290173)
    elseif Level == 200 or LevelPlayer <= 249 then
        MonName = "[Lv. 200] Bomb Boss"
        QuestNameMon = "Bomb Boss"
        QuestName = "4"
        QuestLevel = "Level 200"
        QuestPointName = "Desert Ruins"
        SpawnPointName = "Desert Ruins"
        SpawnPointCFrame = CFrame.new(-5274.35449, 31.5086288, -687.57074, -0.0707290173, 0, -0.997495532, 0, 1, 0, 0.997495532, 0, -0.0707290173)
    elseif Level == 250 or LevelPlayer <= 299 then
        MonName = "[Lv. 250] Krieg Pirate"
        QuestNameMon = "Krieg Pirate"
        QuestName = "5"
        QuestLevel = "Level 250"
        QuestPointName = "Sea Restaurant"
        SpawnPointName = "Sea Restaurant"
        SpawnPointCFrame = CFrame.new(-5971.75977, 54.3716469, 2411.17163, 0.997494817, -0, -0.0707397014, 0, 1, -0, 0.0707397014, 0, 0.997494817)
    elseif Level == 300 or LevelPlayer <= 349 then
        MonName = "[Lv. 300] Krieg Boss"
        QuestNameMon = "Krieg Boss"
        QuestName = "5"
        QuestLevel = "Level 300"
        QuestPointName = "Sea Restaurant"
        SpawnPointName = "Sea Restaurant"
        SpawnPointCFrame = CFrame.new(-5971.75977, 54.3716469, 2411.17163, 0.997494817, -0, -0.0707397014, 0, 1, -0, 0.0707397014, 0, 0.997494817)
    elseif Level == 350 or LevelPlayer <= 399 then
        MonName = "[Lv. 350] Marine Recruit"
        QuestNameMon = "Marine Recruit"
        QuestName = "6"
        QuestLevel = "Level 350"
        QuestPointName = "Logue Town"
        SpawnPointName = "Logue City"
        SpawnPointCFrame = CFrame.new(-2859.67896, 18.2439308, 1917.31714, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 400 or LevelPlayer <= 449 then
        MonName = "[Lv. 400] Tashii"
        QuestNameMon = "Tashii"
        QuestName = "6"
        QuestLevel = "Level 400"
        QuestPointName = "Logue Town"
        SpawnPointName = "Logue City"
        SpawnPointCFrame = CFrame.new(-2859.67896, 18.2439308, 1917.31714, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 450 or LevelPlayer <= 499 then
        MonName = "[Lv. 450] Monkey"
        QuestNameMon = "Monkey"
        QuestName = "7"
        QuestLevel = "Level 450"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
        SpawnPointCFrame = CFrame.new(50.8025665, 10.2842579, 2298.3938, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
    elseif Level == 500 or LevelPlayer <= 549 then
        MonName = "[Lv. 500] Gorilla"
        QuestNameMon = "Gorilla"
        QuestName = "7"
        QuestLevel = "Level 500"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
        SpawnPointCFrame = CFrame.new(50.8025665, 10.2842579, 2298.3938, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
    elseif Level == 550 or LevelPlayer <= 599 then
        MonName = "[Lv. 550] King Gorilla"
        QuestNameMon = "King Gorilla"
        QuestName = "7"
        QuestLevel = "Level 550"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
        SpawnPointCFrame = CFrame.new(50.8025665, 10.2842579, 2298.3938, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
    elseif Level == 600 or LevelPlayer <= 649 then
        MonName = "[Lv. 600] Marine Grunt"
        QuestNameMon = "Marine Grunt"
        QuestName = "8"
        QuestLevel = "Level 600"
        QuestPointName = "Marine Base Town"
        SpawnPointName = "Marine Base Town"
        SpawnPointCFrame = CFrame.new(558.204773, 101.526405, 5675.91992, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    elseif Level == 650 or LevelPlayer <= 699 then
        MonName = "[Lv. 650] Marine Captain"
        QuestNameMon = "Marine Captain"
        QuestName = "8"
        QuestLevel = "Level 650"
        QuestPointName = "Marine Base Town"
        SpawnPointName = "Marine Base Town"
        SpawnPointCFrame = CFrame.new(558.204773, 101.526405, 5675.91992, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    elseif Level == 700 or LevelPlayer <= 749 then
        MonName = "[Lv. 700] Satyr"
        QuestNameMon = "Satyr"
        QuestName = "9"
        QuestLevel = "Level 700"
        QuestPointName = "Three Islands"
        SpawnPointName = "Three Islands"
        SpawnPointCFrame = CFrame.new(-2404.46973, 785.804443, 5551.69092, -0.258864403, 0, -0.965913713, 0, 1, 0, 0.965913713, 0, -0.258864403)
    elseif Level == 750 or LevelPlayer <= 799 then
        MonName = "[Lv. 750] Minotaur"
        QuestNameMon = "Minotaur"
        QuestName = "9"
        QuestLevel = "Level 750"
        QuestPointName = "Three Islands"
        SpawnPointName = "Three Islands"
        SpawnPointCFrame = CFrame.new(-2404.46973, 785.804443, 5551.69092, -0.258864403, 0, -0.965913713, 0, 1, 0, 0.965913713, 0, -0.258864403)
    elseif Level == 800 or LevelPlayer <= 849 then
        MonName = "[Lv. 800] Elite Marine"
        QuestNameMon = "Elite Marine"
        QuestName = "10"
        QuestLevel = "Level 800"
        QuestPointName = "Marine HQ"
        SpawnPointName = "Marine HQ"
        SpawnPointCFrame = CFrame.new(-6152.62256, 19.4142094, 6881.06055, 0.673309922, 0, 0.739360392, 0, 1, 0, -0.739360392, 0, 0.673309922)
    elseif Level == 850 or LevelPlayer <= 899 then
        MonName = "[Lv. 850] Vice Admiral"
        QuestNameMon = "Vice Admiral"
        QuestName = "10"
        QuestLevel = "Level 850"
        QuestPointName = "Marine HQ"
        SpawnPointName = "Marine HQ"
        SpawnPointCFrame = CFrame.new(-6152.62256, 19.4142094, 6881.06055, 0.673309922, 0, 0.739360392, 0, 1, 0, -0.739360392, 0, 0.673309922)
    elseif Level == 900 or LevelPlayer <= 949 then
        MonName = "[Lv. 900] Ice Admiral"
        QuestNameMon = "Ice Admiral"
        QuestName = "10"
        QuestLevel = "Level 900"
        QuestPointName = "Marine HQ"
        SpawnPointName = "Marine HQ"
        SpawnPointCFrame = CFrame.new(-6152.62256, 19.4142094, 6881.06055, 0.673309922, 0, 0.739360392, 0, 1, 0, -0.739360392, 0, 0.673309922)
    elseif Level == 950 or LevelPlayer <= 999 then
        MonName = "[Lv. 950] Sandorian Warrior"
        QuestNameMon = "Sandorian Warrior"
        QuestName = "11"
        QuestLevel = "Level 950"
        QuestPointName = "Sky Islands"
        SpawnPointName = "Skypiean islands"
        SpawnPointCFrame = CFrame.new(2661.65283, 1103.81616, 95.6491699, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 1000 or LevelPlayer <= 1049 then
        MonName = "[Lv. 1000] Divine Soldier"
        QuestNameMon = "Divine Soldier"
        QuestName = "11"
        QuestLevel = "Level 1000"
        QuestPointName = "Sky Islands"
        SpawnPointName = "Skypiean islands"
        SpawnPointCFrame = CFrame.new(2661.65283, 1103.81616, 95.6491699, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 1050 or LevelPlayer <= 1099 then
        MonName = "[Lv. 1050] Holy Soldier"
        QuestNameMon = "Holy Soldier"
        QuestName = "11"
        QuestLevel = "Level 1050"
        QuestPointName = "Sky Islands"
        SpawnPointName = "Skypiean islands"
        SpawnPointCFrame = CFrame.new(2661.65283, 1103.81616, 95.6491699, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 1050 or LevelPlayer <= 1099 then
        MonName = "[Lv. 1100] Thunder God"
        QuestNameMon = "Thunder God"
        QuestName = "11"
        QuestLevel = "Level 1100"
        QuestPointName = "Sky Islands"
        SpawnPointName = "Skypiean islands"
        SpawnPointCFrame = CFrame.new(2661.65283, 1103.81616, 95.6491699, -1, 0, 0, 0, 1, 0, 0, 0, -1)
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
                        for i, v in pairs(workspace["NPC Zones"][QuestPointName].NPCS:GetChildren()) do
                            if v.Humanoid.DisplayName == MonName and v.Humanoid.Health > 0 then
                                repeat
                                    local targetCFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 9, 3)
                                    local TweenService = game:GetService("TweenService")
                                    local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), { CFrame = targetCFrame }):Play()
                                    wait(1)
                                    Tw:Pause()
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                                    wait(1)
                                    Tw:Play()
                                until v.Humanoid.Health <= 0 or not auto_mon or game:GetService("Players").LocalPlayer.Quest.NPCName.Value ~= QuestNameMon
                            end
                        end
                    else
                        local QuestPos = workspace.Npc_Workspace.QuestGivers[QuestName].Clicker.CFrame
                        local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), { CFrame = QuestPos }):Play()
                        wait(3)
                        local args = {
                            [1] = workspace.Npc_Workspace.QuestGivers:FindFirstChild(QuestName),
                            [2] = QuestLevel
                        }
                        game:GetService("Players").LocalPlayer.PlayerGui.QuestGui.QuestFunction:InvokeServer(unpack(args))
                    end
                else
                    local Tw = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(20, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), { CFrame = SpawnPointCFrame }):Play()
                    wait(20)
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
        if toggle_equip == true then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(Weapon))
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if toggle_buso == true then
            pcall(function()
                if game.Players.LocalPlayer.Character.BusoEnabled.Value == false then
                    game:GetService("Players").LocalPlayer.Character.Buso_Server.Comunication:FireServer()
                    game:GetService("Players").LocalPlayer.PlayerGui.ObservationHaki_Server.Comunication:FireServer()
                end
            end)
        end
    end
end)

spawn(function()
    while wait() do
        if toggle_status1 == true then
            pcall(function()
                local args = {
                    [1] = "Combat",
                    [2] = 1
                }
        
            game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer(unpack(args))    
            end)
        end  
    end
end)

spawn(function()
    while wait() do
        if toggle_status2 == true then
            pcall(function()
                local args = {
                    [1] = "Defense",
                    [2] = 1
                }
        
            game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer(unpack(args))    
            end)
        end  
    end
end)

spawn(function()
    while wait() do
        if toggle_status3 == true then
            pcall(function()
                local args = {
                    [1] = "Sword",
                    [2] = 1
                }
        
            game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer(unpack(args))    
            end)
        end  
    end
end)

spawn(function()
    while wait() do
        if toggle_status4 == true then
            pcall(function()
                local args = {
                    [1] = "Fruit",
                    [2] = 1
                }
        
            game:GetService("ReplicatedStorage").Replication.ClientEvents.Stats_Event:FireServer(unpack(args))    
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
