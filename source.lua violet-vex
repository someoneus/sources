local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local userInputService = game:GetService("UserInputService")
local starterGui = game:GetService("StarterGui")
local runService = game:GetService("RunService")
local players = game:GetService("Players")
local camera = workspace.CurrentCamera
local CoreGui = game:GetService("CoreGui")

-- Function to send notification
local function sendNotification(title, text, duration)
    starterGui:SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration;
    })
end




local test = CoreGui:FindFirstChild("VioletVexGUI")
if test then
    test:Destroy()
    sendNotification("Violet Vex", "You are using Violet Vex 1.0", 5)
    else
    sendNotification("Violet Vex", "You are using Violet Vex 1.0", 5)
end

gui = Instance.new("ScreenGui")
gui.Name = "VioletVexGUI"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local RunService = game:GetService("RunService")

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
title.ZIndex = 2 -- Ensure it's on top
title.Parent = topBar

-- Create the title shadow (subtitle)
local subtitle = Instance.new("TextLabel")
subtitle.Size = title.Size
subtitle.Position = UDim2.new(0.02, 3, 0, 3) -- Slight offset to bottom-right
subtitle.BackgroundTransparency = 1
subtitle.Text = title.Text
subtitle.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black shadow
subtitle.Font = title.Font
subtitle.TextScaled = true
subtitle.TextStrokeTransparency = 1 -- No stroke for the shadow
subtitle.ZIndex = 1 -- Render behind the title
subtitle.Parent = topBar -- Shadow must be parented to topBar (not title)




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

local confirm = false
-- Close button deletes everything
closeButton.MouseButton1Click:Connect(function()
    if not confirm then
        sendNotification("Close GUI", "Are you sure? If is then Please turn off everything and click X again", 5)
        confirm = true
        task.wait(5)
        confirm = false
        if not confirm and gui then
            sendNotification("Close GUI", "Closing Cancelled", 2.5)
        end
        else
            sendNotification("Violet Vex", "GUI Deleted", 2)
            if fKeyConnection then
                fKeyConnection:Disconnect() -- Disable the F key toggle
                fKeyConnection = nil

        end
    end
if confirm then
gui:Destroy()
end
end)

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



-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

-- Tracer Variables
local TracerEnabled = false
local Tracers = {}
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

-- Function to create tracers for players
local function CreateTracer(target)
    local line = Drawing.new("Line")
    line.Thickness = 2
    line.Transparency = 1
    line.Visible = false
    Tracers[target] = line
end

-- Function to remove tracers
local function RemoveTracer(target)
    if Tracers[target] then
        Tracers[target]:Remove()
        Tracers[target] = nil
    end
end

-- Function to handle character respawn and death
local function OnCharacterAdded(player, character)
    RemoveTracer(player)

    local rootPart = character:WaitForChild("HumanoidRootPart", 10)
    if rootPart and TracerEnabled then
        CreateTracer(player)
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            RemoveTracer(player)
        end)
    end
end

-- Function to update tracers
local function UpdateTracers()
    if not TracerEnabled then return end

    for target, line in pairs(Tracers) do
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = target.Character.HumanoidRootPart
            local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

            if onScreen then
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
            RemoveTracer(target)
        end
    end
end

-- Function to handle new players
local function HandlePlayer(player)
    if player ~= Players.LocalPlayer then
        player.CharacterAdded:Connect(function(character)
            OnCharacterAdded(player, character)
        end)

        if player.Character then
            OnCharacterAdded(player, player.Character)
        end
    end
end

-- Toggle button event
toggleButton.MouseButton1Click:Connect(function()
    TracerEnabled = not TracerEnabled

    if TracerEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            HandlePlayer(player)
        end

        RunService:BindToRenderStep("UpdatePlayerTracers", Enum.RenderPriority.Camera.Value, UpdateTracers)
        indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green (ON)
    else
        indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (OFF)
        RunService:UnbindFromRenderStep("UpdatePlayerTracers")
        for target in pairs(Tracers) do
            RemoveTracer(target)
        end
        
    end
end)

-- Ensure tracers update when players join or respawn
Players.PlayerAdded:Connect(HandlePlayer)
Players.PlayerRemoving:Connect(RemoveTracer)





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
                textLabel.Text = targetName .. " ┃ " .. math.floor(distance) .. " studs"
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





local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local isLabelEnabled = false  -- Toggle state
local npcModels = {}  -- Table to track NPC models

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

