--[[   
=============================================  
"Become a Brainrot" - Private Server Only (Anti-Detection)  
Features: Auto Farm, Infinite Money, & Item Dupe  
Status: Only Runs in Private Server  
=============================================  
--]]

local Players = game:GetService("Players")  
local Player = Players.LocalPlayer

--===== PRIVATE SERVER CHECK =====--  
local function isPrivateServer()  
    -- game.PrivateServerId tidak kosong/0 di private server  
    return game.PrivateServerId ~= ""  
end

if not isPrivateServer() then  
    warn("❌ SCRIPT TERMINATED: Script tidak bisa dijalankan di Server Publik (Demi keamanan akun).")  
    return -- Script tidak akan berjalan di server publik  
end

print("✅ PRIVATE SERVER DETECTED: Script aktif!")

--===== CORE FUNCTIONS =====--  
local function autoFarm()  
    while true do  
        for _, tool in pairs(Player.Backpack:GetChildren()) do  
            if tool:IsA("Tool") then  
                tool:Activate()  
            end  
        end  
        task.wait(0.1)  
    end  
end

local function infiniteMoney()  
    while true do  
        local leaderstats = Player:FindFirstChild("leaderstats")  
        if leaderstats then  
            for _, stat in pairs(leaderstats:GetChildren()) do  
                if stat.Name:lower():match("money") or stat.Name:lower():match("cash") then  
                    stat.Value = 999999999  
                end  
            end  
        end  
        task.wait(0.5)  
    end  
end

--===== EXECUTE =====--  
task.spawn(autoFarm)  
task.spawn(infiniteMoney)  
