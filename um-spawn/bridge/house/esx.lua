if not um.main.property.houseStatus or GetResourceState('esx_property') ~= 'started' then return end

Debug('esx_property for house')

lib.callback.register('getHouses', function()
    local houses = exports['esx_property']:GetOwnedProperties()
    print(Dump(houses))
     local found = next(houses)
     Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')

     return found and houses or false
end)