-- Function to create the text label above an NPC's head
local function createLabel(model)
    if not model then return end
    local head = model:FindFirstChild("Head") or model:WaitForChild("Head", 10)
    local hrp = model:FindFirstChild("HumanoidRootPart") or model:WaitForChild("HumanoidRootPart", 10)
    if not head or not hrp then return end

    if head:FindFirstChild("NPCLabel") then return end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = "NPCLabel"
    billboardGui.Adornee = hrp
    billboardGui.Parent = hrp
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
    local hrp = model:FindFirstChild("HumanoidRootPart")
    if head and hrp and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local distance = (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        local targetName = model.Name

        local billboardGui = hrp:FindFirstChild("NPCLabel")
        if billboardGui then
            local textLabel = billboardGui:FindFirstChildOfClass("TextLabel")
            if textLabel then
                local greenValue = math.clamp(255 - (distance * 1.5), 0, 255)
                local labelColor = Color3.fromRGB(255 - greenValue, greenValue, 0)
                textLabel.Text = targetName .. " ┃ " .. math.floor(distance) .. " studs"
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

-- NPC Detection System (Ensures ALL NPCs are detected properly)
local function detectExistingNPCs()
    for _, character in pairs(workspace:GetChildren()) do
        if character:IsA("Model") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and not Players:GetPlayerFromCharacter(character) then
                npcModels[character] = true
                if isLabelEnabled then
                    createLabel(character)
                end
            end
        end
    end
end

local function tryAddNPC(character)
    task.spawn(function()
        if character:IsA("Model") and character:FindFirstChildOfClass("Humanoid") then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and not Players:GetPlayerFromCharacter(character) then
                npcModels[character] = true
                character:WaitForChild("Head", 10)
                character:WaitForChild("HumanoidRootPart", 10)
                if isLabelEnabled then
                    createLabel(character)
                end
            end
        end
    end)
end

detectExistingNPCs()

workspace.ChildAdded:Connect(function(child)
    tryAddNPC(child)
end)

workspace.ChildRemoved:Connect(function(child)
    if npcModels[child] then
        removeLabel(child)
        npcModels[child] = nil
    end
end)

-- Toggle button logic
toggleButton.MouseButton1Click:Connect(function()
    isLabelEnabled = not isLabelEnabled

    if isLabelEnabled then
        indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- ON indicator
        for model, _ in pairs(npcModels) do
            createLabel(model)
        end
    else
        indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- OFF indicator
        for model, _ in pairs(npcModels) do
            removeLabel(model)
        end
    end
end)

-- Update labels every frame using RenderStepped
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
toggleButton.Size = UDim2.new(1, 0, 0, 35)  -- Adjusted size to match your original setup
toggleButton.Position = UDim2.new(0.63, -75, 5.0, -25) -- Centered
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "ESP Players"
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

-- Variables
local toggle = false
local player = game.Players.LocalPlayer
local camera = game.Workspace.CurrentCamera
local highlightCache = {}  -- Cache for player highlights

-- Function to add highlight to a character with dynamic color
local function addHighlightToCharacter(character)
    -- Check if character already has highlight, don't add it again
    if highlightCache[character] then return end
    
    -- Create a highlight for the entire character model
    local highlight = Instance.new("Highlight")
    highlight.Parent = character
    highlight.FillTransparency = 0.5 -- Make it visible with reasonable transparency
    highlight.OutlineTransparency = 0 -- No outline transparency

    -- Cache the highlight for future removal
    highlightCache[character] = highlight
end

-- Function to update the highlight every frame
local function updateHighlightColor(character)
    if character.Parent == nil then return end  -- Ensure character is still in the game
    
    -- Calculate the distance between the character and the camera
    local distance = (camera.CFrame.Position - character.HumanoidRootPart.Position).Magnitude

    -- Use the formula to adjust the fill color based on distance
    local greenValue = math.clamp(255 - (distance * 1.5), 0, 255)
    local labelColor = Color3.fromRGB(255 - greenValue, greenValue, 0) -- Gradient from red to green

    -- Update the highlight fill color
    local highlight = highlightCache[character]
    if highlight then
        highlight.FillColor = labelColor
        
        -- Get the player's team color and set it as the outline color
        local targetPlayer = game.Players:GetPlayerFromCharacter(character)
        if targetPlayer and targetPlayer.Team then
            highlight.OutlineColor = targetPlayer.Team.TeamColor.Color -- Set outline color to the team color
        else
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- Default to white if no team
        end
    end
end

-- Function to remove the highlight from a character
local function removeHighlightFromCharacter(character)
    if highlightCache[character] then
        highlightCache[character]:Destroy()  -- Remove the highlight from the character
        highlightCache[character] = nil
    end
end

-- Function to handle player joining
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait for the character to load fully
        if toggle and player ~= game.Players.LocalPlayer then
            addHighlightToCharacter(character)  -- Add highlight to new player
        end
    end)
