const ReplicatedStorage = game:GetService("ReplicatedStorage")
const Players = game:GetService("Players")

const LocalPlayer = Players.LocalPlayer
const Events = ReplicatedStorage.Events

const RemoteEvents = Events.RemoteEvents
const SendPlayerPosition: UnreliableRemoteEvent & { OnClientEvent: (CFrame) -> () } = RemoteEvents.SendPlayerPosition

const Assets = ReplicatedStorage:WaitForChild("Assets") :: Folder
const PlayerPills = Assets.PlayerPills :: Folder & {
	PlayerHitbox: MeshPart & { Description: StringValue },
	QueryHitbox: MeshPart & { Description: StringValue },
}
local NewPlayerHitbox

function CreatePlayerHitbox()
	NewPlayerHitbox = PlayerPills.PlayerHitbox:Clone()
	NewPlayerHitbox.Parent = LocalPlayer.Character
	NewPlayerHitbox.CanCollide = false
	NewPlayerHitbox.Anchored = true
	NewPlayerHitbox.Name = LocalPlayer.DisplayName .. "_NewPlayerHitbox"
end

LocalPlayer.CharacterAdded:Connect(function(_Character: Model & {Head: Part & {PingInformation: BillboardGui}})
	CreatePlayerHitbox()
end)

SendPlayerPosition.OnClientEvent:Connect(function(CFrame: CFrame)
	pcall(function()
		NewPlayerHitbox:PivotTo(CFrame)
		
		pcall(function()
			local PingInformation = LocalPlayer.Character.Head.PingInformation
			PingInformation.Adornee = NewPlayerHitbox
			PingInformation.ExtentsOffset = Vector3.new(0, 1.25, 0)
		end)
	end)
end)