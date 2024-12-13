if game.PlaceId == 90203403792474 then
local StarterGui = game:GetService("StarterGui")

if not game:IsLoaded() then
    StarterGui:SetCore("SendNotification", {
        Title = "Please Wait a While";
        Text = "Loading Script...";
        Duration = 5;
    })
end

repeat task.wait() until game:IsLoaded()


local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "r4mpage"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 120)
frame.Position = UDim2.new(0.5, 0, -0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0

local uiCorner = Instance.new("UICorner", frame)
uiCorner.CornerRadius = UDim.new(0, 15)

local uiStroke = Instance.new("UIStroke", frame)
uiStroke.Thickness = 3
uiStroke.Color = Color3.fromRGB(0, 85, 255)

local title = Instance.new("TextLabel", frame)
title.Text = "Youtube: r4mpage"
title.Size = UDim2.new(1, -20, 0.4, -10)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextXAlignment = Enum.TextXAlignment.Center

local copyLabel = Instance.new("TextLabel", frame)
copyLabel.Text = "Youtube Channel Copied to Clipboard"
copyLabel.Size = UDim2.new(1, -20, 0.4, -10)
copyLabel.Position = UDim2.new(0, 10, 0.5, 0)
copyLabel.BackgroundTransparency = 1
copyLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
copyLabel.Font = Enum.Font.Gotham
copyLabel.TextSize = 18
copyLabel.TextXAlignment = Enum.TextXAlignment.Center
copyLabel.TextTransparency = 1

local glow = Instance.new("ImageLabel", frame)
glow.Size = UDim2.new(1.5, 0, 3, 0)
glow.Position = UDim2.new(-0.25, 0, -1, 0)
glow.BackgroundTransparency = 1
glow.Image = "rbxassetid://468115116"
glow.ImageColor3 = Color3.fromRGB(0, 85, 255)
glow.ImageTransparency = 0.7

local function showNotification()
    frame:TweenPosition(
        UDim2.new(0.5, 0, 0.4, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quint,
        0.8,
        true
    )
    task.wait(1)

    local fadeTween = TweenService:Create(copyLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0})
    fadeTween:Play()

    for _ = 1, 3 do
        local glowTween = TweenService:Create(glow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.4})
        glowTween:Play()
        glowTween.Completed:Wait()
        glowTween = TweenService:Create(glow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.7})
        glowTween:Play()
        glowTween.Completed:Wait()
    end

    task.wait(2)
    frame:TweenPosition(
        UDim2.new(0.5, 0, -0.5, 0),
        Enum.EasingDirection.In,
        Enum.EasingStyle.Quint,
        0.8,
        true
    )
    task.wait(0.7)
    gui:Destroy()
end

showNotification()
setclipboard("https://www.youtube.com/@GetScriptFromRampage")

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/r4mpage4/LIBRARY/refs/heads/main/r4mpage4"))()

local w = Library:Window("Boba Tycoon")

w:Toggle("Auto Tycoon", function(enabled)
    getgenv().VP = enabled
    if enabled then
        while getgenv().VP do
            task.wait(0.1)
            
            local player = game.Players.LocalPlayer
            if not player.Character then
                player.CharacterAdded:Wait()
            end
            
            local character = player.Character
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local tycoonKit = workspace["Twin's Tycoon Kit 3.0"].Tycoons

            local function teleportToAvailableHolograms(parent)
                for _, child in pairs(parent:GetChildren()) do
                    if child:IsA("BasePart") and child.Name == "Hologram" and child.Transparency < 1 then
                        humanoidRootPart.CFrame = child.CFrame
                        task.wait(0.5)
                    elseif child:IsA("Folder") or child:IsA("Model") then
                        teleportToAvailableHolograms(child)
                    end
                end
            end

            for _, tycoon in pairs(tycoonKit:GetChildren()) do
                if tycoon:FindFirstChild("Owner") and tycoon.Owner.Value == player then
                    if tycoon:FindFirstChild("Buttons") then
                        teleportToAvailableHolograms(tycoon.Buttons)
                    end
                end
            end
        end
    end
end)

w:Toggle("Infinite Cash", function(P)
    if P == true then
        getgenv().P = true
        while getgenv().P do
            wait(0.1)
 local replicatedStorage = game:GetService("ReplicatedStorage")
local rewardEvent = replicatedStorage:WaitForChild("RewardEvent")


for i = 1, 15 do
    local args = {
        [1] = i
    }
    rewardEvent:FireServer(unpack(args))
end
        end
    elseif P == false then
        getgenv().P = false
    end
end)

w:Button("Anti AFK", function()
    local VirtualUser = game:GetService("VirtualUser")
    player.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.zero, workspace.CurrentCamera.CFrame)
    end) 
end)
end