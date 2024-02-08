-- nome
Nome = "óculos vr"

-- versão
Versao = '1.0'

-- by
Dono = " Kelvin"

-- tema
theme = "https://raw.githubusercontent.com/porrinha09/Better-Admin/main/Temas/gifhub%20dark.lua"

local OrionLib = loadstring(game:HttpGet(theme))()
local Window = OrionLib:MakeWindow({Name = "óculos vr - v" .. Versao, HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

wait(1)
-- api load
loadstring(game:HttpGet("https://raw.githubusercontent.com/porrinha09/Better-Admin/main/Load%20Api.lua",true))()

-- códigos
local player = game.Players.LocalPlayer
local name = player.DisplayName

local mapa = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local music1
local music

-- tabs
local Tab = Window:MakeTab({
	Name = "início",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddLabel("bem vindo: " .. name)
Tab:AddLabel("jogo: " .. mapa)
local Section = Tab:AddSection({
	Name = "by:" .. Dono
})

local Tab = Window:MakeTab({
    Name = "Music",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddLabel("custom music")
Tab:AddTextbox({
    Name = "id music",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        if not music1 then
            music1 = Instance.new("Sound")
            music1.Volume = 20
            music1.Looped = true
            music1.Parent = game.Workspace
        end
        
        music1.SoundId = "rbxassetid://" .. tonumber(Value)
        music1:Play()
    end
})
Tab:AddButton({
    Name = "Stop",
    Callback = function()
        if music1 then
            music1:Stop()
        end
    end
})
Tab:AddLabel("Blood pop")
Tab:AddTextbox({
    Name = "Volume",
    Default = "5",
    TextDisappear = false,
    Callback = function(Value)
        if not music then
            music = Instance.new("Sound")
            music.SoundId = "rbxassetid://6783714255" 
            music.Looped = true
            music.Parent = game.Workspace
        end
        
        music.Volume = tonumber(Value) 
        music:Play()
    end
})
Tab:AddButton({
    Name = "Stop",
    Callback = function()
        if music then
            music:Stop()
        end
    end
})
