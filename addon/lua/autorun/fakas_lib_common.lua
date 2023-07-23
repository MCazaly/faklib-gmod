-- Faklib Common
if Fakas == nil then
    Fakas = {}
end
if Fakas.Lib == nil then
    Fakas.Lib = {}
end

-- FakLib Common
Fakas.Lib.random_member = function(tbl)
    -- Fetch a randomly selected item from a table.
    --
    -- Args:
    --  tbl: The table to select from.
    --
    -- Returns:
    --  The randomly selected value.
    return tbl[math.random(#tbl)]
end

Fakas.Lib.get_list = function(convar)
    -- Fetch a table of comma-separated values from a ConVar.
    --
    -- Args:
    --  convar: The name of the ConVar to fetch from.
    --
    -- Returns:
    --  A table of all values listed in the ConVar.
    return Fakas.Lib.split(GetConVar(convar):GetString())
end

Fakas.Lib.split = function(str)
    -- Split a comma-separated string into a table of multiple values.
    --
    -- Args:
    --  str: The string to obtain values from.
    -- Returns:
    --  The resulting table.
    local tbl = {}

    for value in str:gmatch("([^,]+)") do
        table.insert(tbl, value)
    end
    return tbl
end
