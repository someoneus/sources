local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local userInputService = game:GetService("UserInputService")
local starterGui = game:GetService("StarterGui")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local camera = workspace.CurrentCamera

-- Function to send notification
local function sendNotification(title, text, duration)
    starterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration;
    })
end

-- Create the ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "VioletVexGUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

-- Create the top bar frame
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(0.98, 0, 0, 40)
topBar.Position = UDim2.new(0.01, 0, 0.05, 0)
topBar.BackgroundColor3 = Color3.fromRGB(90, 0, 140)
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Draggable = true
topBar.Parent = gui

-- Add rounded corners
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = topBar

-- Create the title label
local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 200, 1, 0)
title.Position = UDim2.new(0.02, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Violet Vex 1.0"
title.TextColor3 = Color3.fromRGB(220, 180, 255)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = Color3.fromRGB(50, 0, 90)
title.Parent = topBar

-- Create the close (X) button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 40, 1, 0)
closeButton.Position = UDim2.new(1, -45, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.Sarpanch
closeButton.TextScaled = true
closeButton.Parent = topBar

-- Create Visuals UI
local visualsFrame = Instance.new("Frame")
visualsFrame.Size = UDim2.new(0, 120, 0, 40)
visualsFrame.Position = UDim2.new(0, 5, 2.2, -45)
visualsFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
visualsFrame.BorderSizePixel = 0
visualsFrame.Parent = topBar

local visualsLabel = Instance.new("TextLabel")
visualsLabel.Parent = visualsFrame
visualsLabel.Size = UDim2.new(0, 120, 0, 40)
visualsLabel.Position = UDim2.new(0, 0, 0, 0)
visualsLabel.BackgroundColor3 = Color3.fromRGB(90, 0, 140)
visualsLabel.BorderSizePixel = 0
visualsLabel.Text = "Visuals"
visualsLabel.TextScaled = true
visualsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
visualsLabel.Font = Enum.Font.Sarpanch
visualsLabel.TextStrokeTransparency = 0
visualsLabel.TextStrokeColor3 = Color3.fromRGB(50, 0, 90)



local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(1, 0, 0, 35)
toggleButton.Position = UDim2.new(0.63, -75, 1.6, -25) -- Centered
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "Trace Players"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Sarpanch
toggleButton.TextScaled = true
toggleButton.Parent = visualsLabel
toggleButton.BorderSizePixel = 0

-- Create Indicator
local indicator = Instance.new("Frame")
indicator.Name = "Indicator"
indicator.Size = UDim2.new(0, 20, 0, 20)
indicator.Position = UDim2.new(1, 10, 0.5, -10) -- Positioned to the right of the button
indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF state)
indicator.BorderSizePixel = 2
indicator.BorderColor3 = Color3.fromRGB(0, 0, 0) -- Black border
indicator.Parent = toggleButton


local TracerEnabled = false
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Tracers = {}
local Labels = {}

local function CreateTracer(target, isPlayer)
    if IgnorePlayers and isPlayer then 
        RemoveTracer(target, true) -- Remove any existing tracers for players
        return 
    end
    
    local line = Drawing.new("Line")
    line.Thickness = 2
    line.Transparency = 1
    line.Visible = false
    
    if isPlayer then
        Tracers[target] = line
        local label = Drawing.new("Text")
        label.Size = 16
        label.Center = true
        label.Outline = true
        label.OutlineColor = Color3.fromRGB(0, 0, 0)
        label.Visible = false
        Labels[target] = label
    else
        HumanoidTracers[target] = line
        local label = Drawing.new("Text")
        label.Size = 16
        label.Center = true
        label.Outline = true
        label.OutlineColor = Color3.fromRGB(0, 0, 0)
        label.Visible = false
        HumanoidLabels[target] = label
    end
end


local function RemoveTracer(target)
    if Tracers[target] then
        Tracers[target]:Remove()
        Tracers[target] = nil
    end
    if Labels[target] then
        Labels[target]:Remove()
        Labels[target] = nil
    end
end

