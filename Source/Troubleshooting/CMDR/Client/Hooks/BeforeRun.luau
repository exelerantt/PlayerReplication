return function(Registry)
    Registry:RegisterHook("BeforeRun", function(Context): "You don't have permission to run this command" | nil
        if Context.Group == "DefaultAdmin" and Context.Executor.UserId ~= game.CreatorId then
            return "You don't have permission to run this command"
        end
		
		return
    end)
end