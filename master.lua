local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local EspLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Sirius/request/library/esp/esp.lua'),true))()

local Window = Rayfield:CreateWindow({
    Name = "Prison Life",
    LoadingTitle = "Welcome",
    LoadingSubtitle = "Prison Life",
    ConfigurationSaving = {
	    Enabled = false,
	    FileName = "",
    },
    KeySystem = false,
    KeySettings = {
	    Title = "",
	    Subtitle = "",
	    Note = "",
	    Key = ""
    }
})

EspLib.options.enabled = false
EspLib.options.outOfViewArrows = false
EspLib.options.outOfViewArrowsOutline = false
EspLib.options.names = false
EspLib.options.boxes = false
EspLib.options.healthBars = false
EspLib.options.healthText = false
EspLib.options.distance = false
EspLib.options.tracers = false
EspLib.options.chams = false

-- Tools Tab
local ToolsTab = Window:CreateTab("Tools")

-- Tools Tab Elements - Weapons
local Tools_GunsSection = ToolsTab:CreateSection("Guns")

local AK47Button = ToolsTab:CreateButton({
	Name = "AK-47",
	Callback = function()
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
	end,
})

local M4A1Button = ToolsTab:CreateButton({
	Name = "M4A1",
	Callback = function()
		if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 96651) == true then
            local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver.M4A1.ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(A_1)
        else
            Rayfield:Notify("Can't Pick Up Weapon", "You do not have the required gamepass to pick up this weapon.", 10876993533)
        end
	end,
})

local RemingtonButton = ToolsTab:CreateButton({
	Name = "Remington 870",
	Callback = function()
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
	end,
})

local M9Button = ToolsTab:CreateButton({
	Name = "M9",
	Callback = function()
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver.M9.ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
	end,
})

-- Tools Tab Elements - Melee Weapons
local Tools_MeleeSection = ToolsTab:CreateSection("Melee")

local CrudeButton = ToolsTab:CreateButton({
	Name = "Curde Knife",
	Callback = function()
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single["Crude Knife"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
	end,
})

local HammerButton = ToolsTab:CreateButton({
	Name = "Hammer",
	Callback = function()
		local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single.Hammer.ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
	end,
})

-- Tools Tab Elements - Others
local Tools_OtherSection = ToolsTab:CreateSection("Other")

local KeyCardButton = ToolsTab:CreateButton({
	Name = "Key Card",
	Callback = function()
		if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Key Card") then
            Rayfield:Notify("Can't Pick Up Key Card", "You already have a key card in your backpack.", 10876993533)
        elseif game:GetService("Workspace").Prison_ITEMS.single:FindFirstChild("Key card") then
            local A_1 = game:GetService("Workspace")["Prison_ITEMS"].single["Key card"].ITEMPICKUP
            local Event = game:GetService("Workspace").Remote.ItemHandler
            Event:InvokeServer(A_1)
        else
            Rayfield:Notify("Can't Pick Up Key Card", "There is no key card on the ground. Please try again later.", 10876993533)
        end
	end,
})

-- Visuals Tab
local VisualsTab = Window:CreateTab("Visuals")

-- Visuals Tab Elements - Toggles
local Visuals_TogglesSection = VisualsTab:CreateSection("Toggles")

local ESPToggle = VisualsTab:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		EspLib.options.enabled = Value
		EspLib.options.names = Value
		EspLib.options.boxes = Value
	end,
})

local DistanceToggle = VisualsTab:CreateToggle({
	Name = "Distance",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		EspLib.options.distance = Value
	end,
})

local TracersToggle = VisualsTab:CreateToggle({
	Name = "Tracers",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		EspLib.options.tracers = Value
	end,
})

-- Visuals Tab Elements - Colors
local Visuals_ColorsSection = VisualsTab:CreateSection("Color Settings")

local TeamColorsToggle = VisualsTab:CreateToggle({
	Name = "Use Team Colors",
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		EspLib.options.teamColor = Value
	end,
})

local Paragraph = VisualsTab:CreateParagraph({Title = "Other Color Settings", Content = "Rayfield UI library doesn't have a color picker yet. Other color settings will be added when the color picker gets added."})

-- Visuals Tab Elements - Others
local Visuals_OtherSection = VisualsTab:CreateSection("Other")

local TracersDropdown = VisualsTab:CreateDropdown({
	Name = "Tracers Origin",
	Options = {"Bottom", "Mouse", "Top"},
	CurrentOption = "",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
	  	  EspLib.options.tracerOrigin = Option
	end,
})

-- Others Tab
local OtherTab = Window:CreateTab("Other")