end

-- Function to handle player leaving
local function onPlayerRemoving(player)
    if player.Character then
        removeHighlightFromCharacter(player.Character)  -- Remove highlight when player leaves
    end
end

-- Function to handle character respawning
local function onCharacterAdded(character)
    if toggle and player ~= game.Players.LocalPlayer then
        addHighlightToCharacter(character)  -- Add highlight when a player's character respawns
    end
end

-- Toggle functionality directly connected to the button click
toggleButton.MouseButton1Click:Connect(function()
    toggle = not toggle
    indicator.BackgroundColor3 = toggle and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0) -- Green (ON) or Red (OFF)

    -- Add or remove highlights based on the toggle state
    if toggle then
        -- Apply highlights to all players in the game (excluding local player)
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr ~= game.Players.LocalPlayer then
                addHighlightToCharacter(plr.Character)
            end
        end
    else
        -- Remove highlights from all players in the game
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character then
                removeHighlightFromCharacter(plr.Character)
            end
        end
    end
end)

-- Connect events for player joins, leaves, and character respawns
game.Players.PlayerAdded:Connect(onPlayerAdded)
game.Players.PlayerRemoving:Connect(onPlayerRemoving)
player.CharacterAdded:Connect(onCharacterAdded)

-- Ensure highlight is applied if the local player's character already exists
if toggle and player.Character then
    addHighlightToCharacter(player.Character)
end