local function ResetTracers()
    for target in pairs(Tracers) do
        RemoveTracer(target)
    end
end

local function UpdateTracers()
    if not TracerEnabled then return end
    
    for target, line in pairs(Tracers) do
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = target.Character.HumanoidRootPart
            local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            
            if onScreen then
                local greenValue = math.clamp(255 - (distance * 2), 0, 255)
                local tracerColor = Color3.fromRGB(255 - greenValue, greenValue, 0)
                
                line.Color = tracerColor
                line.From = screenCenter
                line.To = Vector2.new(rootPos.X, rootPos.Y)
                line.Visible = true
                
                local label = Labels[target]
                if label then
                    local scale = math.clamp(16 - (distance / 10), 8, 16)
                    label.Size = scale
                    label.Position = Vector2.new(rootPos.X, rootPos.Y - 20)
                    label.Text = string.format("%s%.1f studs", target.Name, distance)
                    label.Color = tracerColor
                    label.OutlineColor = Color3.fromRGB(0, 0, 0)
                    label.Visible = true
                end
            else
                line.Visible = false
                if Labels[target] then
                    Labels[target].Visible = false
                end
            end
        else
            RemoveTracer(target)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    if TracerEnabled then
        CreateTracer(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveTracer(player)
end)



local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local isToggled = false
local updateRate = 1 / 45  -- Update every 1/45 seconds (reduces lag)
local lastUpdate = 0
local playerConnections = {}

-- Function to handle character respawning & death
local function OnCharacterAdded(player, character)
    -- Remove old tracer if it exists
    RemoveTracer(player, true)

    -- Wait until HumanoidRootPart is available
    local rootPart = character:WaitForChild("HumanoidRootPart", 10)
    if rootPart and isToggled then
        CreateTracer(player, true)
    end

    -- Ensure tracer gets removed when player dies
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            RemoveTracer(player, true)
        end)
    end
end

-- Function to manage players joining and leaving
local function HandlePlayer(player)
    -- If player has already been tracked, clean up
    if playerConnections[player] then
        playerConnections[player]:Disconnect()
        playerConnections[player] = nil
    end

    -- Listen for character spawns
    playerConnections[player] = player.CharacterAdded:Connect(function(character)
        OnCharacterAdded(player, character)
    end)

    -- If player already has a character, process it
    if player.Character then
        OnCharacterAdded(player, player.Character)
    end
end

-- Remove tracers when a player leaves
local function OnPlayerRemoving(player)
    RemoveTracer(player, true)
    if playerConnections[player] then
        playerConnections[player]:Disconnect()
        playerConnections[player] = nil
    end
end

toggleButton.MouseButton1Click:Connect(function()
    isToggled = not isToggled

    if isToggled then
        -- Apply tracers to all players (except LocalPlayer)
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                HandlePlayer(player)
            end
        end

        -- Start updating tracers
        RunService:BindToRenderStep("UpdatePlayerTracers", Enum.RenderPriority.Camera.Value, function()
            -- Reduce update frequency to avoid lag
            if tick() - lastUpdate < updateRate then return end
            lastUpdate = tick()

            for target, line in pairs(Tracers) do
                if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    local rootPart = target.Character.HumanoidRootPart
                    local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
                    local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
                    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

                    if onScreen then
                        -- Color transitions from Green (close) to Red (far)
                        local greenValue = math.clamp(255 - (distance * 1.25), 0, 255)
                        local tracerColor = Color3.fromRGB(255 - greenValue, greenValue, 0)

                        line.Color = tracerColor
                        line.From = screenCenter
                        line.To = Vector2.new(rootPos.X, rootPos.Y)
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                else
                    RemoveTracer(target, true)
                end
            end
        end)

        indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green (ON)
    else
        -- Turn off tracers when toggled off
        RunService:UnbindFromRenderStep("UpdatePlayerTracers")
        for target in pairs(Tracers) do
            RemoveTracer(target, true)
        end
        indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF)
    end
end)

