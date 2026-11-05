-- This is a script you would create in ServerScriptService, for example
--local ServerScriptService = game:GetService("ServerScriptService")
--local ReplicatedStorage = game:GetService("ReplicatedStorage")

--/TODO:
--[[
Do make sure to add group assignments manually, orelse every player might be able to run every command!
- exelerantt
]]

const ServerStorage = game:GetService("ServerStorage")
const CMDR = require("@game/ServerStorage/ServerPackages/Cmdr")

local RegistrySettings = {
	BlacklistedGroups = {
		"DefaultAdmin",
	},

	BlacklistedCommands = {
		"blink",
		"thru",
		"position",
		"fetch",
		"get-player-place-instance",
	},

	WhitelistedGroups = { -- If a group is blacklisted, the whitelist will unblacklist it
		-- To be added.
	},

	WhitelistedCommands = { -- If a command is blacklisted, it will unblacklist it and bypass the group requirement.
		"announce",
		"ban",
		"kick",
		"unban",
	},
}

function ValidateCommand(Command)
	local CommandUsable = {
		UsableViaGroup = true,
		UsableViaName = true,
	}

	for _, CommandGroupName in pairs(RegistrySettings.BlacklistedGroups) do
		if not (Command.Group == CommandGroupName) then
			continue
		else
			CommandUsable.UsableViaGroup = false

			break
		end
	end

	for _, CommandGroupName in pairs(RegistrySettings.WhitelistedGroups) do
		if Command.Group == CommandGroupName then
			CommandUsable.UsableViaGroup = true
		end
	end

	for _, CommandName in pairs(RegistrySettings.BlacklistedCommands) do
		if not (Command.Group == CommandName) then
			continue
		end

		CommandUsable.UsableViaName = false
	end

	for _, CommandName in pairs(RegistrySettings.WhitelistedCommands) do
		if Command.Name == CommandName then
			CommandUsable.UsableViaName, CommandUsable.UsableViaGroup = true, true
		end
	end

	if CommandUsable.UsableViaGroup and CommandUsable.UsableViaName then
		return true
	else
		return false
	end
end

CMDR.Registry:RegisterDefaultCommands(ValidateCommand)

CMDR.Registry:RegisterCommandsIn(ServerStorage.Commands, ValidateCommand)

CMDR.Registry:RegisterHooksIn(script.Hooks)

-- You can also register types or hooks here: read on or check the API reference!
