local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kid Hub", HidePremium = false, IntroText = "Kid Hub", SaveConfig = true, ConfigFolder = "Lazzy Hub"})

OrionLib:MakeNotification({
    Name = "Message",
    Content = "Thanks For Using My Script!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- Home Tab
local MainTab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "Clicker",
    Callback = function()
        print("Kid Hub")
    end    
})

-- Farming Tab
local FarmTab = Window:MakeTab({
    Name = "Farming",
})

FarmTab:AddSection("Farming")
FarmTab:AddToggle({
    Name = "Auto Farm Level",
    Default = false,
    Callback = function(Value)
        local _wait = task.wait
        repeat _wait() until game:IsLoaded()
        local _env = getgenv and getgenv() or {}
        
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local VirtualUser = game:GetService("VirtualUser")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        
        local Player = Players.LocalPlayer
        
        local rs_Monsters = ReplicatedStorage:WaitForChild("MonsterSpawn")
        local Modules = ReplicatedStorage:WaitForChild("ModuleScript")
        local OtherEvent = ReplicatedStorage:WaitForChild("OtherEvent")
        local Monsters = workspace:WaitForChild("Monster")
        
        local MQuestSettings = require(Modules:WaitForChild("Quest_Settings"))
        local MSetting = require(Modules:WaitForChild("Setting"))
        
        local NPCs = workspace:WaitForChild("NPCs")
        local Raids = workspace:WaitForChild("Raids")
        local Location = workspace:WaitForChild("Location")
        local Region = workspace:WaitForChild("Region")
        local Island = workspace:WaitForChild("Island")
        
        local Quests_Npc = NPCs:WaitForChild("Quests_Npc")
        local EnemyLocation = Location:WaitForChild("Enemy_Location")
        local QuestLocation = Location:WaitForChild("QuestLocaion")
        
        local Items = Player:WaitForChild("Items")
        local QuestFolder = Player:WaitForChild("QuestFolder")
        local Ability = Player:WaitForChild("Ability")
        local PlayerData = Player:WaitForChild("PlayerData")
        local PlayerLevel = PlayerData:WaitForChild("Level")
        
        local sethiddenproperty = sethiddenproperty or (function()end)
        
        local CFrame_Angles = CFrame.Angles
        local CFrame_new = CFrame.new
        local Vector3_new = Vector3.new
        
        local _huge = math.huge
        
        task.spawn(function()
          if not _env.LoadedHideUsername then
            _env.LoadedHideUsername = true
            local Label = Player.PlayerGui.MainGui.PlayerName
            
            local function Update()
              local Level = PlayerLevel.Value
              local IsMax = Level >= MSetting.Setting.MaxLevel
              Label.Text = ("%s • Lv. %i%s"):format("Anonymous", Level, IsMax and " (Max)" or "")
            end
            
            Label:GetPropertyChangedSignal("Text"):Connect(Update)Update()
          end
        end)
    end
})
FarmTab:AddToggle({
    Name = "Auto Farm Nearest",
    Default = false,
    Callback = function(Value)
        -- Add your Auto Farm Nearest logic here
    end
})
FarmTab:AddSection("Enemies")
FarmTab:AddDropdown({
    Name = "Select Enemy",
    Options = Loaded.EnemeiesList,
    Default = Loaded.EnemeiesList[1],
    Callback = function(Value)
        _env.SelectedEnemy = Value
    end
})
FarmTab:AddToggle({
    Name = "Auto Farm Selected",
    Default = false,
    Callback = function(Value)
        -- Add your Auto Farm Selected logic here
    end
})
FarmTab:AddToggle({
    Name = "Take Quest [Enemy Selected]",
    Default = true,
    Callback = function(Value)
        -- Add your Take Quest logic here
    end
})
FarmTab:AddSection("Boss Farm")
FarmTab:AddToggle({
    Name = "Auto Meme Beast [Spawns every 30 Minutes]",
    Default = false,
    Callback = function(Value)
        -- Add your Auto Meme Beast logic here
    end
})
FarmTab:AddSection("Raid")
FarmTab:AddToggle({
    Name = "Auto Farm Raid [Req: Level 1000]",
    Default = false,
    Callback = function(Value)
        -- Add your Auto Farm Raid logic here
    end
})

-- Raid Tab
local RaidTab = Window:MakeTab({
    Name = "Raid",
})

RaidTab:AddToggle({
    Name = "FullyRaid",
    Default = false,
    Callback = function(Value)
        -- Add your FullyRaid logic here
    end    
})

-- Shop Tab
local ShopTab = Window:MakeTab({
    Name = "Shop",
})

ShopTab:AddSection("Auto Buy")
ShopTab:AddToggle({
    Name = "Auto Buy Abilities",
    Default = false,
    Callback = function(Value)
        _env.AutoBuyAbility = Value
        while _env.AutoBuyAbility do  
            wait(1)
            if not Funcs:AbilityUnlocked("Instinct") and Funcs:CanBuy("Instinct") then
                OtherEvent.MainEvents.Modules:FireServer("Ability_Teacher", "Nugget Man")
            elseif not Funcs:AbilityUnlocked("FlashStep") and Funcs:CanBuy("FlashStep") then
                OtherEvent.MainEvents.Modules:FireServer("Ability_Teacher", "Giga Chad")
            elseif not Funcs:AbilityUnlocked("Aura") and Funcs:CanBuy("Aura") then
                OtherEvent.MainEvents.Modules:FireServer("Ability_Teacher", "Aura Master")
            else 
                wait(3) 
            end
        end
    end
})

for _, s in next, Loaded.Shop do
    ShopTab:AddSection({s[1]})
    for _, item in pairs(s[2]) do
        local buyfunc = item[3]
        if type(buyfunc) == "table" then
            buyfunc = function()
                OtherEvent.MainEvents.Modules:FireServer(unpack(item[3]))
            end
        end
        
        ShopTab:AddButton({
            Name = item[1],
            Callback = buyfunc,
            Description = item[2]
        })
    end
end
