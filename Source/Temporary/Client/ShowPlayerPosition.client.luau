const ReplicatedStorage = game:GetService("ReplicatedStorage")
const Players = game:GetService("Players")

const LocalPlayer = Players.LocalPlayer
const Events = ReplicatedStorage.Events

const RemoteEvents = Events.RemoteEvents
const SendPlayerPosition: UnreliableRemoteEvent & {OnClientEvent: (CFrame) -> ()} = RemoteEvents.SendPlayerPosition
	
SendPlayerPosition.OnClientEvent:Connect(function(CFrame: CFrame)
	pcall(function()
		LocalPlayer.Character:PivotTo(CFrame)
	end)
end)