ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


AddEventHandler('onClientResourceStop',function(resourceName)
    if resourceName == GetCurrentResourceName() then 
        print('^1ResourceChecker:^3 Stopper Detected^0')
        TriggerServerEvent('stop:kick', '⛔️You Have Been Kicked: Tried To Stop Resource') 
    end
end)


AddEventHandler('onResourceStop',function(resourceName)
    if resourceName == GetCurrentResourceName() then 
        print('^1ResourceChecker:^3 Stopper Detected^0')
        TriggerServerEvent('stop:kick', '⛔️You Have Been Kicked: Tried To Stop Resource')    
    end
end)
