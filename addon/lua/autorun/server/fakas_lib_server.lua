-- Faklib Server
if Fakas == nil then
    Fakas = {}
end
if Fakas.Lib == nil then
    Fakas.Lib = {}
end

-- FakLib Server
Fakas.Lib.navmesh = {
    -- Navmesh-related helpers.
    exists = function()
        -- Return true if the current map has a navmesh, false if not.
        --
        -- Returns:
        --  A bool representing the presence of at least on nav area on the map.
        return navmesh.GetNavAreaCount() > 0
    end
}

Fakas.Lib.net = {
    -- Net-related helpers.
    send = function(message)
        -- Send a simple message to all clients.
        --
        -- Args:
        --  message: The string for the message.
        net.Start(message)
        net.Send(player.GetAll()) 
    end
}
