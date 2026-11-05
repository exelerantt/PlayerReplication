const ReplicatedStorage = game:GetService("ReplicatedStorage")

const Assets = ReplicatedStorage:WaitForChild("Assets") :: Folder
const PlayerPills = Assets.PlayerPills :: Folder & {
	PlayerHitbox: MeshPart & { Description: StringValue },
	QueryHitbox: MeshPart & { Description: StringValue },
}

return function(CommandContext: { Executor: Player } & { [string]: any }, Lifetime: number | nil): ()
	local NewPlayerHitbox = PlayerPills.PlayerHitbox:Clone()
	NewPlayerHitbox.Parent = workspace
	NewPlayerHitbox.CanCollide = false
	NewPlayerHitbox.Anchored = true
	NewPlayerHitbox.Name = CommandContext.Executor.DisplayName .. "_NewPlayerHitbox"
    NewPlayerHitbox:PivotTo(CommandContext.Executor.Character:GetPivot())
    
    task.delay(Lifetime or 5, function()
		NewPlayerHitbox:Destroy()
	end)

	return NewPlayerHitbox:GetPivot()
end
