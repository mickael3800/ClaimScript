--[[
    File Name:		ClaimScript.lua
	Programmer:		Mickaël Papineau
	Date:			2021/04/29
	Version:		1.0.0
	Description:    This script is to place an waypoint to a postal with an command.
]]--

TriggerEvent("chat:addSuggestion", "/claim", "Claim a Postal", {
    {name="Postal", help="The postal of the property that you want to claim."}
})
RegisterCommand("claim", function(source, name, msg)

    TriggerServerEvent("claimAdd", GetPlayerName(PlayerId()), name)

end, false)

TriggerEvent("chat:addSuggestion", "/unclaim", "Unclaim a Postal", {
    {name="Postal", help="The postal of the property that you want to unclaim."}
})
RegisterCommand("unclaim", function(source, name, msg)

    TriggerServerEvent("claimRemove", GetPlayerName(PlayerId()), name)

end, false)

TriggerEvent("chat:addSuggestion", "/claimlist", "Gives you a list of all Claimed Postals")
RegisterCommand("claimlist", function(source, name, msg)

    TriggerServerEvent("claimList")

end, false)