-- Ensure tracers update when players join and respawn
Players.PlayerAdded:Connect(HandlePlayer)
Players.PlayerRemoving:Connect(OnPlayerRemoving) -- ✅ FIX: Remove tracer when player leaves




local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(1, 0, 0, 35)
toggleButton.Position = UDim2.new(0.63, -75, 2.45, -25) -- Centered
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "Trace NPCs"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Sarpanch
toggleButton.TextScaled = true
toggleButton.Parent = visualsLabel
toggleButton.BorderSizePixel = 0

-- Create Indicator
local indicator = Instance.new("Frame")
indicator.Name = "Indicator"
indicator.Size = UDim2.new(0, 20, 0, 20)
indicator.Position = UDim2.new(1, 10, 0.5, -10) -- Positioned to the right of the button
indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF state)
indicator.BorderSizePixel = 2
indicator.BorderColor3 = Color3.fromRGB(0, 0, 0) -- Black border
indicator.Parent = toggleButton

local TracerEnabled = false
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Workspace = game:GetService("Workspace")

local Tracers = {}

-- Function to create a tracer for any Humanoid (excluding players)
local function CreateTracer(humanoid)
    local character = humanoid.Parent
    if not character or not humanoid:IsA("Humanoid") then return end

    -- Check if the humanoid belongs to a player
    if Players:GetPlayerFromCharacter(character) then return end  

    -- Ensure HumanoidRootPart exists
    local rootPart = character:FindFirstChild("HumanoidRootPart") or character:WaitForChild("HumanoidRootPart", 5)
    if not rootPart then return end

    -- If already has a tracer, don't add another one
    if Tracers[character] then return end  

    -- Create the tracer line
    local line = Drawing.new("Line")
    line.Thickness = 2
    line.Transparency = 1
    line.Color = Color3.fromRGB(255, 0, 0) -- Start as red (far)
    line.Visible = false

    -- Store the tracer
    Tracers[character] = line

    -- Remove tracer when character is removed
    character.AncestryChanged:Connect(function()
        if not character:IsDescendantOf(workspace) then
            RemoveTracer(character)
        end
    end)

    -- Remove tracer when Humanoid dies
    humanoid.Died:Connect(function()
        RemoveTracer(character)
    end)
end

-- Function to remove a tracer
local function RemoveTracer(character)
    if Tracers[character] then
        Tracers[character]:Remove()
        Tracers[character] = nil
    end
end

-- Function to update tracers
local function UpdateTracers()
    if not TracerEnabled then return end

    for character, line in pairs(Tracers) do
        if character and character.Parent and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character.HumanoidRootPart
            local screenPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

            if onScreen then
                -- Calculate distance
                local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude

                -- Gradual color change (Red for far, Green for close)
                local greenValue = math.clamp(255 - (distance * 1.5), 0, 255)
                local tracerColor = Color3.fromRGB(255 - greenValue, greenValue, 0)

                line.Color = tracerColor
                line.From = screenCenter -- Start from the center of the screen
                line.To = Vector2.new(screenPos.X, screenPos.Y)
                line.Visible = true
            else
                line.Visible = false
            end
        else
            RemoveTracer(character)
        end
    end
end

-- Function to re-scan all existing NPCs
local function ScanHumanoids()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Humanoid") and obj.Parent then
            CreateTracer(obj)
        end
    end
end

-- Detect new Humanoids in real time
Workspace.DescendantAdded:Connect(function(obj)
    task.wait(0.1) -- Small delay to let it load
    if obj:IsA("Humanoid") and obj.Parent then
        CreateTracer(obj)
    end
end)

-- Toggle tracers on button click
toggleButton.MouseButton1Click:Connect(function()
    TracerEnabled = not TracerEnabled
    indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green (ON)
    if TracerEnabled then
        ScanHumanoids() -- Re-detect all humanoids when turning tracers on
        RunService:BindToRenderStep("UpdateTracers", Enum.RenderPriority.Camera.Value, UpdateTracers)
    else
        RunService:UnbindFromRenderStep("UpdateTracers")
        indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF)
        for character in pairs(Tracers) do
            RemoveTracer(character)
        end
    end
