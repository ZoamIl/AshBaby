local meme = {}

function meme.Baby(player)
	local Players = game:GetService("Players")
	local Me = Players:FindFirstChild(player)
	script.JumpScript.owner.Value = player
	script.JumpScript:Clone().Parent = Me.Character
end
return meme
