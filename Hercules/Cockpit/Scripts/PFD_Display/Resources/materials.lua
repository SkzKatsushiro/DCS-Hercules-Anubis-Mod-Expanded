
dofile(LockOn_Options.script_path.."PFD_Display/Resources/fonts.lua")

-- materials = {}   ------- Declared in main materials.lua file
-- fonts = {}   ------- Declared in main materials.lua file
-- textures = {}   ------- Declared in main materials.lua file

-------materials-------
materials["black"]			= {0, 0, 0, 255}
materials["white"]			= {255, 255, 255, 255}
materials["green"]			= {0, 255, 0, 255}
materials["cyan"]			= {0, 255, 255, 255}

-- If you make a font or texture here with the same name as in the main material.lua file, the main one will be used

-------PFD FONTS----------
fonts["font_PFD_white"]					= {fontdescription["font_PFD"], 10, materials["white"]}
fonts["font_PFD_white_mono"]			= {fontdescription["font_PFD_MONO"], 10, materials["white"]}
fonts["font_PFD_green"]					= {fontdescription["font_PFD"], 10, materials["green"]}
fonts["font_PFD_cyan"]					= {fontdescription["font_PFD"], 10, materials["cyan"]}

-------PFD TEXTURES-------
-- textures["PFD_Background"]						= {LockOn_Options.script_path.."PFD_Display/Resources/Herc_PFD_Background.dds", materials["white"]}
textures["PFD_Ladder_Lines"]					= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_LadderLines_3.dds", materials["white"]}
textures["PFD_FPM"]								= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_FPM.dds", materials["white"]}
textures["PFD_BankIndicator"]					= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_BankIndicator.dds", materials["white"]}
textures["PFD_BankIndicator_Fill"]				= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_BankIndicator_Fill.dds", materials["white"]}
textures["PFD_ADI_Mask"]						= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_ADI_Mask_White.dds", materials["black"]}
textures["PFD_ADI_Mask_Outline"]				= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_ADI_Mask_Outline.dds", materials["white"]}
-- textures["PFD_Color"]							= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_Color_Tall.dds", materials["white"]}
textures["PFD_Airspeed"]						= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_Airspeed.dds", materials["green"]}
textures["PFD_Airspeed_Arrow"]					= {LockOn_Options.script_path.."PFD_Display/Resources/AirspeedTapeArrowOutline.dds", materials["white"]}
textures["PFD_Airspeed_Arrow_Black"]			= {LockOn_Options.script_path.."PFD_Display/Resources/AirspeedTapeArrowBlack.dds", materials["white"]}
textures["PFD_AirspeedNumberMask"]				= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_AirspeedNumberMask.dds", materials["black"]}
textures["PFD_Altitude"]						= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_Altitude.dds", materials["green"]}
textures["PFD_Altitude_Arrow"]					= {LockOn_Options.script_path.."PFD_Display/Resources/AltitudeArrowPath.dds", materials["white"]}
textures["PFD_Altitude_Arrow_Black"]			= {LockOn_Options.script_path.."PFD_Display/Resources/AltitudeArrowBlack.dds", materials["white"]}
textures["PFD_CompassRose"]						= {LockOn_Options.script_path.."PFD_Display/Resources/CompassRose.dds", materials["green"]}
textures["PFD_CompassHeading"]					= {LockOn_Options.script_path.."PFD_Display/Resources/HeadingMarker.dds", materials["white"]}
textures["PFD_VVI_Tape"]						= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_VVI_Tape.dds", materials["green"]}
textures["PFD_GS_Box"]							= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_GS_Box.dds", materials["white"]}
textures["PFD_HDG_Box"]							= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_HDG_Box.dds", materials["white"]}
textures["PFD_AGL_Label"]						= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_AGL_Label.dds", materials["white"]}
textures["PFD_AGL_Box"]							= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_AGL_Box.dds", materials["white"]}
textures["PFD_AGL_Box_Big"]						= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_AGL_Box_Big.dds", materials["white"]}
textures["PFD_ALTPRESS_LBL"]					= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_ALTPRESS_LBL.dds", materials["cyan"]}
-- textures["PFD_FILTER"]							= {LockOn_Options.script_path.."PFD_Display/Resources/PFD_Filter.dds", materials["black"]}



preload_texture =
{
-------PFD FONTS----------
	LockOn_Options.script_path.."PFD_Display/Resources/Herc_font_PFD.dds",
-------PFD TEXTURES-------
	LockOn_Options.script_path.."PFD_Display/Resources/Herc_PFD_Background.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_LadderLines_3.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_FPM.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_BankIndicator.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_BankIndicator_Fill.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_ADI_Mask_White.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_ADI_Mask_Outline.dds",
	-- LockOn_Options.script_path.."PFD_Display/Resources/PFD_Color_Tall.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_Airspeed.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/AirspeedTapeArrowOutline.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/AirspeedTapeArrowBlack.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_AirspeedNumberMask.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_Altitude.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/AltitudeArrowPath.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/AltitudeArrowBlack.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/CompassRose.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/HeadingMarker.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_VVI_Tape.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_VVI_Box.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_VVI_TopArrow.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_VVI_BottomArrow.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_GS_Box.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_HDG_Box.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_AGL_Label.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_AGL_Box.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_AGL_Box_Big.dds",
	LockOn_Options.script_path.."PFD_Display/Resources/PFD_ALTPRESS_LBL.dds",
	-- LockOn_Options.script_path.."PFD_Display/Resources/PFD_Filter.dds",
}


