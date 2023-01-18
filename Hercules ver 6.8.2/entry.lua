local self_ID  = "Hercules"

declare_plugin(self_ID,
{
displayName   = _("Hercules"),
shortName	  =   "Hercules",
developerName =   "Anubis",

installed 	 = true, -- if false that will be place holder , or advertising
dirName	  	 = current_mod_path,
fileMenuName = _("Hercules"),
update_id     =   "Anubis Hercules",
version		 = "Beta ver 6.8.2",		 
state		 = "installed",
info		 = _("Hercules."),
encyclopedia_path = current_mod_path..'/Encyclopedia',
binaries 	 =
{
	"Hercules.dll",
},
InputProfiles =
{
    ["Hercules"]      = current_mod_path .. '/Input',
},
Skins	= 
	{
		{
			name	= _("Hercules"),
			dir		= "theme"
		},
	},
Missions =
	{
		{
			name		= _("Hercules"),
			dir			= "Missions",	
		},
	},	
Options = {
    {
            name 		= _("Hercules"),
            nameId 		= "Hercules",
            dir 		= "Options",
        },
    },	
LogBook =
	{
		{
			name		= _("Hercules"),
			type		= "Hercules",
		},
	},	
})

mount_vfs_liveries_path (current_mod_path ..  "/Liveries")
mount_vfs_texture_path  (current_mod_path .. "/Textures")
mount_vfs_model_path    (current_mod_path ..  "/Shapes")
mount_vfs_model_path	(current_mod_path.."/Cockpit/Shape")
mount_vfs_texture_path(current_mod_path ..  "/theme/ME")--for simulator loading window
---------------------------------------------------------
dofile(current_mod_path..'/Hercules_Loadout.lua')
dofile(current_mod_path..'/Hercules.lua')
dofile(current_mod_path..'/Hercules_Container_Parachute_Static.lua')
---------------------------------------------------------
dofile(current_mod_path.."/Views.lua")
make_view_settings('Hercules', ViewSettings, SnapViews)
---------------------------------------------------------
local cfg_path = current_mod_path ..  "/HerculesFM.lua"
dofile(cfg_path)
HerculesFM[1] 				= self_ID
HerculesFM[2] 				= 'Hercules'
HerculesFM.config_path 		= cfg_path
-- HerculesFM.old 				= true

------------------------------------------------------------------------------------
make_flyable('Hercules', current_mod_path..'/Cockpit/Scripts/', HerculesFM, current_mod_path..'/comm.lua')--make_flyable(obj_name,optional_cockpit path,optional_fm = {mod_of_fm_origin,dll_with_fm})
----------------------------------------------------------------------------------------

plugin_done()


