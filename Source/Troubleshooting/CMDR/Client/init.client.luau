--!nocheck

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Cmdr = require(ReplicatedStorage:WaitForChild("CmdrClient"))

-- Optional. Configurable, and you can choose multiple keys
Cmdr:SetActivationKeys({ Enum.KeyCode.F2 })

Cmdr.Registry:RegisterHooksIn(script.Hooks)
-- BeforeCommandRegister was added in v1.13.0-rc.2, and we are on v1.12.0, so it will not work.

-- You can call any extra methods here, like SetPlaceName, or access the registry to register a hook on the client only (if you want to!)
