
local initialHealth = -1

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
        local engineHealth = GetVehicleEngineHealth(vehicle)
        if initialHealth == -1 then
            initialHealth = engineHealth
        else
            if engineHealth <= 500 then 
                SetVehicleFuelLevel(vehicle,0.0)
            elseif engineHealth <= initialHealth-30 then
                local initialFuel = GetVehicleFuelLevel(vehicle)
                Wait(10)
                SetVehicleFuelLevel(vehicle,0.0)
                Wait(5000)
                SetVehicleFuelLevel(vehicle,initialHealth)
            end
            initialHealth = engineHealth
        end

    end
end)
