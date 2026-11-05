return {
    Name = "showpastplayerposition",
    Aliases = { "sppp", "showpos", "vispos", "debugpos" },
    Description = "Shows the player's current position on the server.",
    Group = "DefaultUtil",
    Args = {
        {
            Type = "number",
            Name = "Lifetime",
            Optional = true,
            Description = "How long the shown hitbox will last until it's destroyed. (Default: 5s)"
        }
    },
}