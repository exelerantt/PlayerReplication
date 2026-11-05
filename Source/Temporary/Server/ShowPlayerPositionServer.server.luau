const Players = game:GetService("Players")
const ReplicatedStorage = game:GetService("ReplicatedStorage")

const Assets = ReplicatedStorage:WaitForChild("Assets") :: Folder
const PlayerPills = Assets.PlayerPills :: Folder & { PlayerHitbox: MeshPart & { Description: StringValue }, QueryHitbox: MeshPart & { Description: StringValue } }

Players.PlayerAdded:Connect(function(Player: Player)
	local NewPlayerHitbox = PlayerPills.PlayerHitbox:Clone()
	NewPlayerHitbox.Parent = workspace
	NewPlayerHitbox.CanCollide = false
	NewPlayerHitbox.Anchored = true
	NewPlayerHitbox.Name = Player.DisplayName.. "_NewPlayerHitbox"

	Player.CharacterAdded:Connect(function(Character: Model)		
		repeat 
			pcall(function()
				Character.PrimaryPart = Character:WaitForChild("HumanoidRootPart", 3) :: BasePart
			end)
			NewPlayerHitbox:PivotTo(Character:GetPivot())
			task.wait()
		until not Character
	end)
end)