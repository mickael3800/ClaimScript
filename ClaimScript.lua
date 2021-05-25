--[[
    File Name:		ClaimScript.lua
	Programmer:		Mickaël Papineau
	Date:			2021/05/25
	Version:		1.2.0
	Description:    This script is to claim a postal with an command.
]]--

TriggerEvent("chat:addSuggestion", "/claim", "Claim a Postal", {
    {name="Postal", help="The postal of the property that you want to claim."}
})
RegisterCommand("claim", function(source, name, msg)

    if (tonumber(name[1]) == nil) then

        TriggerEvent("Notify", 1)

    else

        local match = false

        for i = 1, PostalList[1].num, 1 do

            if (tonumber(name[1]) == PostalList[i].postal) then

                match = true
                break

            end

        end

        if (match == true) then

            TriggerServerEvent("claimAdd", GetPlayerName(PlayerId()), tonumber(name[1]))

        else

            TriggerEvent("Notify", 1)

        end

    end

end, false)

TriggerEvent("chat:addSuggestion", "/unclaim", "Unclaim a Postal")
RegisterCommand("unclaim", function(source, name, msg)

    TriggerServerEvent("claimRemove")

end, false)

TriggerEvent("chat:addSuggestion", "/claimlist", "Gives you a list of all Claimed Postals")
RegisterCommand("claimlist", function(source, name, msg)

    TriggerServerEvent("claimList")

end, false)

RegisterNetEvent("Notify")
AddEventHandler("Notify", function(num)

    if (num == 1) then

        notify("~y~Please enter an valid Postal.")

    elseif (num == 2) then

        notify("~y~You already claimed a postal, please unclaim it first before claiming this one.")

    end

end)

function notify(msg)    --The function to notify the player.

    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)

end