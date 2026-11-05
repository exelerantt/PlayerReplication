return function(Registry)
    Registry:RegisterHook("BeforeCommandRegister", function(Context)
        -- Prevent non-allowed users from seeing admin commands
        if Context.Group == "Admin" and Context.Executor.UserId ~= game.CreatorId then
            return false
        end

        -- Hide a specific command completely
        if
            Context.Name == "ban" and not Context.Executor:GetAttribute("IsModerator")
            or Context.Executor.UserId ~= game.CreatorId
        then
            return false
        end

        return nil
    end)
end