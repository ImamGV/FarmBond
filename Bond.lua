local repo = 'https://raw.githubusercontent.com/mstudio45/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local Theme = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local Save = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
Library:Notify("YOUHUB | CÀY TRÁI PHIẾU (BOND)\nĐang tải dữ liệu...")
wait(0.5)
Library:Notify("<font color='rgb(255,255,0)'>(OWNER) :</font>\n<font color='rgb(255,0,0)'>[YOUTUBER] : </font><font color='rgb(0,255,50)'>rechedmcvn (tạo dịch chuyển và bay) (create tp and tween fly)</font>\n<font color='rgb(255,0,255)'>[OTHER] : </font><font color='rgb(0,255,50)'>deivid_gv (tạo bypass tốc độ và bypass bay) (create bypass speed and bypass fly)</font>\n<font color='rgb(200,100,50)'>(YOUTUBER REVIEW) :</font>\n<font color='rgb(255,0,0)'>Không tìm thấy! (No found!)</font>", 10)
wait(0.5)
Library:Notify("Script credits by:\n(OWNER)[YT] rechedmcvn : làm bay và dịch chuyển\n(OWNER) Amngu : làm bypass bay và tốc độ")
wait(0.5)
Library:Notify("[BETA] Phiên bản : v0.0.1")
for _,v in ipairs(workspace:GetDescendants()) do
if v.Parent.Name == "ConductorSeat" and v.Name == "VehicleSeat" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
end
end
wait(1)
local Char = game.Players.LocalPlayer.Character
	local Cam = workspace.CurrentCamera
	local Pos = Cam.CFrame
	local Human = Char and Char.FindFirstChildWhichIsA(Char, "Humanoid")
	local nHuman = Human.Clone(Human)
	nHuman.Parent = Char, nil
	nHuman.SetStateEnabled(nHuman, 15, false)
	nHuman.SetStateEnabled(nHuman, 1, false)
	nHuman.SetStateEnabled(nHuman, 0, false)
	nHuman.BreakJointsOnDeath, Human = true, Human.Destroy(Human)
nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
local Script = Char.FindFirstChild(Char, "Animate")
if Script then
Script.Disabled = true
wait()
Script.Disabled = false
end
nHuman.Health = nHuman.MaxHealth
spawn(function()
while true do
workspace.StreamingEnabled = false
if workspace:FindFirstChild("SimulationRadius") then
workspace.SimulationRadius = 999999
end
wait()
end
end)
local part = Instance.new("Part", workspace)
part.Anchored = true
part.Material = "Neon"
part.Transparency = 1
part.Size = Vector3.new(1000,0.1,1000)
wait(1)
function Tween(Pos)
Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
if game.Players.LocalPlayer.Character.Humanoid.Sit == true then game.Players.LocalPlayer.Character.Humanoid.Sit = false end
pcall(function() tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/1500, Enum.EasingStyle.Linear),{CFrame = Pos}) end)
tween:Play()
TweenPart = true
spawn(function()
while TweenPart do
part.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y + 0.25, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
wait()
end
end)
if Distance <= 50 then
tween:Cancel()
TweenPart = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
end
wait()
if workspace.RuntimeItems:FindFirstChild("Bond") then
tween:Cancel()
end
end
function Bond()
for _, v in ipairs(workspace.RuntimeItems:GetChildren()) do
if workspace.RuntimeItems:FindFirstChild("Bond") and v.Name == "Bond" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Part.Position.X, v.Part.Position.Y + 3, v.Part.Position.Z)
if (v:FindFirstChild("Part").Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 25 then
local args = {[1] = v}
game:GetService("ReplicatedStorage").Shared.Network.RemotePromise.Remotes.C_ActivateObject:FireServer(unpack(args))
end
end
end
end
game:GetService("RunService").RenderStepped:Connect(function()
Bond()
end)
game:GetService("RunService").RenderStepped:Connect(function()
if not workspace.RuntimeItems:FindFirstChild("Bond") and (CFrame.new(-381.3519287109375, -48.02812194824219, -49156.0546875).Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 50 then
Tween(CFrame.new(-381.3519287109375, -48.02812194824219, -49156.0546875))
wait()
end
end)
game:GetService("RunService").RenderStepped:Connect(function()
local args = {[1] = false}
game:GetService("ReplicatedStorage").Remotes.EndDecision:FireServer(unpack(args))
end)

