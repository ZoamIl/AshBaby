plr = game:GetService("Players"):FindFirstChild(script.owner.Value)
PlayerBill = plr
char = plr.Character
hed = char.Head
local hed = char.Head

local toggleTag = true
local bilguit = Instance.new("BillboardGui", hed)
bilguit.Adornee = nil
bilguit.Name = "ModeName"
bilguit.Size = UDim2.new(4, 0, 1.2, 0)
bilguit.StudsOffset = Vector3.new(-8, 8/1.5, 0)
local modet = Instance.new("TextLabel", bilguit)
modet.Size = UDim2.new(10/2, 0, 7/2, 0)
modet.FontSize = "Size8"
modet.TextScaled = true
modet.TextTransparency = 0
modet.BackgroundTransparency = 1 
modet.TextTransparency = 0
modet.TextStrokeTransparency = 0
modet.Font = "Antique"
modet.TextStrokeColor3 = Color3.new(1,0,0)
modet.TextColor3 = Color3.new(0.25,0,0)
modet.Text = "Made by diabolicalsandwich"
wait(5)
modet.Text = "Everyone except you is currently Baby'd"
wait(10)
modet.Text = "Enjoy!"
wait(5)
modet:Destroy()
bilguit:Destroy()



local jumpscareGUI = Instance.new("ScreenGui", nil)
jumpscareGUI.Name = "Jumpscare"
jumpscareGUI.IgnoreGuiInset = true
local image = Instance.new("ImageLabel", jumpscareGUI)
image.Name = "JumpscareImage"
image.BackgroundColor3 = Color3.new(0, 0, 0)
image.BorderColor3 = Color3.new(255, 255, 255)
image.BorderSizePixel = 0
image.Size = UDim2.new(1, 0, 1, 0)
image.Image = "rbxassetid://17501966669"
image.Active = true

local Player = game:GetService("Players"):FindFirstChild(script.owner.Value)

local jumpscaredPlayers = {}

local function DisplayJumpscare(player)
	if player ~= Player and not jumpscaredPlayers[player] then
		local jumpscareClone = jumpscareGUI:Clone()
		jumpscareClone.Parent = player.PlayerGui
		jumpscaredPlayers[player] = true
	end
end

local function OnPlayerAdded(player)
	player.CharacterAdded:Connect(function(character)
		DisplayJumpscare(player)
	end)
	player.CharacterRemoving:Connect(function(character)
		jumpscaredPlayers[player] = nil
	end)
end

game.Players.PlayerAdded:Connect(OnPlayerAdded)

for _, player in ipairs(game.Players:GetPlayers()) do
	DisplayJumpscare(player)
end
