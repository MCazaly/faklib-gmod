-- Faklib Client
if Fakas == nil then
    Fakas = {}
end
if Fakas.Lib == nil then
    Fakas.Lib = {}
end

-- FakLib Client
Fakas.Lib.play_delayed_sound = function(path, delay)
    -- Play a sound on the client after a delay.
    --
    -- Args:
    --  path: The path in the sound folder to play from.
    --  delay: How many seconds to wait before playing the sound.
    timer.Simple(delay, function()
        Fakas.Lib.play_sound(path)
    end)
end

Fakas.Lib.play_sound = function(path)
    -- Play a sound once without looping.
    --
    -- Args:
    --  path: The path in the sound folder to play from.
    surface.PlaySound(path, "CHAN_AUTO", 100)
end

Fakas.Lib.draw_image = function(texture, size, coordinates)
    -- Draw a texture on the client screen.
    --
    -- Args:
    --  texture: The path to the texture to display.
    --  size: A table with keys w(idth) and h(eight) for size values.
    --  coordinates: A table with keys x and y for coordinate values.
    surface.SetDrawColor(255, 255, 255, 255)
    surface.SetMaterial(Material(texture))
    surface.DrawTexturedRect(coordinates.x, coordinates.y, size.w, size.h)
end

Fakas.Lib.animate_image = function(texture, size, open, close, start, duration)
    -- Draw an image on the client screen and move it from one set of coordinates to another.
    --
    -- Args:
    --  texture: The path to the texture to display.
    --  size: A table with keys w(idth) and h(eight) for size values.
    --  open: The start table with keys x and y for coordinate values.
    --  close: The destination table with keys x and y for coordinate values.
    --  start: The time the animation started, usually the time of the first invocation.
    --  duration: How long it should take in seconds for the image to reach its destination.
    --
    -- Returns:
    --  The progress the image has made towards its destination.
    local progress = math.min((CurTime() - start) / duration, 1)
    local coordinates = {
        x = Lerp(progress, open.x, close.x),
        y = Lerp(progress, open.y, close.y)
    }
    Fakas.Lib.draw_image(texture, size, coordinates)

    return progress
end