local KillPlrInput = OtherTab:CreateInput({
	Name = "Kill Player (Must Be on Different Teams)",
	PlaceholderText = "",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Remington 870") then
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
	        ["Hit"] = game:GetService("Workspace")[Text].Head
            }, 
	        [2] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-303.5357360839844, -151.40371704101562, 211.99757385253906)), 
	        ["Distance"] = 17.60354232788086, 
	        ["Cframe"] = CFrame.new(407.438477, 84.5028534, 2427.8606, 0.640910029, -0.101060227, -0.760934412, -7.45057971e-09, 0.991295695, -0.13165468, 0.767615974, 0.0843788087, 0.635331333), 
	        ["Hit"] = game:GetService("Workspace")[Text].Head
            }, 
	        [3] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-315.03363037109375, -144.1891326904297, 199.90826416015625)), 
	        ["Distance"] = 18.67498016357422, 
	        ["Cframe"] = CFrame.new(406.729614, 84.4863129, 2427.83203, 0.600598335, -0.100641936, -0.793191493, -7.4505806e-09, 0.992046237, -0.125873089, 0.799550891, 0.0755991787, 0.595821381), 
	        ["Hit"] = game:GetService("Workspace")[Text].Head
            }, 
	        [4] =  {
        	["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-300.7127990722656, -155.8857879638672, 212.7708740234375)), 
	        ["Distance"] = 17.497360229492188, 
	        ["Cframe"] = CFrame.new(407.529755, 84.4034576, 2427.86426, 0.646338284, -0.109738067, -0.755118787, 0, 0.989604652, -0.143814847, 0.763051033, 0.0929530412, 0.63961935), 
	        ["Hit"] = game:GetService("Workspace")[Text].Head
            }, 
	        [5] =  {
	        ["RayObject"] = Ray.new(Vector3.new(415.72125244140625, 90.8162612915039, 2422.989990234375), Vector3.new(-310.412353515625, -150.8854217529297, 202.18251037597656)), 
	        ["Distance"] = 18.405447006225586, 
	        ["Cframe"] = CFrame.new(406.929382, 84.3506622, 2427.83936, 0.611593544, -0.112707764, -0.783102989, 0, 0.989801049, -0.142456681, 0.791172206, 0.0871255845, 0.605355918), 
	        ["Hit"] = game:GetService("Workspace")[Text].Head
            }
        }
        local A_2 = game.Players.LocalPlayer.Backpack["Remington 870"]
        local Event = game:GetService("ReplicatedStorage").ShootEvent
        Event:FireServer(A_1, A_2)
        Event:FireServer(A_1, A_2)
	end,
})

local TeamsDropdown = OtherTab:CreateDropdown({
	Name = "Select Team",
	Options = {"Inmates", "Guards", "Criminals"},
	CurrentOption = "",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
	  	  if Option == "Inmates" then
		    local PlayerName = game:GetService("Players").LocalPlayer
            local TeamColor = "Bright orange"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(PlayerName, TeamColor)
		elseif Option == "Guards" then
            local PlayerName = game:GetService("Players").LocalPlayer
            local TeamColor = "Bright blue"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(PlayerName, TeamColor)
		elseif Option == "Criminals" then
            local PlayerName = game:GetService("Players").LocalPlayer
            local TeamColor = "Really red"
            local Event = game:GetService("Workspace").Remote.loadchar
            Event:InvokeServer(PlayerName, TeamColor)
		end
	end,
})

local TeleportsDropdown = OtherTab:CreateDropdown({
	Name = "Teleport",
	Options = {"Prison - Cafeteria", "Prison - Hall", "Prison - Cells", "Prison - Yard", "Prison - Guard Room", "Prison - Entrance", "Prison - Outside", "Prison - Roof", "Prison - Secret Room", "Criminal Base - Outside", "Criminal Base - Inside", "City - Car Spawner 1", "City - Car Spawner 2"},
	CurrentOption = "",
	Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
	  	 if Option == "Prison - Cafeteria" then
		    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(886.899597, 100.53997, 2295.79663)
		elseif Option == "Prison - Hall" then
		    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.216003, 100.990005, 2372.75806)
		elseif Option == "Prison - Cells" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(916.099121, 100.730217, 2447.09961)
		elseif Option == "Prison - Yard" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(790.500366, 98.4999466, 2454.79907)
		elseif Option == "Prison - Guard Room" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(832.800171, 100.490005, 2317.6001)
		elseif Option == "Prison - Entrance" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(703.800354, 100.490005, 2280.6001)
		elseif Option == "Prison - Outside" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.800354, 98.6900101, 2253.6001)
		elseif Option == "Prison - Roof" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(820.800171, 119.490005, 2354.6001)
		elseif Option == "Prison - Secret Room" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(690.200317, 100.690758, 2343.8501)
		elseif Option == "Criminal Base - Outside" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-918.710571, 95.6273041, 2152.47095)
		elseif Option == "Criminal Base - Inside" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-940.700317, 94.6287842, 2066.92578)
		elseif Option == "City - Car Spawner 1" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-531.347717, 55.0750389, 1778.49341)
		elseif Option == "City - Car Spawner 2" then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-198.505981, 55.0750275, 1880.09399)
		end
	end,
})

-- Character Tab
local CharacterTab = Window:CreateTab("Character")

local WalkspeedSlider = CharacterTab:CreateSlider({
	Name = "Walkspeed",
	Range = {8, 250},
	Increment = 2,
	Suffix = "player walkspeed",
	CurrentValue = 16,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
})

local JumpPowerSlider = CharacterTab:CreateSlider({
	Name = "Jump Power",
	Range = {25, 250},
	Increment = 1,
	Suffix = "player jump power",
	CurrentValue = 50,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
	    game:GetService("Players").LocalPlayer.Character.Humanoid.UseJumpPower = true
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = Value
	end,
})

local FOVSlider = CharacterTab:CreateSlider({
	Name = "Camera FOV",
	Range = {60, 120},
	Increment = 2,
	Suffix = "field of view",
	CurrentValue = 70,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
	    workspace.CurrentCamera.FieldOfView = Value
	end,
})

local Button = CharacterTab:CreateButton({
	Name = "Sit",
	Callback = function()
		game:GetService("Players").LocalPlayer.Character.Humanoid.Sit = true
	end,
})

local Button = CharacterTab:CreateButton({
	Name = "Kill",
	Callback = function()
		game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
	end,
})

EspLib:Load()
