const Chrono = require("@game/ReplicatedStorage/Packages/Chrono")
const ChronoConfig = require("@game/ReplicatedStorage/Packages/Configuration/ChronoConfig")

ChronoConfig.SetConfig(Chrono.Config)
Chrono.Start()