end)





local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(1, 0, 0, 35)
toggleButton.Position = UDim2.new(0.63, -75, 3.30, -25) -- Centered
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "Label Players"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Sarpanch
toggleButton.TextScaled = true
toggleButton.Parent = visualsLabel
toggleButton.BorderSizePixel = 0

-- Create Indicator
local indicator = Instance.new("Frame")
indicator.Name = "Indicator"
indicator.Size = UDim2.new(0, 20, 0, 20)
indicator.Position = UDim2.new(1, 10, 0.5, -10) -- Positioned to the right of the button
indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF state)
indicator.BorderSizePixel = 2
indicator.BorderColor3 = Color3.fromRGB(0, 0, 0) -- Black border
indicator.Parent = toggleButton

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local RunService = game:GetService("RunService")

local isLabelEnabled = false  -- Toggle state

-- Function to create the text label above the target's head
local function createLabel(character)
    if not character then return end
    local head = character:WaitForChild("Head", 10)
    local hrp = character:WaitForChild("HumanoidRootPart", 10)
    if not head or not hrp then return end

    -- Prevent duplicate labels
    if head:FindFirstChild("PlayerLabel") then return end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "PlayerLabel"
    billboardGui.Adornee = head
    billboardGui.Parent = head
    billboardGui.Size = UDim2.new(16, 0, 4, 0)
    billboardGui.StudsOffset = Vector3.new(0, 5, 0)
    billboardGui.AlwaysOnTop = true  -- Ensures the label shows through walls

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.Text = ""
end

-- Function to update the label's information
local function updateLabel(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if head and hrp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (hrp.Position - player.Character.HumanoidRootPart.Position).Magnitude
        local targetName = character.Name

        local billboardGui = head:FindFirstChild("PlayerLabel")
        if billboardGui then
            local textLabel = billboardGui:FindFirstChildOfClass("TextLabel")
            if textLabel then
                -- Calculate color: from red (far) to green (close)
                local greenValue = math.clamp(255 - (distance * 1.5), 0, 255)
                local labelColor = Color3.fromRGB(255 - greenValue, greenValue, 0)
                textLabel.Text = targetName .. "\n" .. math.floor(distance) .. " studs"
                textLabel.TextColor3 = labelColor
            end
        end
    end
end

-- Function to remove the label
local function removeLabel(character)
    if not character then return end
    local head = character:FindFirstChild("Head")
    if head then
        local billboardGui = head:FindFirstChild("PlayerLabel")
        if billboardGui then
            billboardGui:Destroy()
        end
    end
end

-- Toggle button logic (toggleButton is assumed to exist)
toggleButton.MouseButton1Click:Connect(function()
    indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (ON)
    if isLabelEnabled then
        isLabelEnabled = false
        -- Remove labels from all players
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                removeLabel(otherPlayer.Character)
            end
        end
    else
        indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Red (OFF state)
        isLabelEnabled = true
        -- Create labels for all current players
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                createLabel(otherPlayer.Character)
            end
        end
    end
end)

-- Connect CharacterAdded for players joining and respawning
game.Players.PlayerAdded:Connect(function(otherPlayer)
    if otherPlayer ~= player then
        otherPlayer.CharacterAdded:Connect(function(character)
            -- Wait for essential parts to load before creating the label
            character:WaitForChild("Head", 10)
            character:WaitForChild("HumanoidRootPart", 10)
            if isLabelEnabled then
                createLabel(character)
            end
        end)
    end
end)

-- Also handle players who already exist in the game
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
    if otherPlayer ~= player then
        otherPlayer.CharacterAdded:Connect(function(character)
            character:WaitForChild("Head", 10)
            character:WaitForChild("HumanoidRootPart", 10)
            if isLabelEnabled then
                createLabel(character)
            end
        end)
    end
end

-- Clean up label when a player is leaving
game.Players.PlayerRemoving:Connect(function(otherPlayer)
    if otherPlayer.Character then
        removeLabel(otherPlayer.Character)
    end
end)

-- Update labels every frame using RenderStepped
RunService.RenderStepped:Connect(function()
    if isLabelEnabled then
        for _, otherPlayer in pairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                updateLabel(otherPlayer.Character)
            end
        end
    end
end)





-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(1, 0, 0, 35)
toggleButton.Position = UDim2.new(0.63, -75, 4.15, -25) -- Centered
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "Label NPCs"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Sarpanch
toggleButton.TextScaled = true
toggleButton.Parent = visualsLabel
toggleButton.BorderSizePixel = 0

-- Create Indicator
local indicator = Instance.new("Frame")
indicator.Name = "Indicator"
indicator.Size = UDim2.new(0, 20, 0, 20)
indicator.Position = UDim2.new(1, 10, 0.5, -10) -- Positioned to the right of the button
indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF state)
indicator.BorderSizePixel = 2
indicator.BorderColor3 = Color3.fromRGB(0, 0, 0) -- Black border
indicator.Parent = toggleButton

