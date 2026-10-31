const Players = game:GetService("Players")
const ReplicatedStorage = game:GetService("ReplicatedStorage")

const Assets = ReplicatedStorage:WaitForChild("Assets") :: Folder
const PlayerPills = Assets.PlayerPills :: Folder & { PlayerHitbox: MeshPart & { Description: StringValue }, QueryHitbox: MeshPart & { Description: StringValue } }

local NewPlayerHitbox = PlayerPills.PlayerHitbox:Clone()
NewPlayerHitbox.Parent = workspace
NewPlayerHitbox.CanCollide = false
NewPlayerHitbox.Anchored = true

Players.PlayerAdded:Connect(function(Player: Player)
	Player.CharacterAdded:Connect(function(Character: Model)		
		repeat 
			NewPlayerHitbox:PivotTo(Character:GetPivot())
			task.wait()
		until not Character
	end)
end)