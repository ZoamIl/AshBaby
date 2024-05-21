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




--I'm too lazy to find out if the localscript or the script is doing the jumpscare work so I just put both for laziness measures.
