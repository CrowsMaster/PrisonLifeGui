local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()

local Window = OrionLib:MakeWindow({Name = "Prison Life", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "Welcome", IntroIcon = "rbxassetid://10993876141"})

espLib.options.enabled = false
espLib.options.outOfViewArrows = false
espLib.options.outOfViewArrowsOutline = false
espLib.options.names = false
espLib.options.boxes = false
espLib.options.healthBars = false
espLib.options.healthText = false
espLib.options.distance = false
espLib.options.tracers = false
espLib.options.chams = false

-- Guns Tab
local GunsTab = Window:MakeTab({
	Name = "Tools",
	Icon = "rbxassetid://484396034",
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

local OtherSection = GunsTab:AddSection({
	Name = "Other"
})

OtherSection:AddButton({
	Name = "Key Card",
	Callback = function()
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Key Card") then
            OrionLib:MakeNotification({
            Name = "Error",
            Content = "You already have a key card in your backpack.",
            Image = "rbxassetid://7240801337",
            Time = 5
            })
        elseif game:GetService("Workspace").Prison_ITEMS.single:FindFirstChild("Key card") then
            local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single["Key card"].ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(A_1)
        else
            OrionLib:MakeNotification({
            Name = "Error",
            Content = "No key card on ground.",
            Image = "rbxassetid://7240801337",
            Time = 5
            })
        end
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
	Name = "ESP",
	Default = false,
	Callback = function(Value)
		espLib.options.enabled = Value
		espLib.options.names = Value
		espLib.options.boxes = Value
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

local ColorsSection = VisualsTab:AddSection({
	Name = "Color Settings"
})

ColorsSection:AddToggle({
	Name = "Use Team Colors",
	Default = false,
	Callback = function(Value)
		espLib.options.teamColor = Value
	end    
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

local OtherSection = VisualsTab:AddSection({
	Name = "Other"
})

OtherSection:AddDropdown({
	Name = "Tracers Origin",
	Default = "Bottom",
	Options = {"Bottom", "Top", "Mouse"},
	Callback = function(Value)
		espLib.options.tracerOrigin = Value
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
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		if not game.Players.LocalPlayer.Backpack:FindFirstChild("Remington 870") then
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

OtherTab:AddDropdown({
	Name = "Select Team",
	Default = "",
	Options = {"Inmates", "Guards", "Criminals"},
	Callback = function(Value)
		if Value == "Inmates" then
		    local PlayerName = game:GetService("Players").LocalPlayer
            local TeamColor = "Bright orange"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(PlayerName, TeamColor)
		elseif Value == "Guards" then
            local PlayerName = game:GetService("Players").LocalPlayer
            local TeamColor = "Bright blue"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(PlayerName, TeamColor)
		elseif Value == "Criminals" then
            local PlayerName = game:GetService("Players").LocalPlayer
            local TeamColor = "Really red"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(PlayerName, TeamColor)
		end
	end    
})

OtherTab:AddDropdown({
	Name = "Teleports",
	Default = "",
	Options = {"Prison - Cafeteria", "Prison - Hall", "Prison - Cells", "Prison - Yard", "Prison - Guard Room", "Prison - Entrance", "Prison - Outside", "Prison - Roof", "Prison - Secret Room", "Criminal Base - Outside", "Criminal Base - Inside", "City - Car Spawner 1", "City - Car Spawner 2"},
	Callback = function(Value)
		if Value == "Prison - Cafeteria" then
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(886.899597, 100.53997, 2295.79663)
		elseif Value == "Prison - Hall" then
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.216003, 100.990005, 2372.75806)
		elseif Value == "Prison - Cells" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.099121, 100.730217, 2447.09961)
		elseif Value == "Prison - Yard" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(790.500366, 98.4999466, 2454.79907)
		elseif Value == "Prison - Guard Room" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(832.800171, 100.490005, 2317.6001)
		elseif Value == "Prison - Entrance" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(703.800354, 100.490005, 2280.6001)
		elseif Value == "Prison - Outside" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.800354, 98.6900101, 2253.6001)
		elseif Value == "Prison - Roof" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820.800171, 119.490005, 2354.6001)
		elseif Value == "Prison - Secret Room" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(690.200317, 100.690758, 2343.8501)
		elseif Value == "Criminal Base - Outside" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-918.710571, 95.6273041, 2152.47095)
		elseif Value == "Criminal Base - Inside" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-940.700317, 94.6287842, 2066.92578)
		elseif Value == "City - Car Spawner 1" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-531.347717, 55.0750389, 1778.49341)
		elseif Value == "City - Car Spawner 2" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198.505981, 55.0750275, 1880.09399)
		end
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

CharTab:AddSlider({
	Name = "Camera FOV",
	Min = 60,
	Max = 120,
	Default = 70,
	Increment = 1,
	ValueName = "Field of View",
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = Value
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

espLib:Load()
OrionLib:Init()
