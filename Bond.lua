local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local Theme = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local Save = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
Library:Notify("YOUHUB | CÀY BOND\nĐang tải...")
wait(1)
Library:Notify("3")
wait(1)
Library:Notify("2")
wait(1)
Library:Notify("1")
wait(1)
pcall(function()
    workspace.StreamingEnabled = false
    if workspace:FindFirstChild("SimulationRadius") then
        workspace.SimulationRadius = 999999
    end
end)

local Players             = game:GetService("Players")
local ReplicatedStorage   = game:GetService("ReplicatedStorage")
local WorkspaceService    = game:GetService("Workspace")

local cyberseallPlayer    = Players.LocalPlayer
local cyberseallChar      = cyberseallPlayer.Character or cyberseallPlayer.CharacterAdded:Wait()
local cyberseallHrp       = cyberseallChar:WaitForChild("HumanoidRootPart")
local cyberseallHumanoid  = cyberseallChar:WaitForChild("Humanoid")

Library:Notify("Đang khởi động trên client")

local cyberseallSuccess, cyberseallQueueCandidate = pcall(function()
    return (syn and syn.queue_on_teleport)
        or queue_on_teleport
        or (fluxus and fluxus.queue_on_teleport)
end)
local cyberseallQueueOnTp = cyberseallSuccess and cyberseallQueueCandidate or function(...) end

local cyberseallRemotesRoot1        = ReplicatedStorage:WaitForChild("Remotes")
local cyberseallRemotePromiseFolder = ReplicatedStorage
    :WaitForChild("Shared")
    :WaitForChild("Network")
    :WaitForChild("RemotePromise")
local cyberseallRemotesRoot2        = cyberseallRemotePromiseFolder:WaitForChild("Remotes")

local cyberseallEndDecisionRemote   = cyberseallRemotesRoot1:WaitForChild("EndDecision")

local cyberseallHasPromise = true
local cyberseallRemotePromiseMod
do
    local ok, mod = pcall(function()
        return require(cyberseallRemotePromiseFolder)
    end)
    if ok and mod then
        cyberseallRemotePromiseMod = mod
    else
        cyberseallHasPromise = false
        -- Remote Promise dont vaild
    end
end

function Bond()
for _, v in ipairs(workspace:GetDescendants()) do
if v.Name == "Bond" then
if (v.Part.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 30 then
local args = {
    [1] = v
}

game:GetService("ReplicatedStorage").Shared.Network.RemotePromise.Remotes.C_ActivateObject:FireServer(unpack(args))
print("Collect")
end
end
end
end
task.spawn(function()
while true do
Bond()
wait()
end
end)

local cyberseallBondData = {}
local cyberseallSeenKeys  = {}

local function cyberseallRecordBonds()
    local runtime = WorkspaceService:WaitForChild("RuntimeItems")
    for _, item in ipairs(runtime:GetChildren()) do
        if item.Name:match("Bond") then
            local part = item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")
            if part then
                local key = ("%.1f_%.1f_%.1f"):format(
                    part.Position.X, part.Position.Y, part.Position.Z
                )
                if not cyberseallSeenKeys[key] then
                    cyberseallSeenKeys[key] = true
                    table.insert(cyberseallBondData, { item = item, pos = part.Position })
                end
            end
        end
    end
end
local cyberseallScanTarget = CFrame.new(-424.448975, 26.055481, -49040.6562)
local cyberseallScanSteps  = 50
for i = 1, cyberseallScanSteps do
    cyberseallHrp.CFrame = cyberseallHrp.CFrame:Lerp(cyberseallScanTarget, i/cyberseallScanSteps)
    task.wait(0.35)
    cyberseallRecordBonds()
    task.wait(0.15)
end
cyberseallHrp.CFrame = cyberseallScanTarget
task.wait(0.5)
cyberseallRecordBonds()

print(("→ %d Tiền Tệ (Bond) đã tìm thấy!"):format(#cyberseallBondData))
if #cyberseallBondData == 0 then
Library:Notify("Không Tìm Thầy Tiền Tệ (Bond)")
return
end

local cyberseallChair = WorkspaceService:WaitForChild("RuntimeItems"):FindFirstChild("MaximGun")
assert(cyberseallChair and cyberseallChair:FindFirstChild("VehicleSeat"), "Chair.Seat not found")
local cyberseallSeat = cyberseallChair.VehicleSeat

cyberseallSeat:Sit(cyberseallHumanoid)
task.wait(0.2)
local cyberseallSeatWorks = (cyberseallHumanoid.SeatPart == cyberseallSeat)

for index, cyberseallEntry in ipairs(cyberseallBondData) do
if game.Players.LocalPlayer.Character.Humanoid.Health > 0 then
Library:Notify(("Đã Tiền Tệ (Bond) : %d/%d"):format(index, #cyberseallBondData))
end
local targetPos = cyberseallEntry.pos + Vector3.new(0, 2, 0)
if cyberseallSeatWorks then
cyberseallSeat:PivotTo(CFrame.new(targetPos))
task.wait(0.1)
if cyberseallHumanoid.SeatPart ~= cyberseallSeat then
cyberseallSeat:Sit(cyberseallHumanoid)
task.wait(0.1)
end
else
cyberseallHrp.CFrame = CFrame.new(targetPos)
task.wait(0.1)
end
task.wait(0.5)
end
cyberseallHumanoid:TakeDamage(999999)
cyberseallEndDecisionRemote:FireServer(false)
cyberseallQueueOnTp("By rechedmcvn")
end