-- Continuously update highlight colors every frame
game:GetService("RunService").Heartbeat:Connect(function()
    if toggle then
        -- Update highlight colors for all players
        for _, plr in pairs(game.Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                updateHighlightColor(plr.Character)
            end
        end
    end
end)



-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local NPC_Boxes = {} -- Store 2D boxes for NPCs
local NPC_Lines = {} -- Store direction lines
local NPC_FacingLines = {} -- Store NPC facing direction lines
local ESP_Enabled = false
local ConnectionAdded
local ConnectionRemoving

-- UI Components
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(1, 0, 0, 35)
toggleButton.Position = UDim2.new(0.63, -75, 5.85, -25)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
toggleButton.Text = "ESP NPCs"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Sarpanch
toggleButton.TextScaled = true
toggleButton.Parent = visualsLabel
toggleButton.BorderSizePixel = 0

local indicator = Instance.new("Frame")
indicator.Name = "Indicator"
indicator.Size = UDim2.new(0, 20, 0, 20)
indicator.Position = UDim2.new(1, 10, 0.5, -10)
indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Default Red (OFF)
indicator.BorderSizePixel = 2
indicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
indicator.Parent = toggleButton

-- Function to create ESP elements
local function CreateESPElements(model)
    if NPC_Boxes[model] then return end -- Avoid duplicates

    -- Box
    local box = Drawing.new("Square")
    box.Thickness = 2
    box.Color = Color3.fromRGB(0, 255, 0)
    box.Filled = false
    box.Visible = false
    box.OutlineColor = Color3.fromRGB(0, 0, 0)
    box.OutlineTransparency = 0

    -- Direction Line (Unused but can be used for top-down tracking)
    local line = Drawing.new("Line")
    line.Thickness = 2
    line.Color = Color3.fromRGB(255, 0, 0)
    line.Visible = false

    -- Facing Line (Shows NPC's facing direction)
    local facingLine = Drawing.new("Line")
    facingLine.Thickness = 3
    facingLine.Color = Color3.fromRGB(255, 0, 0)
    facingLine.Visible = false

    NPC_Boxes[model] = box
    NPC_Lines[model] = line
    NPC_FacingLines[model] = facingLine

    -- Cleanup ESP when NPC dies
    local humanoid = model:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.Died:Connect(function()
            RemoveESPElements(model)
        end)
    end
end

-- Function to remove ESP elements
local function RemoveESPElements(model)
    if NPC_Boxes[model] then
        NPC_Boxes[model]:Remove()
        NPC_Boxes[model] = nil
    end
    if NPC_Lines[model] then
        NPC_Lines[model]:Remove()
        NPC_Lines[model] = nil
    end
    if NPC_FacingLines[model] then
        NPC_FacingLines[model]:Remove()
        NPC_FacingLines[model] = nil
    end
end

-- Function to update ESP
local function UpdateESP()
    if not ESP_Enabled then return end

    for model, box in pairs(NPC_Boxes) do
        if model and model.Parent and model:FindFirstChild("HumanoidRootPart") then
            local rootPart = model.HumanoidRootPart
            local head = model:FindFirstChild("Head") or rootPart
            local humanoid = model:FindFirstChildOfClass("Humanoid")

            if humanoid then
                -- Define NPC bounding box
                local boundingBoxCorners = {
                    Vector3.new(-2, 3, -1),
                    Vector3.new(2, 3, -1),
                    Vector3.new(-2, -3, -1),
                    Vector3.new(2, -3, -1),
                    Vector3.new(-2, 3, 1),
                    Vector3.new(2, 3, 1),
                    Vector3.new(-2, -3, 1),
                    Vector3.new(2, -3, 1)
                }

                local minX, minY = math.huge, math.huge
                local maxX, maxY = -math.huge, -math.huge
                local onScreen = false

                for _, corner in ipairs(boundingBoxCorners) do
                    local worldPos = rootPart.CFrame:PointToWorldSpace(corner)
                    local screenPos, isOnScreen = Camera:WorldToViewportPoint(worldPos)
                    if isOnScreen then
                        onScreen = true
                        minX = math.min(minX, screenPos.X)
                        minY = math.min(minY, screenPos.Y)
                        maxX = math.max(maxX, screenPos.X)
                        maxY = math.max(maxY, screenPos.Y)
                    end
                end

                if onScreen then
                    box.Visible = true
                    box.Size = Vector2.new(maxX - minX, maxY - minY)
                    box.Position = Vector2.new(minX, minY)
                else
                    box.Visible = false
                end

                -- Update facing direction line
                local startPos = head.Position
                local endPos = startPos + (head.CFrame.LookVector * 2) -- Extend 10 studs in front
                local screenStart, isStartOnScreen = Camera:WorldToViewportPoint(startPos)
                local screenEnd, isEndOnScreen = Camera:WorldToViewportPoint(endPos)

                if isStartOnScreen and isEndOnScreen then
                    NPC_FacingLines[model].Visible = true
                    NPC_FacingLines[model].From = Vector2.new(screenStart.X, screenStart.Y)
                    NPC_FacingLines[model].To = Vector2.new(screenEnd.X, screenEnd.Y)
                else
                    NPC_FacingLines[model].Visible = false
                end
            end
        else
            RemoveESPElements(model)
        end
    end
end

-- Function to handle NPC tracking
local function OnDescendantAdded(descendant)
    if not ESP_Enabled then return end
    if descendant:IsA("Humanoid") then
        local character = descendant.Parent
        if character and not Players:GetPlayerFromCharacter(character) then
            CreateESPElements(character)
        end
    end
end

local function OnDescendantRemoving(descendant)
    if descendant:IsA("Humanoid") then
        local character = descendant.Parent
        RemoveESPElements(character)
    end
end

-- Toggle ESP function
local function ToggleESP()
    ESP_Enabled = not ESP_Enabled

    if ESP_Enabled then
        -- Enable ESP
        for _, descendant in ipairs(workspace:GetDescendants()) do
            if descendant:IsA("Humanoid") then
                local character = descendant.Parent
                if character and not Players:GetPlayerFromCharacter(character) then
                    CreateESPElements(character)
                end
            end
        end

        -- Connect events
        ConnectionAdded = workspace.DescendantAdded:Connect(OnDescendantAdded)
        ConnectionRemoving = workspace.DescendantRemoving:Connect(OnDescendantRemoving)

        -- Start updating ESP
        RunService:BindToRenderStep("UpdateNPCESP", Enum.RenderPriority.Camera.Value, UpdateESP)
    else
        -- Disable ESP
        RunService:UnbindFromRenderStep("UpdateNPCESP")

        -- Disconnect events
        if ConnectionAdded then ConnectionAdded:Disconnect() end
        if ConnectionRemoving then ConnectionRemoving:Disconnect() end

        -- Remove all ESP elements
        for model in pairs(NPC_Boxes) do
            RemoveESPElements(model)
        end
    end
end

local esptoggle = false
-- Connect button to toggle ESP
toggleButton.MouseButton1Click:Connect(function()
    esptoggle = not esptoggle
    ToggleESP()
    if esptoggle then
        indicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    end
end)









-- Services
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- UI Components
local fullbrightButton = Instance.new("TextButton")
fullbrightButton.Name = "FullbrightButton"
fullbrightButton.Size = UDim2.new(1, 0, 0, 35)
fullbrightButton.Position = UDim2.new(0.63, -75, 6.65, -25) -- Adjusted position
fullbrightButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
fullbrightButton.Text = "Fullbright"
fullbrightButton.TextColor3 = Color3.fromRGB(255, 255, 255)
fullbrightButton.Font = Enum.Font.Sarpanch
fullbrightButton.TextScaled = true
fullbrightButton.Parent = visualsLabel
fullbrightButton.BorderSizePixel = 0

local fullbrightIndicator = Instance.new("Frame")
fullbrightIndicator.Name = "FullbrightIndicator"
fullbrightIndicator.Size = UDim2.new(0, 20, 0, 20)
fullbrightIndicator.Position = UDim2.new(1, 10, 0.5, -10)
fullbrightIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Default red (off)
fullbrightIndicator.BorderSizePixel = 2
fullbrightIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
fullbrightIndicator.Parent = fullbrightButton

-- Variables
local fullbrightEnabled = false
local fullbrightConnection
local saveAmbient
local saveOutdoorAmbient
local saveBrightness
local saveExposure

-- save settings
local function saveSettings()
    saveAmbient = Lighting.Ambient
    saveOutdoorAmbient = Lighting.OutdoorAmbient
    saveBrightness = Lighting.Brightness
    saveExposure = Lighting.ExposureCompensation
end

-- Fullbright Functions
local function applyFullbright()
    Lighting.Ambient = Color3.new(0.7, 0.7, 0.7)  -- Softer ambient light
    Lighting.OutdoorAmbient = Color3.new(0.7, 0.7, 0.7)  -- Softer outdoor light
    Lighting.Brightness = 3  -- Reduced brightness
    Lighting.ExposureCompensation = 0.5  -- Prevents overexposure
end

local function removeFullbright()
    Lighting.Ambient = saveAmbient
    Lighting.OutdoorAmbient = saveOutdoorAmbient
    Lighting.Brightness = saveBrightness
    Lighting.ExposureCompensation = saveExposure
end


local function checkFullbright()
    if fullbrightEnabled then
        if Lighting.Ambient ~= Color3.new(0.7, 0.7, 0.7) or 
           Lighting.OutdoorAmbient ~= Color3.new(0.7, 0.7, 0.7) or
           Lighting.Brightness ~= 3 or
           Lighting.ExposureCompensation ~= 0.5 then
            applyFullbright() -- Reapply if the game removes fullbright
        end
    end
end

local function updateFullbrightIndicator()
    if fullbrightEnabled then
        fullbrightIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green (on)
    else
        fullbrightIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (off)
    end
end

local function toggleFullbright()
    fullbrightEnabled = not fullbrightEnabled
    updateFullbrightIndicator()

    if fullbrightEnabled then
        applyFullbright()
        if not fullbrightConnection then
            fullbrightConnection = RunService.RenderStepped:Connect(checkFullbright) -- Constantly checks if fullbright is removed
        end
    else
        removeFullbright()
        if fullbrightConnection then
            fullbrightConnection:Disconnect()
            fullbrightConnection = nil
        end
    end
end

-- Connect Toggle Button
fullbrightButton.MouseButton1Click:Connect(toggleFullbright)

-- Ensure indicator updates at the start
updateFullbrightIndicator()







-- Services
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

-- UI Components
local noFogButton = Instance.new("TextButton")
noFogButton.Name = "NoFogButton"
noFogButton.Size = UDim2.new(1, 0, 0, 35)
noFogButton.Position = UDim2.new(0.63, -75, 7.45, -25) -- Adjusted position
noFogButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100)
noFogButton.Text = "NoFog"
noFogButton.TextColor3 = Color3.fromRGB(255, 255, 255)
noFogButton.Font = Enum.Font.Sarpanch
noFogButton.TextScaled = true
noFogButton.Parent = visualsLabel
noFogButton.BorderSizePixel = 0

local fogIndicator = Instance.new("Frame")
fogIndicator.Name = "FogIndicator"
fogIndicator.Size = UDim2.new(0, 20, 0, 20)
fogIndicator.Position = UDim2.new(1, 10, 0.5, -10)
fogIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Default red (off)
fogIndicator.BorderSizePixel = 2
fogIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
fogIndicator.Parent = noFogButton

-- Variables
local noFogEnabled = false
local noFogConnection
local savedFogStart
local savedFogEnd
local hasSavedFog = false -- Track if fog has been saved

-- NoFog Functions
local function removeFog()
    print("Removing fog...") -- Debug message
    Lighting.FogStart = 1e6
    Lighting.FogEnd = 1e6
    print("FogStart set to:", Lighting.FogStart, "FogEnd set to:", Lighting.FogEnd)
end

local function restoreFog()
    if hasSavedFog then
        Lighting.FogStart = savedFogStart
        Lighting.FogEnd = savedFogEnd
        print("Restoring fog: Start =", savedFogStart, "End =", savedFogEnd)
    else
        print("No saved fog settings to restore!")
    end
end

local function checkNoFog()
    if noFogEnabled and (Lighting.FogEnd < 1e6 or Lighting.FogStart < 1e6) then
        print("Reapplying NoFog...")
        removeFog()  -- Reapply NoFog if the game tries to add fog back
    end
end

local function updateFogIndicator()
    fogIndicator.BackgroundColor3 = noFogEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end

local function toggleNoFog()
    noFogEnabled = not noFogEnabled
    updateFogIndicator()

    if noFogEnabled then
        -- Only save fog settings if they haven't been saved yet
        if not hasSavedFog then
            savedFogStart = Lighting.FogStart
            savedFogEnd = Lighting.FogEnd
            hasSavedFog = true
            print("Saved fog settings: Start =", savedFogStart, "End =", savedFogEnd)
        end

        removeFog()

        -- Continuously ensure fog is off
        if not noFogConnection then
            noFogConnection = RunService.RenderStepped:Connect(checkNoFog)
        end
    else
        restoreFog()

        -- Stop checking fog settings
        if noFogConnection then
            noFogConnection:Disconnect()
            noFogConnection = nil
        end
    end
end

-- Connect Toggle Button
noFogButton.MouseButton1Click:Connect(toggleNoFog)

-- Ensure indicator updates at the start
updateFogIndicator()


-- Create Toggle Button
local traceButton = Instance.new("TextButton")
traceButton.Name = "TraceToggleButton"
traceButton.Size = UDim2.new(0, 100, 0, 40) -- Adjust size as needed
traceButton.Position = UDim2.new(0.63, -75, 7.45, -25) -- Centered
traceButton.BackgroundColor3 = Color3.fromRGB(50, 0, 100) -- Default Button Color
traceButton.Text = "Trace"
traceButton.TextColor3 = Color3.fromRGB(255, 255, 255)
traceButton.Font = Enum.Font.Sarpanch
traceButton.TextScaled = true
traceButton.Parent = gui
traceButton.BorderSizePixel = 0

-- Create Indicator
local traceIndicator = Instance.new("Frame")
traceIndicator.Name = "TraceIndicator"
traceIndicator.Size = UDim2.new(0, 20, 0, 20)
traceIndicator.Position = UDim2.new(1, 10, 0.5, -10) -- Next to button
traceIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Default Red (Off)
traceIndicator.BorderSizePixel = 2
traceIndicator.BorderColor3 = Color3.fromRGB(0, 0, 0)
traceIndicator.Parent = traceButton

-- Variable
local traceactive = false

-- Function to Toggle
local function toggleTrace()
    traceactive = not traceactive -- Toggle value

    if traceactive then
        traceIndicator.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green (On)
    else
        traceIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red (Off)
    end
end

-- Connect Button Click
traceButton.MouseButton1Click:Connect(toggleTrace)

































local userInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local isVisible = true

local function sendNotification(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = duration;
    })
end

local function toggleGUI()
    if not gui then return end -- Ensure GUI exists
    isVisible = not isVisible
    gui.Enabled = isVisible

    sendNotification("Violet Vex", isVisible and "GUI Unhidden" or "GUI Hidden", 2)
end

-- Listen for the F key press (Only Local Player)
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end -- Ignore if the game already handled the input
    if input.KeyCode == Enum.KeyCode.F then
        toggleGUI()
    end
end)


