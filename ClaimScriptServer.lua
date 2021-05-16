--[[
    File Name:		ClaimScriptServer.lua
	Programmer:		Mickaël Papineau
	Date:			2021/04/29
	Version:		1.0.0
	Description:    This script is to place an waypoint to a postal with an command.
]]--

--Variables [Do Not Modify]
local Postal = {}
local ID = {}

RegisterNetEvent("claimAdd")
AddEventHandler("claimAdd", function(name, postal)

    Postal[source] = postal
    ID[source] = name

    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 165, 0},
        multiline = true,
        args = {name .. " | Claimed Postal", postal}
    })

end)

RegisterNetEvent("claimRemove")
AddEventHandler("claimRemove", function(name, postal)

    Postal[source] = nil
    ID[source] = nil

    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 165, 0},
        multiline = true,
        args = {name .. " | Unclaimed Postal", postal}
    })

end)

RegisterNetEvent("claimList")
AddEventHandler("claimList", function ()

    TriggerClientEvent("chat:addMessage", source, {
        color = {255, 165, 0},
        multiline = true,
        args = {"Claimed Postal List", "------------------------------"}
    })

    for i = 1, 999, 1 do

        if (Postal[i] == nil) then

        else

            TriggerClientEvent("chat:addMessage", source, {
                color = {255, 165, 0},
                multiline = true,
                args = {ID[i] .. " | Claimed Postal", Postal[i]}
            })

        end

    end

    TriggerClientEvent("chat:addMessage", source, {
        color = {255, 165, 0},
        multiline = true,
        args = {"Claimed Postal List", "------------------------------"}
    })

end)

AddEventHandler("playerDropped", function ()

    Postal[source] = nil
    ID[source] = nil

end)