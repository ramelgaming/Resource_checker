ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('stop:kick')
AddEventHandler('stop:kick', function(reason)
	DropPlayer(source, reason)
end)
