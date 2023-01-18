local Script_path	= LockOn_Options.script_path..""

dofile(LockOn_Options.common_script_path.."devices_defs.lua")


indicator_type       = indicator_types.COLLIMATOR
purposes 	   = {render_purpose.GENERAL}

-------PAGE IDs-------
-- subset ids
BASE    = 1
Indication = 2

page_subsets  = {
	[BASE]    		= Script_path.."HUD/PILOT_HUD/base_page.lua",
	[Indication]    = Script_path.."HUD/PILOT_HUD/Indication_page.lua",
}
pages = 
{
	{
	 BASE,
	 Indication
	 },
}

-- set this page on start
init_pageID     = 1


opacity_sensitive_materials = 
{
}

color_sensitive_materials = 
{
}
