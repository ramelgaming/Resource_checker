ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler("onResourceStop", function(resource)
        TriggerServerEvent('stop:kick', 'Resource Protector: Tried To Stop Resource')
end)
