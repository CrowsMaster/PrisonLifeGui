local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()

local Window = OrionLib:MakeWindow({Name = "Prison Life", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "Prison Life - Loading"})

local espLib = {
    drawings = {},
    instances = {},
    espCache = {},
    chamsCache = {},
    objectCache = {},
    conns = {},
    whitelist = {}, -- insert string that is the player's name you want to whitelist (turns esp color to whitelistColor in options)
    blacklist = {}, -- insert string that is the player's name you want to blacklist (removes player from esp)
    options = {
        enabled = false,
        minScaleFactorX = 1,
        maxScaleFactorX = 10,
        minScaleFactorY = 1,
        maxScaleFactorY = 10,
        boundingBox = false, -- WARNING | Significant Performance Decrease when true
        boundingBoxDescending = true,
        font = 2,
        fontSize = 13,
        limitDistance = false,
        maxDistance = 1000,
        visibleOnly = false,
        teamCheck = false,
        teamColor = false,
        fillColor = nil,
        whitelistColor = Color3.new(1, 0, 0),
        outOfViewArrows = false,
        outOfViewArrowsFilled = true,
        outOfViewArrowsSize = 25,
        outOfViewArrowsRadius = 100,
        outOfViewArrowsColor = Color3.new(1, 1, 1),
        outOfViewArrowsTransparency = 0.5,
        outOfViewArrowsOutline = true,
        outOfViewArrowsOutlineFilled = false,
        outOfViewArrowsOutlineColor = Color3.new(1, 1, 1),
        outOfViewArrowsOutlineTransparency = 1,
        names = false,
        nameTransparency = 1,
        nameColor = Color3.new(1, 1, 1),
        boxes = false,
        boxesTransparency = 1,
        boxesColor = Color3.new(1, 0, 0),
        boxFill = false,
        boxFillTransparency = 0.5,
        boxFillColor = Color3.new(1, 0, 0),
        healthBars = false,
        healthBarsSize = 1,
        healthBarsTransparency = 1,
        healthBarsColor = Color3.new(0, 1, 0),
        healthText = false,
        healthTextTransparency = 1,
        healthTextSuffix = "%",
        healthTextColor = Color3.new(1, 1, 1),
        distance = false,
        distanceTransparency = 1,
        distanceSuffix = " Studs",
        distanceColor = Color3.new(1, 1, 1),
        tracers = false,
        tracerTransparency = 1,
        tracerColor = Color3.new(1, 1, 1),
        tracerOrigin = "Bottom", -- Available [Mouse, Top, Bottom]
        chams = false,
        chamsFillColor = Color3.new(1, 0, 0),
        chamsFillTransparency = 0.5,
        chamsOutlineColor = Color3.new(),
        chamsOutlineTransparency = 0
    },
};

-- Guns Tab
local GunsTab = Window:MakeTab({
	Name = "Weapons",
	Icon = "rbxassetid://9478594148",
	PremiumOnly = false
})

local GunsSection = GunsTab:AddSection({
	Name = "Guns"
})

GunsSection:AddButton({
	Name = "AK-47",
	Callback = function()
      	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
  	end    
})

GunsSection:AddButton({
	Name = "M4A1",
	Callback = function()
      	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver.M4A1.ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
  	end    
})

GunsSection:AddButton({
	Name = "Remington 870",
	Callback = function()
      	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)	
  	end    
})

GunsSection:AddButton({
	Name = "M9",
	Callback = function()
      	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)	
  	end    
})

local MeleeSection = GunsTab:AddSection({
	Name = "Melee"
})

MeleeSection:AddButton({
	Name = "Crude Knife",
	Callback = function()
      	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single["Crude Knife"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
  	end    
})
MeleeSection:AddButton({
	Name = "Hammer",
	Callback = function()
      	local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single.Hammer.ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end    
})

-- Visuals Tab
local VisualsTab = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://10686484299",
	PremiumOnly = false
})

local TogglesSection = VisualsTab:AddSection({
	Name = "Toggles"
})

TogglesSection:AddToggle({
	Name = "ESP Enabled",
	Default = false,
	Callback = function(Value)
		espLib.options.enabled = Value
	end    
})

TogglesSection:AddToggle({
	Name = "Names",
	Default = false,
	Callback = function(Value)
		espLib.options.names = Value
	end    
})

TogglesSection:AddToggle({
	Name = "Boxes",
	Default = false,
	Callback = function(Value)
		espLib.options.boxes = Value
	end    
})

TogglesSection:AddToggle({
	Name = "Use Team Colors",
	Default = false,
	Callback = function(Value)
		espLib.options.teamColor = Value
	end    
})

