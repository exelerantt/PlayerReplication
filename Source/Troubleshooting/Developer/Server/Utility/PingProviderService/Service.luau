--[=[
	@class PingProviderService
	@server
	
	The ping provider service.
]=]
local PingProviderService = {}

const ReplicatedStorage = game:GetService("ReplicatedStorage")

const Events = ReplicatedStorage.Events :: Folder
const RemoteFunctions = Events.RemoteFunctions :: Folder & {GetPlayerPing: RemoteFunction}

--[=[
	@within PingProviderService
	@prop GetPlayerPing "Initialize!" | RemoteFunction
]=]
PingProviderService.GetPlayerPing = "Initialize!" :: "Initialize!" | RemoteFunction

--[=[
	@method Initialize
	@within PingProviderService

	Creates the "GetPlayerPing" variable.
]=]
function PingProviderService:Initialize(): ()
	-- This will be ran before other modules are initilzed, if in a ModuleLoader.
	assert(RemoteFunctions:WaitForChild("GetPlayerPing"), "Attempted to search for 'GetPlayerPing'. It was not found, is it there?")
	self.GetPlayerPing = RemoteFunctions.GetPlayerPing
end

--[=[
	@method Start
	@within PingProviderService

	Latches onto the created "GetPlayerPing" variable and uses it.
]=]
function PingProviderService:Start(): ()
	-- This will be ran after other modules are initilzed, if in a ModuleLoader.
	local GetPlayerPing = self.GetPlayerPing :: RemoteFunction
	
	GetPlayerPing.OnServerInvoke = function(InvokedPlayer: Player, ProvidedPlayer: Player?)
		local Player = ProvidedPlayer or InvokedPlayer
		
		return Player:GetNetworkPing()
	end
end

return PingProviderService