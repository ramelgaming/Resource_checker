ESX = nil
TriggerEvent('esx:getSharedObject',function(obj) ESX = obj end)

RegisterServerEvent('stop:kick')
AddEventHandler('stop:kick',function(reason)
	DropPlayer(source, reason)
end)

RegisterServerEvent('start-resource')
AddEventHandler('start-resource',function(Resource)
	StartResource(Config.Resource)
end)

CreateThread(function()
    if Config.Checkresources then
        Wait(10000)
        local added = false
        for i = 1, GetNumResources() do
            local resource_id = i - 1
            local resource_name = GetResourceByFindIndex(resource_id)
            if resource_name ~= GetCurrentResourceName() then
                for k, v in pairs({'fxmanifest.lua', '__resource.lua'}) do
                    local data = LoadResourceFile(resource_name, v)
                    if data and type(data) == 'string' and string.find(data, 'Resource_checker/client.lua') == nil then
                        data = data .. '\nclient_script "@Resource_checker/client.lua"'
                        SaveResourceFile(resource_name, v, data, -1)
                        added = true
                    end
                end
            end
        end
        if added then
			Wait(2000)
        end
    elseif not Config.Checkresources then
        Wait(10000)
        local added = false
        for i = 1, GetNumResources() do
            local resource_id = i - 1
            local resource_name = GetResourceByFindIndex(resource_id)
            if resource_name ~= GetCurrentResourceName() then
                for k, v in pairs({'fxmanifest.lua', '__resource.lua'}) do
                    local data = LoadResourceFile(resource_name, v)
                    if data and type(data) == 'string' and string.find(data, 'client.lua') ~= nil then
                        data = data:lower()
                        local removed = string.gsub(data, "client_script '%@Resource_checker%/%client.lua'", "")
                        SaveResourceFile(resource_name, v, removed, -1)
                        added = true
                    end
                end
            end
        end
        if added then
	    print('^1[Resource-Checker]-^3Loaded Successfully')
        end
    end
end)
