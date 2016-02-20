-- Config
local settings = {
	Length = 24, -- Vote lasts 24 seconds
	AllowCurrent = false, -- Don't allow current map to be re-voted
	Limit = 8, -- Only allow the choice of 8 maps
	Prefix = {"zs_", "ze_"}, -- Only allow maps beginning with zs and ze
}

-- Config for extra voting Power
-- To enable, delete the "--[[" and the "]]"	
--[[
function MapVote.HasExtraVotePower(ply)
	
	
	if player:IsUserGroup("admin") then --Works with ULX User groups aswell. Specify group in the brackets
		return true
	end

	return false
end
]]

hook.Add( "LoadNextMap", "MapVote", function()
MapVote.Start(settings.Length, settings.AllowCurrent, settings.Limit, settings.Prefix)
return true 
end )


if SERVER then
    AddCSLuaFile()
    AddCSLuaFile("mapvote/cl_mapvote.lua")

    include("mapvote/sv_mapvote.lua")
else
    include("mapvote/cl_mapvote.lua")
end