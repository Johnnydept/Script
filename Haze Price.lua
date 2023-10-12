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
        QuestPos = CFrame.new(-2146.86938, 44.5099335, -3200.47681, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        QuestName = "1"
        QuestLevel = "Level 1"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
        SpawnPointPos = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 10 or LevelPlayer <= 24 then
        MonName = "[Lv. 10] Bandit"
        QuestNameMon = "Bandit"
        QuestPos = CFrame.new(-2146.86938, 44.5099335, -3200.47681, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        QuestName = "1"
        QuestLevel = "Level 10"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
        SpawnPointPos = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 24 or LevelPlayer <= 39 then
        MonName = "[Lv. 25] Bandit Boss"
        QuestNameMon = "Bandit Boss"
        QuestPos = CFrame.new(-2146.86938, 44.5099335, -3200.47681, -1, 0, 0, 0, 1, 0, 0, 0, -1)
        QuestName = "1"
        QuestLevel = "Level 25"
        QuestPointName = "Starter Island"
        SpawnPointName = "Starter Island"
        SpawnPointPos = CFrame.new(-2185.06641, 44.5853271, -3240.38477, -0.999996662, 0, -0.00258965837, 0, 1, 0, 0.00258965837, 0, -0.999996662)
    elseif Level == 40 or LevelPlayer <= 59 then
        MonName = "[Lv. 40] Pirate Clown"
        QuestNameMon = "Pirate Clown"
        QuestPos = CFrame.new(-2275.4585, 13.9280519, -187.222168, 0.966057539, 0, 0.258327097, 0, 1, 0, -0.258327097, 0, 0.966057539)
        QuestName = "2"
        QuestLevel = "Level 40"
        QuestPointName = "Clown Island"
        SpawnPointName = "Clown Island"
        SpawnPointPos = CFrame.new(-2173.27515, 14.5428219, -611.056152, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 60 or LevelPlayer <= 89 then
        MonName = "[Lv. 60] Clown Boss"
        QuestNameMon = "Clown Boss"
        QuestPos = CFrame.new(-2275.4585, 13.9280519, -187.222168, 0.966057539, 0, 0.258327097, 0, 1, 0, -0.258327097, 0, 0.966057539)
        QuestName = "2"
        QuestLevel = "Level 60"
        QuestPointName = "Clown Island"
        SpawnPointName = "Clown Island"
        SpawnPointPos = CFrame.new(-2173.27515, 14.5428219, -611.056152, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 90 or LevelPlayer <= 119 then
        MonName = "[Lv. 90] Fishman"
        QuestNameMon = "Fishman"
        QuestPos = CFrame.new(-4815.56689, 11.6574678, -3186.67114, -0.999801636, 0.00963294785, 0.0174553432, 0.00970218796, 0.999945402, 0.0038863169, -0.017416954, 0.00405489933, -0.999840498)
        QuestName = "3"
        QuestLevel = "Level 90"
        QuestPointName = "Shark Park"
        SpawnPointName = "Shark Park"
        SpawnPointPos = CFrame.new(-4903.91309, 17.8224983, -2819.60059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 120 or LevelPlayer <= 159 then
        MonName = "[Lv. 120] Shark Boss"
        QuestNameMon = "Shark Boss"
        QuestPos = CFrame.new(-4815.56689, 11.6574678, -3186.67114, -0.999801636, 0.00963294785, 0.0174553432, 0.00970218796, 0.999945402, 0.0038863169, -0.017416954, 0.00405489933, -0.999840498)
        QuestName = "3"
        QuestLevel = "Level 120"
        QuestPointName = "Shark Park"
        SpawnPointName = "Shark Park"
        SpawnPointPos = CFrame.new(-4903.91309, 17.8224983, -2819.60059, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    elseif Level == 160 or LevelPlayer <= 199 then
        MonName = "[Lv. 160] Desert Thief"
        QuestNameMon = "Desert Thief"
        QuestPos = CFrame.new(-4943.4209, 13.7254143, -331.679199, -0.102530003, 0.00493566645, -0.994717658, 0.00967719778, 0.999945343, 0.00396413356, 0.994682848, -0.00921963807, -0.102572083)
        QuestName = "4"
        QuestLevel = "Level 160"
        QuestPointName = "Desert Ruins"
        SpawnPointName = "Desert Ruins"
        SpawnPointPos = CFrame.new(-5274.35449, 31.5086288, -687.57074, -0.0707290173, 0, -0.997495532, 0, 1, 0, 0.997495532, 0, -0.0707290173)
    elseif Level == 200 or LevelPlayer <= 249 then
        MonName = "[Lv. 200] Bomb Boss"
        QuestNameMon = "Bomb Boss"
        QuestPos = CFrame.new(-4943.4209, 13.7254143, -331.679199, -0.102530003, 0.00493566645, -0.994717658, 0.00967719778, 0.999945343, 0.00396413356, 0.994682848, -0.00921963807, -0.102572083)
        QuestName = "4"
        QuestLevel = "Level 200"
        QuestPointName = "Desert Ruins"
        SpawnPointName = "Desert Ruins"
        SpawnPointPos = CFrame.new(-5274.35449, 31.5086288, -687.57074, -0.0707290173, 0, -0.997495532, 0, 1, 0, 0.997495532, 0, -0.0707290173)
    elseif Level == 250 or LevelPlayer <= 299 then
        MonName = "[Lv. 250] Krieg Pirate"
        QuestNameMon = "Krieg Pirate"
        QuestPos = CFrame.new(-6002.31201, 54.2701111, 2418.86646, 0.102529943, -0.00493566645, 0.994717658, 0.00967719778, 0.999945343, 0.00396413356, -0.994682848, 0.00921963807, 0.102572083)
        QuestName = "5"
        QuestLevel = "Level 250"
        QuestPointName = "Sea Restaurant"
        SpawnPointName = "Sea Restaurant"
        SpawnPointPos = CFrame.new(-5971.75977, 54.3716469, 2411.17163, 0.997494817, -0, -0.0707397014, 0, 1, -0, 0.0707397014, 0, 0.997494817)
    elseif Level == 300 or LevelPlayer <= 349 then
        MonName = "[Lv. 300] Krieg Boss"
        QuestNameMon = "Krieg Boss"
        QuestPos = CFrame.new(-6002.31201, 54.2701111, 2418.86646, 0.102529943, -0.00493566645, 0.994717658, 0.00967719778, 0.999945343, 0.00396413356, -0.994682848, 0.00921963807, 0.102572083)
        QuestName = "5"
        QuestLevel = "Level 300"
        QuestPointName = "Sea Restaurant"
        SpawnPointName = "Sea Restaurant"
        SpawnPointPos = CFrame.new(-5971.75977, 54.3716469, 2411.17163, 0.997494817, -0, -0.0707397014, 0, 1, -0, 0.0707397014, 0, 0.997494817)
    elseif Level == 350 or LevelPlayer <= 399 then
        MonName = "[Lv. 350] Marine Recruit"
        QuestNameMon = "Marine Recruit"
        QuestPos = CFrame.new(-2985.64966, 21.4120998, 2175.29346, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        QuestName = "6"
        QuestLevel = "Level 350"
        QuestPointName = "Logue Town"
        SpawnPointName = "Logue City"
        SpawnPointPos = CFrame.new(-2859.67896, 18.2439308, 1917.31714, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 400 or LevelPlayer <= 449 then
        MonName = "[Lv. 400] Tashii"
        QuestNameMon = "Tashii"
        QuestPos = CFrame.new(-2985.64966, 21.4120998, 2175.29346, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        QuestName = "6"
        QuestLevel = "Level 400"
        QuestPointName = "Logue Town"
        SpawnPointName = "Logue City"
        SpawnPointPos = CFrame.new(-2859.67896, 18.2439308, 1917.31714, -1, 0, 0, 0, 1, 0, 0, 0, -1)
    elseif Level == 450 or LevelPlayer <= 499 then
        MonName = "[Lv. 450] Monkey"
        QuestNameMon = "Monkey"
        QuestPos = CFrame.new(-58.6932831, 10.6760607, 2301.79102, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
        QuestName = "7"
        QuestLevel = "Level 450"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
        SpawnPointPos = CFrame.new(50.8025665, 10.2842579, 2298.3938, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
    elseif Level == 500 or LevelPlayer <= 549 then
        MonName = "[Lv. 500] Gorilla"
        QuestNameMon = "Gorilla"
        QuestPos = CFrame.new(-58.6932831, 10.6760607, 2301.79102, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
        QuestName = "7"
        QuestLevel = "Level 500"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
        SpawnPointPos = CFrame.new(50.8025665, 10.2842579, 2298.3938, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
    elseif Level == 550 or LevelPlayer <= 599 then
        MonName = "[Lv. 550] King Gorilla"
        QuestNameMon = "King Gorilla"
        QuestPos = CFrame.new(-58.6932831, 10.6760607, 2301.79102, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
        QuestName = "7"
        QuestLevel = "Level 550"
        QuestPointName = "Tall Woods"
        SpawnPointName = "Tall Woods"
        SpawnPointPos = CFrame.new(50.8025665, 10.2842579, 2298.3938, -1.1920929e-07, 0, 1.00000012, 0, 1, 0, -1.00000012, 0, -1.1920929e-07)
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
