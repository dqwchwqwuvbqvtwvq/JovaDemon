local enableHD = getgenv().hd or false
local enableFont = getgenv().font or false

if enableHD then
    local Lighting = game:GetService("Lighting")
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then
            v:Destroy()
        end
    end
    Lighting.Brightness = 4
    Lighting.GlobalShadows = true
    Lighting.EnvironmentDiffuseScale = 1
    Lighting.EnvironmentSpecularScale = 1
    Lighting.Ambient = Color3.fromRGB(100, 100, 100)
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    Lighting.ClockTime = 14

    local Atmos = Instance.new("Atmosphere")
    Atmos.Density = 0.3
    Atmos.Offset = 0.25
    Atmos.Glare = 0.3
    Atmos.Haze = 1
    Atmos.Color = Color3.fromRGB(200, 200, 220)
    Atmos.Decay = Color3.fromRGB(90, 100, 120)
    Atmos.Parent = Lighting

    local Sky = Instance.new("Sky")
    Sky.SkyboxBk = "rbxassetid://7018684000"
    Sky.SkyboxDn = "rbxassetid://7018684000"
    Sky.SkyboxFt = "rbxassetid://7018684000"
    Sky.SkyboxLf = "rbxassetid://7018684000"
    Sky.SkyboxRt = "rbxassetid://7018684000"
    Sky.SkyboxUp = "rbxassetid://7018684000"
    Sky.SunAngularSize = 11
    Sky.MoonAngularSize = 8
    Sky.Parent = Lighting

    local Bloom = Instance.new("BloomEffect")
    Bloom.Intensity = 0.8
    Bloom.Size = 30
    Bloom.Threshold = 1
    Bloom.Parent = Lighting

    local SunRays = Instance.new("SunRaysEffect")
    SunRays.Intensity = 0.25
    SunRays.Spread = 1
    SunRays.Parent = Lighting

    local ColorCorrection = Instance.new("ColorCorrectionEffect")
    ColorCorrection.Saturation = 0.35
    ColorCorrection.Contrast = 0.3
    ColorCorrection.Brightness = 0.1
    ColorCorrection.TintColor = Color3.fromRGB(240, 240, 255)
    ColorCorrection.Parent = Lighting

    local DoF = Instance.new("DepthOfFieldEffect")
    DoF.FarIntensity = 0.4
    DoF.FocusDistance = 25
    DoF.InFocusRadius = 20
    DoF.NearIntensity = 0.75
    DoF.Parent = Lighting

    print("Ultra HD Map Activated - By Jova")
end

if enableFont then
    local player = game.Players.LocalPlayer
    if not player then return end
    local guiRoot = player:WaitForChild("PlayerGui", 5)
    if not guiRoot then
        warn("PlayerGui not found, Font Enhancer failed.")
    else
        local function applyArcade(obj)
            if obj:IsA("TextLabel") or obj:IsA("TextButton") then
                obj.Font = Enum.Font.Arcade
                obj.TextColor3 = Color3.fromRGB(255, 255, 255)
            end
        end

        for _, obj in pairs(guiRoot:GetDescendants()) do
            applyArcade(obj)
        end

        guiRoot.DescendantAdded:Connect(applyArcade)

        local gui = Instance.new("ScreenGui")
        gui.IgnoreGuiInset = true
        gui.Parent = guiRoot

        local box = Instance.new("Frame", gui)
        box.AnchorPoint = Vector2.new(1, 0)
        box.Position = UDim2.new(1, -10, 0, 10)
        box.Size = UDim2.new(0, 260, 0, 40)
        box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        box.BackgroundTransparency = 0.2
        box.BorderSizePixel = 0

        local watermark = Instance.new("TextLabel", box)
        watermark.Size = UDim2.new(1, -10, 1, 0)
        watermark.Position = UDim2.new(0, 5, 0, 0)
        watermark.BackgroundTransparency = 1
        watermark.Text = "Font Active - Made by Jova"
        watermark.TextSize = 20
        watermark.Font = Enum.Font.Arcade
        watermark.TextColor3 = Color3.fromRGB(255, 255, 255)

        task.delay(3, function()
            box:Destroy()
        end)

        print("Font Enhancer Activated (Arcade) - By Jova")
    end
end