local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local RunService = game:GetService("RunService")

local isLabelEnabled = false  -- Toggle state
local npcModels = {}  -- Table to track NPC models

-- Function to create the text label above an NPC's head
local function createLabel(model)
    if not model then return end
    local head = model:FindFirstChild("Head") or model:WaitForChild("Head", 10)
    local hrp = model:FindFirstChild("HumanoidRootPart") or model:WaitForChild("HumanoidRootPart", 10)
    if not head or not hrp then return end

    if head:FindFirstChild("NPCLabel") then return end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "NPCLabel"
    billboardGui.Adornee = head
    billboardGui.Parent = head
    billboardGui.Size = UDim2.new(16, 0, 4, 0)
    billboardGui.StudsOffset = Vector3.new(0, 5, 0)
    billboardGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = billboardGui
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = true
    textLabel.TextStrokeTransparency = 0
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.Text = ""
end

-- Function to update the NPC label
local function updateLabel(model)
    if not model then return end
    local head = model:FindFirstChild("Head")
    local hrp = model:FindFirstChild("HumanoidRootPart")
    if head and hrp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (hrp.Position - player.Character.HumanoidRootPart.Position).Magnitude
        local targetName = model.Name

        local billboardGui = head:FindFirstChild("NPCLabel")
        if billboardGui then
            local textLabel = billboardGui:FindFirstChildOfClass("TextLabel")
            if textLabel then
                local greenValue = math.clamp(255 - (distance * 1.5), 0, 255)
                local labelColor = Color3.fromRGB(255 - greenValue, greenValue, 0)
                textLabel.Text = targetName .. "\n" .. math.floor(distance) .. " studs"
                textLabel.TextColor3 = labelColor
            end
        end
    end
end

-- Function to remove the NPC label
local function removeLabel(model)
    if not model then return end
    local head = model:FindFirstChild("Head")
    if head then
        local billboardGui = head:FindFirstChild("NPCLabel")
        if billboardGui then
            billboardGui:Destroy()
        end
    end
end

-- Toggle button logic (toggleButton and indicator are assumed to exist)
toggleButton.MouseButton1Click:Connect(function()
    if isLabelEnabled then
        indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- OFF indicator
        isLabelEnabled = false
        for model, _ in pairs(npcModels) do
            removeLabel(model)
        end
    else
        indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- ON indicator
        isLabelEnabled = true
        for model, _ in pairs(npcModels) do
            createLabel(model)
        end
    end
end)

-- Helper: Try adding an NPC model after a short delay
local function tryAddNPC(model)
    delay(0.1, function()
        if model and model:FindFirstChild("Humanoid") then
            -- Use humanoid.Parent's Name for NPC detection
            if not game.Players:FindFirstChild(model.Name) then
                npcModels[model] = true
                model:WaitForChild("Head", 10)
                model:WaitForChild("HumanoidRootPart", 10)
                if isLabelEnabled then
                    createLabel(model)
                end
            end
        end
    end)
end

