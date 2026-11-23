const Players = game:GetService("Players")
const ReplicatedStorage = game:GetService("ReplicatedStorage")

const Assets = ReplicatedStorage.Assets :: Folder & {PlayerInformation: Folder}
const PlayerInformation = Assets.PlayerInformation :: Folder & {PingInformation: BillboardGui}

const PingInformationBillboard = PlayerInformation.PingInformation :: BillboardGui & {PingInformationTextLabel: TextLabel}
const PingFetcherService = require("@game/ReplicatedStorage/Packages/Utility/PingFetcherService/Service")

PingFetcherService:Initialize()
PingFetcherService:Start()

function CreateBasePingInformationBillboard(Character: Model & {Head: Part?})
	local NewPingInformationBillboard = PingInformationBillboard:Clone()
	
	pcall(function()
		local Head = Character:WaitForChild("Head", 2.5) :: Part
		
		if Head.PingInformation then
			Head.PingInformation:Destroy()
		end
	end)
	
	NewPingInformationBillboard.Adornee = Character:WaitForChild("Head", 3)
	NewPingInformationBillboard.Parent = Character:WaitForChild("Head", 2.5)
	
	return NewPingInformationBillboard
end

function CreatePingBillboard(Player: Player)
	task.spawn(function()
		local Character = Player.Character or Player.CharacterAdded:Wait()
		
		repeat
			task.wait()
		until Character
		
		local PingInformation = CreateBasePingInformationBillboard(Character)
		
		repeat
			local FetchedPing = tostring(PingFetcherService:GetPlayerPing(Player))
			PingInformation.PingInformationTextLabel.Text = `Ping: {FetchedPing:sub(1, 4)}ms`
			task.wait()
		until not Character
	end)
end

function AttachPlayerToPingBillboard(Player: Player)
	CreatePingBillboard(Player)
	
	Player.CharacterAdded:Connect(function(_Character: Model)
		CreatePingBillboard(Player)
	end)
end

for _, Player: Player in pairs(Players:GetPlayers()) do
	AttachPlayerToPingBillboard(Player)
end

Players.PlayerAdded:Connect(function(Player: Player)
	AttachPlayerToPingBillboard(Player)
end)

