Config = {}

Config.DriveThru = {
    Model = `s_m_m_linecook`,
    PedCoords = vector4(1247.1443, -350.1689, 68.2, 348.3120), 

    Animation = {
        dict = "anim@mp_player_intupperwave",
        name = "out_to_idle"
    },

    Target = {
        label = "Open Menu",
        icon = "fas fa-burger",
        distance = 2.0
    },

    Blip = {
        enabled = true,
        coords = vector3(1247.1443, -350.1689, 69.2098),
        sprite = 85,
        color = 5,
        scale = 0.8,
        label = "Drive Thru"
    }
}

Config.Items = {
    {
        title = 'Burger 🍔',
        description = 'Price: $50',
        icon = 'hamburger',
        onSelect = function()
            TriggerServerEvent('ykaa:buy', 'burger', 50)
        end
    },
    {
        title = 'Water 💧',
        description = 'Price: $20',
        icon = 'glass-water',
        onSelect = function()
            TriggerServerEvent('ykaa:buy', 'water', 20)
        end
    },
}