-- Initial scan: add any existing NPCs based on Humanoid.Parent
for _, humanoid in pairs(workspace:GetDescendants()) do
    if humanoid:IsA("Humanoid") then
        local model = humanoid.Parent
        if model and not game.Players:FindFirstChild(model.Name) then
            npcModels[model] = true
            if isLabelEnabled then
                createLabel(model)
            end
        end
    end
end

-- Listen for new Humanoid instances to detect new NPCs
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("Humanoid") then
        local model = descendant.Parent
        if model and not game.Players:FindFirstChild(model.Name) then
            tryAddNPC(model)
        end
    end
end)

-- Listen for removal of Humanoid instances to clean up NPC table
workspace.DescendantRemoving:Connect(function(descendant)
    if descendant:IsA("Humanoid") then
        local model = descendant.Parent
        if model and npcModels[model] then
            removeLabel(model)
            npcModels[model] = nil
        end
    end
end)

-- Update labels every frame using RenderStepped over npcModels
RunService.RenderStepped:Connect(function()
    if isLabelEnabled then
        for model, _ in pairs(npcModels) do
            if model and model.Parent then
                updateLabel(model)
            else
                npcModels[model] = nil
            end
        end
    end
end)


-- Create Toggle Button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 200, 0, 35)  -- Adjusted size to match your original setup
toggleButton.Position = UDim2.new(0.63, -75, 5, -25) -- Centered
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "ESP Players"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Sarpanch
toggleButton.TextScaled = true
toggleButton.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui")  -- Set parent to ScreenGui
toggleButton.BorderSizePixel = 0

-- Create Indicator
local indicator = Instance.new("Frame")
indicator.Name = "Indicator"
indicator.Size = UDim2.new(0, 20, 0, 20)
indicator.Position = UDim2.new(1, 10, 0.5, -10) -- Positioned to the right of the button
indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF state)
indicator.BorderSizePixel = 2
indicator.BorderColor3 = Color3.fromRGB(0, 0, 0) -- Black border
indicator.Parent = toggleButton

-- Variables
local toggle = false
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to create the box around the player
local function createBox()
    local box = Instance.new("Part")
    box.Size = character.HumanoidRootPart.Size * Vector3.new(2, 2, 2) -- Adjust box size based on character size
    box.Position = character.HumanoidRootPart.Position
    box.Anchored = false
    box.CanCollide = false
    box.Transparency = 0.5
    box.BrickColor = BrickColor.new("Bright red") -- Change color as needed
    box.Parent = workspace

    -- Weld the box to the character
    local weld = Instance.new("WeldConstraint")
    weld.Part0 = character.HumanoidRootPart
    weld.Part1 = box
    weld.Parent = box

    -- Update box position and rotation based on player movement
    game:GetService("RunService").Heartbeat:Connect(function()
        box.Position = character.HumanoidRootPart.Position
        box.CFrame = character.HumanoidRootPart.CFrame
    end)

    return box
end

-- Toggle functionality
toggleButton.MouseButton1Click:Connect(function()
    if not toggle then
        -- Create the box when toggled on
        local box = createBox()
        toggle = true
    else
        -- Destroy the box when toggled off
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("Part") and obj.Transparency == 0.5 then
                obj:Destroy()
            end
        end
        toggle = false
    end
end)






















-- Toggle visibility with F key
local isVisible = true
local fKeyConnection -- Store F key connection

local function toggleGUI()
    if not gui or not gui.Parent then return end
    isVisible = not isVisible
    gui.Enabled = isVisible

    if isVisible then
        sendNotification("Violet Vex", "GUI Unhidden", 2)
    else
        sendNotification("Violet Vex", "GUI Hidden", 2)
    end
end

fKeyConnection = userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        toggleGUI()
    end
end)

-- Close button deletes everything
closeButton.MouseButton1Click:Connect(function()
    sendNotification("Violet Vex", "GUI Deleted", 2)

    if fKeyConnection then
        fKeyConnection:Disconnect() -- Disable the F key toggle
        fKeyConnection = nil
    end


    gui:Destroy()
    
end)