TogglesSection:AddToggle({
	Name = "Show Distance",
	Default = false,
	Callback = function(Value)
		espLib.options.distance = Value
	end    
})

TogglesSection:AddToggle({
	Name = "Tracers",
	Default = false,
	Callback = function(Value)
		espLib.options.tracers = Value
	end    
})

local ColorsSection = Tab:AddSection({
	Name = "Color Settings"
})

ColorsSection:AddColorpicker({
	Name = "Names Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		espLib.options.nameColor = Value
	end	  
})

ColorsSection:AddColorpicker({
	Name = "Boxes Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		espLib.options.boxesColor = Value
	end	  
})

ColorsSection:AddColorpicker({
	Name = "Distance Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		espLib.options.distanceColor = Value
	end	  
})

ColorsSection:AddColorpicker({
	Name = "Tracers Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		espLib.options.tracerColor = Value
	end	  
})

-- Other Tab
local OtherTab = Window:MakeTab({
	Name = "Other",
	Icon = "rbxassetid://5639840603",
	PremiumOnly = false
})

OtherTab:AddTextbox({
	Name = "Kill Player",
	Default = "Enter name here",
	TextDisappear = true,
	Callback = function(Value)
		if not game.LocalPlayer.Backpack:FindFirstChild("Remington 870") then
		   	local GiveGun = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(GiveGun)	 
		end
		wait(.2)
		local A_1 =  {
	        [1] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-306.78546142578125, -136.98300170898438, 217.06759643554688)), 
	        ["Distance"] = 17.318809509277344, 
	        ["Cframe"] = CFrame.new(407.552673, 84.9455109, 2427.84814, 0.646553576, -0.0630896017, -0.760255337, 0, 0.996574521, -0.0827004761, 0.762868702, 0.0534702875, 0.644338727), 
	        ["Hit"] = game:GetService("Workspace")[Value].Head
            }, 
	        [2] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-303.5357360839844, -151.40371704101562, 211.99757385253906)), 
	        ["Distance"] = 17.60354232788086, 
	        ["Cframe"] = CFrame.new(407.438477, 84.5028534, 2427.8606, 0.640910029, -0.101060227, -0.760934412, -7.45057971e-09, 0.991295695, -0.13165468, 0.767615974, 0.0843788087, 0.635331333), 
	        ["Hit"] = game:GetService("Workspace")[Value].Head
            }, 
	        [3] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-315.03363037109375, -144.1891326904297, 199.90826416015625)), 
	        ["Distance"] = 18.67498016357422, 
	        ["Cframe"] = CFrame.new(406.729614, 84.4863129, 2427.83203, 0.600598335, -0.100641936, -0.793191493, -7.4505806e-09, 0.992046237, -0.125873089, 0.799550891, 0.0755991787, 0.595821381), 
	        ["Hit"] = game:GetService("Workspace")[Value].Head
            }, 
	        [4] =  {
        	["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-300.7127990722656, -155.8857879638672, 212.7708740234375)), 
	        ["Distance"] = 17.497360229492188, 
	        ["Cframe"] = CFrame.new(407.529755, 84.4034576, 2427.86426, 0.646338284, -0.109738067, -0.755118787, 0, 0.989604652, -0.143814847, 0.763051033, 0.0929530412, 0.63961935), 
	        ["Hit"] = game:GetService("Workspace")[Value].Head
            }, 
	        [5] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-310.412353515625, -150.8854217529297, 202.18251037597656)), 
	        ["Distance"] = 18.405447006225586, 
	        ["Cframe"] = CFrame.new(406.929382, 84.3506622, 2427.83936, 0.611593544, -0.112707764, -0.783102989, 0, 0.989801049, -0.142456681, 0.791172206, 0.0871255845, 0.605355918), 
	        ["Hit"] = game:GetService("Workspace")[Value].Head
            }
        }
local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
local Event = game:GetService("ReplicatedStorage").ShootEvent
Event:FireServer(A_1, A_2)
Event:FireServer(A_1, A_2)
end
})

--Char Tab
local CharTab = Window:MakeTab({
	Name = "Character",
	Icon = "rbxassetid://9457123174",
	PremiumOnly = false
})

CharTab:AddSlider({
	Name = "Walkspeed",
	Min = 8,
	Max = 150,
	Default = 16,
	Increment = 1,
	ValueName = "Player Walkspeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})

CharTab:AddSlider({
	Name = "Jump Power",
	Min = 20,
	Max = 250,
	Default = 50,
	Increment = 1,
	ValueName = "Player Jump Power",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

CharTab:AddButton({
    Name = "Sit",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    end    
})

CharTab:AddButton({
    Name = "Kill",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end    
})

OrionLib:Init()
