MapVote = {}
MapVote.Config = {}

-- CONFIG (sort of)
    MapVote.Config = {
        MapLimit = 24,
        TimeLimit = 28,
        AllowCurrentMap = false,
    }
-- CONFIG

function MapVote.HasExtraVotePower(ply)
	-- Example that gives admins more voting power
	if	player:IsUserGroup("admin") then
		return true
	end

	return false
end


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

