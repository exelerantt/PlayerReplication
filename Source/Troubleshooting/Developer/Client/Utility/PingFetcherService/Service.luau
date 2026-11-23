--[=[
	@class PingFetcherService
	@client
	
	The player ping fetcher.
]=]
local PingFetcherService = {}

const ReplicatedStorage = game:GetService("ReplicatedStorage")
const Players = game:GetService("Players")

const Events = ReplicatedStorage.Events :: Folder
const RemoteFunctions = Events.RemoteFunctions :: Folder & {GetPlayerPing: RemoteFunction}

const LocalPlayer = Players.LocalPlayer

--[=[
	@within PingFetcherService
	@prop GetPlayerPingRemote "Initialize!" | RemoteFunction
]=]
PingFetcherService.GetPlayerPingRemote = "Initialize!" :: "Initialize!" | RemoteFunction

--[=[
	@method Initialize
	@within PingFetcherService

	Creates the "GetPlayerPingRemote" variable.
]=]
function PingFetcherService:Initialize(): ()
	-- This will be ran before other modules are initilzed, if in a ModuleLoader.
	assert(RemoteFunctions:WaitForChild("GetPlayerPing"), "Attempted to search for 'GetPlayerPing'. It was not found, is it there?")
	self.GetPlayerPingRemote = RemoteFunctions.GetPlayerPing
end

--[=[
	@method Start
	@within PingFetcherService
	
	warns: "[ERR] [PingFetcherService]: RedundantFunction" -- This function is redundant.
]=]
function PingFetcherService:Start(): ()
	-- This will be ran after other modules are initilzed, if in a ModuleLoader.
	warn('[ERR] [PingFetcherService]: RedundantFunction')
end

--[=[
	@within PingFetcherService
	@method GetPlayerPing
	
	Invokes the RemoteFunction that grabs player ping.
]=]
function PingFetcherService:GetPlayerPing(ProvidedPlayer: Player?)
	local Player = ProvidedPlayer or LocalPlayer :: Player
	local GetPlayerPing = self.GetPlayerPingRemote :: RemoteFunction
	
	return GetPlayerPing:InvokeServer(Player)
end

return PingFetcherService