local directions = { [0] = 'N', [1] = 'NW', [2] = 'W', [3] = 'SW', [4] = 'S', [5] = 'SE', [6] = 'E', [7] = 'NE', [8] = 'N' } 

local isStreetLabelEnabled = true 

setIsStreetLabelEnabled = function(boolean)
    isStreetLabelEnabled = boolean 
end 

Citizen.CreateThread(function() 
    while true do
        local pedVehicle = cache.vehicle
        local playerCoords = GetEntityCoords(cache.ped)
        local heading = directions[math.floor((GetEntityHeading(cache.ped) + 22.5) / 45.0)]
        local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z))
        local locationText = 'Odświeżam lokalizacje..'

        locationText = heading 
        locationText = (streetName == 'Odświeżam lokalizacje..' or streetName == nil) and (locationText) or (locationText .. ' | ' .. streetName)

        if pedVehicle and not IsPauseMenuActive() and isStreetLabelEnabled then
            showStreet(locationText)
        else
            hideStreet()
        end

        Citizen.Wait(300)
    end
end)

showStreet = function(text)
    SendNUIMessage({
        action = 'show',
        street = text
    })
end

hideStreet = function()
    SendNUIMessage({
        action = 'hide'
    })
end