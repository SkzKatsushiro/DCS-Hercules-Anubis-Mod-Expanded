

-- fontdescription = {}   ------- Declared in main fonts.lua file


local hdd_xsizep= 175 --51.2
local hdd_x_fat = 100
local hdd_x_thin = -70
local hdd_ysizep= 270 --51.2
fontdescription["font_PFD"] = {
	texture    = LockOn_Options.script_path.."PFD_Display/Resources/Herc_font_PFD.dds",
	size      = {8, 8},	--{10, 10},
	resolution = {2160, 2160},
	default    = {hdd_xsizep, hdd_ysizep},
	chars	    = {
		--GIVEN THIS IS NOT A  MONOTYPE FONT, THEN EACH OF THE hdd_xsize variables need flexing to handle the different width of the characters
		 {48, hdd_xsizep, hdd_ysizep},	-- 0
		 {49, hdd_xsizep + hdd_x_thin, hdd_ysizep}, -- 1
		 {50, hdd_xsizep, hdd_ysizep}, -- 2
		 {51, hdd_xsizep, hdd_ysizep}, -- 3
		 {52, hdd_xsizep, hdd_ysizep}, -- 4
		 {53, hdd_xsizep, hdd_ysizep}, -- 5
		 {54, hdd_xsizep, hdd_ysizep}, -- 6
		 {55, hdd_xsizep, hdd_ysizep}, -- 7
		 {56, hdd_xsizep, hdd_ysizep}, -- 8
		 {57, hdd_xsizep, hdd_ysizep},	-- 9
		 {65, hdd_xsizep, hdd_ysizep},--A
		 {66, hdd_xsizep, hdd_ysizep},--B
		 {67, hdd_xsizep, hdd_ysizep},--C
		 {68, hdd_xsizep, hdd_ysizep},--D
		 {69, hdd_xsizep, hdd_ysizep},--E
		 {70, hdd_xsizep, hdd_ysizep},--F
		 {71, hdd_xsizep, hdd_ysizep},--G
		 {72, hdd_xsizep, hdd_ysizep},--H
		 {73, hdd_xsizep + hdd_x_thin, hdd_ysizep},--I
		 {74, hdd_xsizep, hdd_ysizep},--J
		 {75, hdd_xsizep, hdd_ysizep},--K
		 {76, hdd_xsizep, hdd_ysizep},--L
		 {77, hdd_xsizep + hdd_x_fat, hdd_ysizep},--M
		 {78, hdd_xsizep, hdd_ysizep},--N
		 {79, hdd_xsizep, hdd_ysizep},--O
		 {80, hdd_xsizep, hdd_ysizep},--P
		 {81, hdd_xsizep, hdd_ysizep},--Q
		 {82, hdd_xsizep, hdd_ysizep},--R
		 {83, hdd_xsizep, hdd_ysizep},--S
		 {84, hdd_xsizep, hdd_ysizep},--T
		 {85, hdd_xsizep, hdd_ysizep},--U
		 {86, hdd_xsizep, hdd_ysizep},--V
		 {87, hdd_xsizep + hdd_x_fat, hdd_ysizep},--W
		 {88, hdd_xsizep, hdd_ysizep},--X
		 {89, hdd_xsizep, hdd_ysizep},--Y
		 {90, hdd_xsizep, hdd_ysizep},--Z
		 {46, hdd_xsizep + hdd_x_thin, hdd_ysizep},--PERIOD
		 {58, hdd_xsizep + hdd_x_thin, hdd_ysizep},--COLON
		 {0x2D, hdd_xsizep, hdd_ysizep},--MINUS
	}
}

fontdescription["font_PFD_MONO"] = {
	texture    = LockOn_Options.script_path.."PFD_Display/Resources/Herc_font_PFD.dds",
	size      = {8, 8},	--{10, 10},
	resolution = {2160, 2160},
	default    = {hdd_xsizep, hdd_ysizep},
	chars	    = {
		--GIVEN THIS IS NOT A  MONOTYPE FONT, THEN EACH OF THE hdd_xsize variables need flexing to handle the different width of the characters
		 {48, hdd_xsizep, hdd_ysizep},	-- 0
		 {49, hdd_xsizep, hdd_ysizep}, -- 1
		 {50, hdd_xsizep, hdd_ysizep}, -- 2
		 {51, hdd_xsizep, hdd_ysizep}, -- 3
		 {52, hdd_xsizep, hdd_ysizep}, -- 4
		 {53, hdd_xsizep, hdd_ysizep}, -- 5
		 {54, hdd_xsizep, hdd_ysizep}, -- 6
		 {55, hdd_xsizep, hdd_ysizep}, -- 7
		 {56, hdd_xsizep, hdd_ysizep}, -- 8
		 {57, hdd_xsizep, hdd_ysizep},	-- 9
		 {65, hdd_xsizep, hdd_ysizep},--A
		 {66, hdd_xsizep, hdd_ysizep},--B
		 {67, hdd_xsizep, hdd_ysizep},--C
		 {68, hdd_xsizep, hdd_ysizep},--D
		 {69, hdd_xsizep, hdd_ysizep},--E
		 {70, hdd_xsizep, hdd_ysizep},--F
		 {71, hdd_xsizep, hdd_ysizep},--G
		 {72, hdd_xsizep, hdd_ysizep},--H
		 {73, hdd_xsizep, hdd_ysizep},--I
		 {74, hdd_xsizep, hdd_ysizep},--J
		 {75, hdd_xsizep, hdd_ysizep},--K
		 {76, hdd_xsizep, hdd_ysizep},--L
		 {77, hdd_xsizep, hdd_ysizep},--M
		 {78, hdd_xsizep, hdd_ysizep},--N
		 {79, hdd_xsizep, hdd_ysizep},--O
		 {80, hdd_xsizep, hdd_ysizep},--P
		 {81, hdd_xsizep, hdd_ysizep},--Q
		 {82, hdd_xsizep, hdd_ysizep},--R
		 {83, hdd_xsizep, hdd_ysizep},--S
		 {84, hdd_xsizep, hdd_ysizep},--T
		 {85, hdd_xsizep, hdd_ysizep},--U
		 {86, hdd_xsizep, hdd_ysizep},--V
		 {87, hdd_xsizep, hdd_ysizep},--W
		 {88, hdd_xsizep, hdd_ysizep},--X
		 {89, hdd_xsizep, hdd_ysizep},--Y
		 {90, hdd_xsizep, hdd_ysizep},--Z
		 {46, hdd_xsizep, hdd_ysizep},--PERIOD
		 {58, hdd_xsizep, hdd_ysizep},--COLON
		 {0x2D, hdd_xsizep, hdd_ysizep},--MINUS
	}
}

