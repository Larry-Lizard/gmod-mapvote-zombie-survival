<<<<<<< HEAD
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

=======
local settings = {
	Length = 24, -- Vote lasts 24 seconds
	AllowCurrent = false, -- Don't allow current map to be re-voted
	Limit = 8, -- Only allow the choice of 8 maps
	Prefix = {"zs_", "ze_"}, -- Only allow maps beginning with zs and ze
}

-- ZS Hook by Larry Lizard / www.steamcommunity.com/id/LarryLizard
>>>>>>> parent of 310f153... Added Extra voting Power, supports ULX Groups

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

