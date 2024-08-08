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
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kid Hub", HidePremium = false, IntroText = "Kid Hub", SaveConfig = true, ConfigFolder = "Lazzy Hub"})

OrionLib:MakeNotification({
    Name = "Message",
    Content = "Thanks For Using My Script!",
    Image = "rbxassetid://4483345998",
    Time = 5
})
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
local MainTab = Window:MakeTab({
    Name = "Farmming",
    Icon = "rbxassetid://15689000757",
})
MainTab:AddToggle({
    Name = "AutoFarm(Level)",
   
    Default = false,
    Callback = function(Value)
        
    end    
})
local MainTab = Window:MakeTab({
    Name = "Raid",
})
MainTab:AddToggle({
    Name = "FullyRaid",
    Default = false,
    Callback = function(Value)
        
    end    
})
