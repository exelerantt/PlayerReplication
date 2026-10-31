local ChronoConfig = {}
function ChronoConfig.SetConfig(ChronoConfiguration)
	ChronoConfiguration.SetConfig("MIN_BUFFER", 0)
	ChronoConfiguration.SetConfig("MAX_BUFFER", 0.12)
	ChronoConfiguration.SetConfig("DEFAULT_NORMAL_TICK_DISTANCE", 100)
	ChronoConfiguration.SetConfig("DEFAULT_HALF_TICK_DISTANCE", 200)
	ChronoConfiguration.SetConfig("GRID_UPDATE_INTERVAL", 0.1)
	ChronoConfiguration.SetConfig("GRID_MAX_UPDATE_TIME", 0.002) 
	ChronoConfiguration.SetConfig("PLAYER_REPLICATION", "AUTOMATIC")
end

return ChronoConfig