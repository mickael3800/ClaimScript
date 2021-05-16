--[[
    File Name:		ClaimScriptServer.lua
	Programmer:		Mickaël Papineau
	Date:			2021/04/30
	Version:		1.1.0
	Description:    This script is to claim a postal with an command.
]]--

--Variables [Do Not Modify]
local Postal = {}
local ID = {}

RegisterNetEvent("claimAdd")
AddEventHandler("claimAdd", function(name, postal)

    if (Postal[source] == nil) then

        Postal[source] = postal
        ID[source] = name

        TriggerClientEvent("chat:addMessage", -1, {
            color = {255, 165, 0},
            multiline = true,
            args = {name .. " | Claimed Postal", postal}
        })

    else

        TriggerClientEvent("Notify", source, 2)

    end

end)

RegisterNetEvent("claimRemove")
AddEventHandler("claimRemove", function()

    TriggerClientEvent("chat:addMessage", -1, {
        color = {255, 165, 0},
        multiline = true,
        args = {ID[source] .. " | Unclaimed Postal", Postal[source]}
    })

    Postal[source] = nil
    ID[source] = nil

end)

RegisterNetEvent("claimList")
AddEventHandler("claimList", function()

    local num = 0

    TriggerClientEvent("chat:addMessage", source, {
        color = {0, 165, 0},
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

            num = num +1

        end

    end

    if (num == 0) then

        TriggerClientEvent("chat:addMessage", source, {
            color = {255, 165, 0},
            multiline = true,
            args = {"Claimed Postal", "None"}
        })

    end

    TriggerClientEvent("chat:addMessage", source, {
        color = {0, 165, 0},
        multiline = true,
        args = {"Claimed Postal List", "------------------------------"}
    })

end)

AddEventHandler("playerDropped", function()

    Postal[source] = nil
    ID[source] = nil

end)