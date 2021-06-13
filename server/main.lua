--[[
    File Name:		main.lua
	Programmer:		Mickaël Papineau
	Date:			2021/06/05
	Version:		1.2.1
	Description:    This script is the main server side script.
]]--

--Variables [Do Not Modify]
local List = {}

RegisterNetEvent("claimAdd")
AddEventHandler("claimAdd", function(name, postal)

    if (List[source] == nil) then

        List[source] = {{Postal = nil, ID = nil}}
        List[source].Postal = postal
        List[source].ID = name

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
        args = {List[source].ID .. " | Unclaimed Postal", List[source].Postal}
    })

    List[source] = nil

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

        if (List[i].Postal == nil) then

        else

            TriggerClientEvent("chat:addMessage", source, {
                color = {255, 165, 0},
                multiline = true,
                args = {List[i].ID .. " | Claimed Postal", List[i].Postal}
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

    List[source].Postal = nil
    List[source].ID = nil

end)
