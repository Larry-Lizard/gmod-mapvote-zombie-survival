local settings = {
	Length = 24, -- Vote lasts 24 seconds
	AllowCurrent = false, -- Don't allow current map to be re-voted
	Limit = 8, -- Only allow the choice of 8 maps
	Prefix = {"zs_", "ze_"}, -- Only allow maps beginning with ttt_ and cs_italy
}

-- ZS Hook by Larry Lizard / www.steamcommunity.com/id/LarryLizard

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