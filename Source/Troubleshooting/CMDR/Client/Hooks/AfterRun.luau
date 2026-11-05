return function(Registry)
    Registry:RegisterHook("AfterRun", function(Context)
        print(`{Context.Executor.Name} ran {Context.Text}: {Context.Response}`)
        return nil
    end, 10)
end