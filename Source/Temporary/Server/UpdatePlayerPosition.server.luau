const ReplicatedStorage = game:GetService("ReplicatedStorage")
const Players = game:GetService("Players")

const Events = ReplicatedStorage.Events
const RemoteEvents = Events.RemoteEvents
local SendPlayerPosition = RemoteEvents.SendPlayerPosition :: UnreliableRemoteEvent

while task.wait() do
	for _, Player: Player in pairs(Players:GetPlayers()) do
		local Character = Player.Character or Player.CharacterAdded:Wait()
		local PrimaryPart = Character.PrimaryPart
		
		SendPlayerPosition:FireClient(Player, PrimaryPart.CFrame)
	end
end