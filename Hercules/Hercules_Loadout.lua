-------------------------------------AMMO CRATES--------------------------------------
local wsType_Ammo_Pallet = 21048
function Ammo_Pallet_Contents(main)
	local data = main
	declare_loadout({
		category 		= CAT_MISSILES,
		CLSID	 		= data.clsid,
		wsTypeOfWeapon	= data.wstype,
		attribute		= {4,	4,	32,	wsType_Ammo_Pallet},
		Count 			= data.count,
		Cx_pil			= 0.0,
		Picture			= "Herc_Pallet.png",
		displayName		= data.user_name,
		Weight			= 120 + (data.count * data.mass),--120kg for container
		Elements  		= 
		{
			{
				Position	= {0,	0, 0},
				ShapeName	= "Hercules_Ammo_Pallet",
				IsAdapter	= true,
			}, 
			{
				DrawArgs =	
				{
					[1]	= {1,	1},
					[2]	= {2,	1},
				}, -- end of DrawArgs
				Position = {0,	0,	0},
				ShapeName =	data.contents,}},
		kind_of_shipping	=  1, --SUBMUNITION_AND_CONTAINER_SEPARATELY
		adapter_type		=  {wsType_Weapon, wsType_GContainer, wsType_Support,wsType_Ammo_Pallet},
	})
	-- return data
end

Ammo_Pallet_Contents({user_name = _("Ammo AGM-65D*10 [4800lb]"), clsid = "Herc_Ammo_AGM_65D_missiles", contents = "AGM-65D", count = 10,  mass = 218, wstype = {4, 4, 8, 77}}) --AGM65D
Ammo_Pallet_Contents({user_name = _("Ammo AGM-65H*10 [4570lb]"), clsid = "Herc_Ammo_AGM_65H_missiles", contents = "AGM-65H", count = 10,  mass = 208, wstype = {4, 4, 8, 138}}) --AGM65H
Ammo_Pallet_Contents({user_name = _("Ammo AGM-65G*10 [6622lb]"), clsid = "Herc_Ammo_AGM_65G_missiles", contents = "AGM-65G", count = 10,  mass = 301, wstype = {4, 4, 8, 139}}) --AGM65G
Ammo_Pallet_Contents({user_name = _("Ammo AGM-65E*10 [6292lb]"), clsid = "Herc_Ammo_AGM_65E_missiles", contents = "AGM-65E", count = 10,  mass = 286, wstype = {4, 4, 8, 70}}) --AGM65E
Ammo_Pallet_Contents({user_name = _("Ammo AGM-65K*10 [7920lb]"), clsid = "Herc_Ammo_AGM_65K_missiles", contents = "AGM-65K", count = 10,  mass = 360, wstype = {4, 4, 8, 61}}) --AGM65K
Ammo_Pallet_Contents({user_name = _("Ammo AGM-88C*10 [7920lb]"), clsid = "Herc_Ammo_AGM_88C_missiles", contents = "{B06DD79A-F21E-4EB9-BD9D-AB3844618C9C}", count = 10,  mass = 361, wstype = {4, 4,	8, 65}}) --AGM88C
Ammo_Pallet_Contents({user_name = _("Ammo Vikhr*48 [5808lb]"), clsid = "Herc_Ammo_Vikhr_missiles", contents = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}", count = 48,  mass = 55, wstype = {4, 4, 8, 58}}) --Vikhr
Ammo_Pallet_Contents({user_name = _("Ammo AGM-114K*48 [5869lb]"), clsid = "Herc_Ammo_AGM_114K_missiles", contents = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}", count = 48,  mass = 55, wstype = {4, 4, 8, 39}}) --AGM-114K Hellfire
Ammo_Pallet_Contents({user_name = _("Ammo AGM-84A*8 [11651lb]"), clsid = "Herc_Ammo_AGM_84A_missiles", contents = "{8B7CADF9-4954-46B3-8CFB-93F2F5B90B03}", count = 8,  mass = 661, wstype = {4, 4,	8,	62,	"Anti-Ship missiles"}}) --agm84a
Ammo_Pallet_Contents({user_name = _("Ammo AGM-84E*8 [11651lb]"), clsid = "Herc_Ammo_AGM_84E_missiles", contents = "{AF42E6DF-9A60-46D8-A9A0-1708B241AADB}", count = 8,  mass = 661, wstype = {4, 4,	8,	63,	"Cruise missiles"}}) --agm84e
Ammo_Pallet_Contents({user_name = _("Ammo AGM-154C*10 [10648lb]"), clsid = "Herc_Ammo_AGM_154C_missiles", contents = "{9BCC2A2B-5708-4860-B1F1-053A18442067}", count = 10,  mass = 484, wstype = {4, 4,	8,	132, "Cruise missiles"}}) --agm154c
Ammo_Pallet_Contents({user_name = _("Ammo Kh-25ML*10 [7920lb]"), clsid = "Herc_Ammo_KH25ML_missiles", contents = "{79D73885-0801-45a9-917F-C90FE1CE3DFC}", count = 10,  mass = 360, wstype = {4,	4,	8,	45}}) --kh-25ml
Ammo_Pallet_Contents({user_name = _("Ammo Kh-25MPU*10 [8140lb]"), clsid = "Herc_Ammo_KH25MPU_missiles", contents = "{752AF1D2-EBCC-4bd7-A1E7-2357F5601C70}", count = 10,  mass = 370, wstype = {4,	4,	8,	47}}) --kh-25mpu
Ammo_Pallet_Contents({user_name = _("Ammo Kh-29T*10 [16720lb]"), clsid = "Herc_Ammo_KH29T_missiles", contents = "{601C99F7-9AF3-4ed7-A565-F8B8EC0D7AAC}", count = 10,  mass = 760, wstype = {4,	4,	8,	75}}) --kh29t
Ammo_Pallet_Contents({user_name = _("Ammo Kh-29L*10 [16434lb]"), clsid = "Herc_Ammo_KH29L_missiles", contents = "{D4A8D9B9-5C45-42e7-BBD2-0E54F8308432}", count = 10,  mass = 747, wstype = {4,	4,	8,	49}}) --kh29l
Ammo_Pallet_Contents({user_name = _("Ammo Kh-58U*10 [16060lb]"), clsid = "Herc_Ammo_KH58U_missiles", contents = "{B5CA9846-776E-4230-B4FD-8BCC9BFB1676}", count = 10,  mass = 730, wstype = {4,	4,	8,	46}}) --kh58u
Ammo_Pallet_Contents({user_name = _("Ammo S-24B*20 [10340lb]"), clsid = "Herc_Ammo_S24B_missiles", contents = "{1FA14DEA-8CDB-45AD-88A8-EC068DF1E65A}", count = 20,  mass = 235, wstype = {4,	4,	8,	133}}) --S24b
Ammo_Pallet_Contents({user_name = _("Ammo S-25OFM*10 [10890lb]"), clsid = "Herc_Ammo_S25OFM_missiles", contents = "{A0648264-4BC0-4EE8-A543-D119F6BA4257}", count = 10,  mass = 495, wstype = {4,	7,	33,	35}}) --S-25OFM
Ammo_Pallet_Contents({user_name = _("Ammo S-25L*10 [11000b]"), clsid = "Herc_Ammo_S25L_missiles", contents = "{0180F983-C14A-11d8-9897-000476191836}", count = 10,  mass = 500, wstype = {4,	4,	8,	133}}) --S-25L
Ammo_Pallet_Contents({user_name =  ("Ammo TOW*30 [4125lb]"), clsid = "Herc_Ammo_TOW_missiles", contents = "TOW", count = 30,  mass = 62 , wstype = {4,    4,    8,    130}}) --TOW
---------------------------------------------------------------------------------------	
function Ammo_Pallet_Contents(main)
	local data = main
	declare_loadout({
		category 		= CAT_ROCKETS,
		CLSID	 		= data.clsid,
		wsTypeOfWeapon	= data.wstype,
		attribute		= {4,	4,	32,	wsType_Ammo_Pallet},
		Count 			= data.count,
		Cx_pil			= 0.0,
		Picture			= "Herc_Pallet.png",
		displayName		= data.user_name,
		Weight			= 120 + (data.count * data.mass),--120kg for container
		Elements  		= 
		{
			{
				Position	= {0,	0, 0},
				ShapeName	= "Hercules_Ammo_Pallet",
				IsAdapter	= true,
			}, 
			{
				DrawArgs =	
				{
					[1]	= {1,	1},
					[2]	= {2,	1},
				}, -- end of DrawArgs
				Position = {0,	0,	0},
				ShapeName =	data.contents,}},
		kind_of_shipping	=  1, --SUBMUNITION_AND_CONTAINER_SEPARATELY
		adapter_type		=  {wsType_Weapon, wsType_GContainer, wsType_Support,wsType_Ammo_Pallet},
	})
	-- return data
end

Ammo_Pallet_Contents({user_name = _("Ammo M151 Hydra HE*80 [4752lb]"), clsid = "Herc_Ammo_hydra_HE_rockets", contents = "{hydra_m151he}", count = 80,  mass = 27, wstype = {4, 7, 33, 147}}) -- M151 Hydra HE
Ammo_Pallet_Contents({user_name = _("Ammo M156 Hydra WP*80 [4752lb]"), clsid = "Herc_Ammo_hydra_WP_rockets", contents = "{hydra_m156}", count = 80,  mass = 27, wstype = {4, 7, 33, 148}}) -- M151 Hydra WP
--Ammo_Pallet_Contents({user_name = _(""), clsid = "Herc_Ammo__Rockets", contents = "", count = ,  mass = , wstype = {}}) --addname

---------------------------------------------------------------------------------------	
function Ammo_Pallet_Contents(main)
	local data = main
	declare_loadout({
		category 		= CAT_AIR_TO_AIR,
		CLSID	 		= data.clsid,
		wsTypeOfWeapon	= data.wstype,
		attribute		= {4,	4,	32,	wsType_Ammo_Pallet},
		Count 			= data.count,
		Cx_pil			= 0.0,
		Picture			= "Herc_Pallet.png",
		displayName		= data.user_name,
		Weight			= 120 + (data.count * data.mass),--120kg for container
		Elements  		= 
		{
			{
				Position	= {0,	0, 0},
				ShapeName	= "Hercules_Ammo_Pallet",
				IsAdapter	= true,
			}, 
			{
				DrawArgs =	
				{
					[1]	= {1,	1},
					[2]	= {2,	1},
				}, -- end of DrawArgs
				Position = {0,	0,	0},
				ShapeName =	data.contents,}},
		kind_of_shipping	=  1, --SUBMUNITION_AND_CONTAINER_SEPARATELY
		adapter_type		=  {wsType_Weapon, wsType_GContainer, wsType_Support,wsType_Ammo_Pallet},
	})
	-- return data
end

Ammo_Pallet_Contents({user_name = _("Ammo AIM-9M*30 [7128lb]"), clsid = "Herc_Ammo_AIM9M_missiles", contents = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}", count = 30,  mass = 158, wstype = {4,	4,	7,	22}}) --AIM-9M
Ammo_Pallet_Contents({user_name = _("Ammo AIM-9P5*30 [5676lb]"), clsid = "Herc_Ammo_AIM9P5_missiles", contents = "{AIM-9P5}", count = 30,  mass = 86, wstype = {4,	4,	7,	135}}) --AIM-9P5
Ammo_Pallet_Contents({user_name = _("Ammo AIM-9X*30 [5676lb]"), clsid = "Herc_Ammo_AIM9X_missiles", contents = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}", count = 30,  mass = 86, wstype = {4,	4,	7,	136}}) --AIM-9X
Ammo_Pallet_Contents({user_name = _("Ammo AIM-7M*24 [14995lb]"), clsid = "Herc_Ammo_AIM7M_missiles", contents = "{8D399DDA-FF81-4F14-904D-099B34FE7918}", count = 24,  mass = 284, wstype = {4,	4,	7,	21}}) --AIM-7M
Ammo_Pallet_Contents({user_name = _("Ammo AIM-120B*24 [11193lb]"), clsid = "Herc_Ammo_AIM120B_missiles", contents = "{C8E06185-7CD6-4C90-959F-044679E90751}", count = 24,  mass = 212, wstype = {4,	4,	7,	24}}) --AIM-120B
Ammo_Pallet_Contents({user_name = _("Ammo AIM-120C*24 [10665lb]"), clsid = "Herc_Ammo_AIM120C_missiles", contents = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}", count = 24,  mass = 212, wstype = {4,	4,	7,	106}}) --AIM-120C
Ammo_Pallet_Contents({user_name = _("Ammo R-60M*30 [2904lb]"), clsid = "Herc_Ammo_R60M_missiles", contents = "{682A481F-0CB5-4693-A382-D00DD4A156D7}", count = 30,  mass = 44, wstype = {4, 4, 7, 10}}) --r60m
Ammo_Pallet_Contents({user_name = _("Ammo Magic2*30 [5676lb]"), clsid = "Herc_Ammo_MAGIC2_missiles", contents = "{FC23864E-3B80-48E3-9C03-4DA8B1D7497B}", count = 30,  mass = 86, wstype = {4, 4, 7, 1}}) --magic2
Ammo_Pallet_Contents({user_name = _("Ammo R-27R*24 [13359lb]"), clsid = "Herc_Ammo_R27R_missiles", contents = "{9B25D316-0434-4954-868F-D51DB1A38DF0}", count = 24,  mass = 253, wstype = {4, 4, 7, 13}}) --r27r
Ammo_Pallet_Contents({user_name = _("Ammo R-27ER*24 [18480lb]"), clsid = "Herc_Ammo_R27ER_missiles", contents = "{E8069896-8435-4B90-95C0-01A03AE6E400}", count = 24,  mass = 350, wstype = {4, 4, 7, 14}}) --r27er
Ammo_Pallet_Contents({user_name = _("Ammo R-27T*24 [13359lb]"), clsid = "Herc_Ammo_R27T_missiles", contents = "{88DAC840-9F75-4531-8689-B46E64E42E53}", count = 24,  mass = 253, wstype = {4, 4, 7, 15}}) --r27t
Ammo_Pallet_Contents({user_name = _("Ammo R-27ET*24 [18480lb"), clsid = "Herc_Ammo_R27ET_missiles", contents = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}", count = 24,  mass = 349, wstype = {4, 4, 7, 16}}) --r27et
Ammo_Pallet_Contents({user_name = _("Ammo R-77*24 [9240lb]"), clsid = "Herc_Ammo_R77_missiles", contents = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}", count = 24,  mass = 175, wstype = {4, 4, 7, 19}}) --addname
Ammo_Pallet_Contents({user_name = _("Ammo Super 530D*24 [6480lb]"), clsid = "Herc_Ammo_S530D_missiles", contents = "{FD21B13E-57F3-4C2A-9F78-C522D0B5BCE1}", count = 24,  mass = 270, wstype = {4, 4, 7, Super_530D}}) --addname
Ammo_Pallet_Contents({user_name = _("Ammo AIM-54C*18 [18335lb]"), clsid = "Herc_Ammo_AIM54C_missiles", contents = "{7575BA0B-7294-4844-857B-031A144B2595}", count = 18,  mass = 463, wstype = {4, 4, 7, 23}}) --addname
---------------------------------------------------------------------------------------	
function Ammo_Pallet_Contents(main)
	local data = main
	declare_loadout({
		category 		= CAT_BOMBS,
		CLSID	 		= data.clsid,
		wsTypeOfWeapon	= data.wstype,
		attribute		= {4,	4,	32,	wsType_Ammo_Pallet},
		Count 			= data.count,
		Cx_pil			= 0.0,
		Picture			= "Herc_Pallet.png",
		displayName		= data.user_name,
		Weight			= 120 + (data.count * data.mass),--120kg for container
		Elements  		= 
		{
			{
				Position	= {0,	0, 0},
				ShapeName	= "Hercules_Ammo_Pallet",
				IsAdapter	= true,
			}, 
			{
				DrawArgs =	
				{
					[1]	= {1,	1},
					[2]	= {2,	1},
				}, -- end of DrawArgs
				Position = {0,	0,	0},
				ShapeName =	data.contents,}},
		kind_of_shipping	=  1, --SUBMUNITION_AND_CONTAINER_SEPARATELY
		adapter_type		=  {wsType_Weapon, wsType_GContainer, wsType_Support,wsType_Ammo_Pallet},
	})
	-- return data
end

Ammo_Pallet_Contents({user_name = _("Ammo GBU-10*6 [15340lb]"), clsid = "Herc_Ammo_GBU_10_bombs", contents = "{51F9AAE5-964F-4D21-83FB-502E3BFE5F8A}", count = 6,  mass = 1162, wstype = {4,	5,	36,	36}}) --GBU-10  
Ammo_Pallet_Contents({user_name = _("Ammo GBU-12*16 [9680lb]"), clsid = "Herc_Ammo_GBU_12_bombs", contents = "{DB769D48-67D7-42ED-A2BE-108D566C8B1E}", count = 16,  mass = 275, wstype = {4, 5, 36, 38}}) --GBU-12
Ammo_Pallet_Contents({user_name = _("Ammo GBU-16*10 [12408lb]"), clsid = "Herc_Ammo_GBU_16_bombs", contents = "{0D33DDAE-524F-4A4E-B5B8-621754FE3ADE}", count = 10,  mass = 564, wstype = {4,	5,	32,	31}})--GBU-16
Ammo_Pallet_Contents({user_name = _("Ammo GBU-31V/B*6 [12328lb]"), clsid = "Herc_Ammo_GBU_31_VB_bombs", contents = "{GBU-31}", count = 6,  mass = 934, wstype = {4,	5,	36,	85}})--GBU-31V/B
Ammo_Pallet_Contents({user_name = _("Ammo GBU-31V3B*6 [12949lb]"), clsid = "Herc_Ammo_GBU_31_V3B_bombs", contents = "{GBU-31V3B}", count = 6,  mass = 981, wstype = {4,	5,	36,	GBU_31_V_3B}})--GBU-31V3B
Ammo_Pallet_Contents({user_name = _("Ammo GBU-38*10 [6028lb]"), clsid = "Herc_Ammo_GBU_38_bombs", contents = "{GBU-38}", count = 10,  mass = 274, wstype = {4, 5, 36, 86}}) --GBU-38
Ammo_Pallet_Contents({user_name = _("Ammo CBU-87*10 [9460lb]"), clsid = "Herc_Ammo_CBU_87_bombs", contents = "{CBU-87}", count = 10,  mass = 430, wstype = {4, 5, 38, 77}}) --CBU-87
Ammo_Pallet_Contents({user_name = _("Ammo CBU-97*10 [10362lb]"), clsid = "Herc_Ammo_CBU_97_bombs", contents = "{5335D97A-35A5-4643-9D9B-026C75961E52}", count = 10,  mass = 471, wstype = {4, 5, 38,	35}}) --CBU-97
Ammo_Pallet_Contents({user_name = _("Ammo CBU-103*10 [10142lb]"), clsid = "Herc_Ammo_CBU_103_bombs", contents = "{CBU_103}", count = 10,  mass = 461, wstype = {4,	5,	38,	88}}) --GBU-103
Ammo_Pallet_Contents({user_name = _("Ammo CBU-105*10 [11022lb]"), clsid = "Herc_Ammo_CBU_105_bombs", contents = "{CBU_105}", count = 10,  mass = 501, wstype = {4,	5,	38,	87}}) --GBU-105
Ammo_Pallet_Contents({user_name = _("Ammo Mk-82*20 [10560lb]"), clsid = "Herc_Ammo_Mk_82_bombs", contents = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}", count = 20,  mass = 241, wstype = {4, 5, 9, 31}}) --Mk-82
Ammo_Pallet_Contents({user_name = _("Ammo Mk-82AIR*20 [11044lb]"), clsid = "Herc_Ammo_Mk_82AIR_bombs", contents = "{Mk82AIR}", count = 20,  mass = 241, wstype = {4, 5, 9, 75}}) --82AIR
Ammo_Pallet_Contents({user_name = _("Ammo Mk-82Snakeye*20 [11880lb]"), clsid = "Herc_Ammo_Mk_82Snake_bombs", contents = "{Mk82SNAKEYE}", count = 20,  mass = 241, wstype = {4, 5, 9, 79}}) --Mk_82Snake
Ammo_Pallet_Contents({user_name = _("Ammo Mk-83*10 [9834lb]"), clsid = "Herc_Ammo_Mk_83_bombs", contents = "{7A44FF09-527C-4B7E-B42B-3F111CFE50FB}", count = 10,  mass = 447, wstype = {4, 5,	9, 32}}) --MK-83
Ammo_Pallet_Contents({user_name = _("Ammo Mk-84*8 [15735b]"), clsid = "Herc_Ammo_Mk_84_bombs", contents = "{AB8B8299-F1CC-4359-89B5-2172E0CF4A5A}", count = 8,  mass = 894, wstype = {4,	5,	9,	33}}) --MK-84
Ammo_Pallet_Contents({user_name = _("Ammo FAB-100*20 [4400lb"), clsid = "Herc_Ammo_FAB100_bombs", contents = "{FB3CE165-BF07-4979-887C-92B87F13276B}", count = 20,  mass = 100, wstype = {4, 5, 9, 5}}) --fab100
Ammo_Pallet_Contents({user_name = _("Ammo FAB-250*20 [11000lb]"), clsid = "Herc_Ammo_FAB250_bombs", contents = "{3C612111-C7AD-476E-8A8E-2485812F4E5C}", count = 20,  mass = 250, wstype = {4, 5, 9, 6}}) --fab250
Ammo_Pallet_Contents({user_name = _("Ammo FAB-500*10 [11000lb]"), clsid = "Herc_Ammo_FAB500_bombs", contents = "{37DCC01E-9E02-432F-B61D-10C166CA2798}", count = 10,  mass = 500, wstype = {4, 5, 9, 7}}) --fab500
Ammo_Pallet_Contents({user_name = _("Ammo BetAB-500*10 [9460lb]"), clsid = "Herc_Ammo_BETAB500_bombs", contents = "{35B698AC-9FEF-4EC4-AD29-484A0085F62B}", count = 10,  mass = 430, wstype = {4, 5,	37,	3}}) --BETAB500
Ammo_Pallet_Contents({user_name = _("Ammo BetAB-500ShP*10 [9328lb]"), clsid = "Herc_Ammo_BETAB500SP_bombs", contents = "{BD289E34-DF84-4C5E-9220-4B14C346E79D}", count = 10,  mass = 424, wstype = {4,	5,	37,	4}}) --BETAB500sp
Ammo_Pallet_Contents({user_name = _("Ammo KAB-500kr*10 [12320lb]"), clsid = "Herc_Ammo_KAB500KR_bombs", contents = "{E2C426E3-8B10-4E09-B733-9CDC26520F48}", count = 10,  mass = 560, wstype = {4,	5,	36,	12}}) --kab500kr
Ammo_Pallet_Contents({user_name = _("Ammo RBK-250 PTAB-2.5M*20 [12012lb]"), clsid = "Herc_Ammo_RBK250PTAB25M_bombs", contents = "{4203753F-8198-4E85-9924-6F8FF679F9FF}", count = 20,  mass = 273, wstype = {4,	5,	38,	18}}) --rbk250 ptab2.5m
Ammo_Pallet_Contents({user_name = _("Ammo RBK-500-255 PTAB-10-5*10 [9394lb]"), clsid = "Herc_Ammo_RBK500255PTAB105_bombs", contents = "{D5435F26-F120-4FA3-9867-34ACE562EF1B}", count = 10,  mass = 427, wstype = {4,	5,	38,	20}}) --rbk500ptab10-5
Ammo_Pallet_Contents({user_name = _("Ammo RBK-500 PTAB-1M*10 [9394lb]"), clsid = "Herc_Ammo_RBK500PTAB1M_bombs", contents = "{7AEC222D-C523-425e-B714-719C0D1EB14D}", count = 10,  mass = 427, wstype = {4,	5,	38,	91}}) --rbk500 ptab 1m
Ammo_Pallet_Contents({user_name = _("Ammo M117*16 [11968lb]"), clsid = "Herc_Ammo_M117_bombs", contents = "{00F5DAC4-0466-4122-998F-B1A298E34113}", count = 16,  mass = 340, wstype = {4,	5,	9,	34}}) --m117
Ammo_Pallet_Contents({user_name = _("Ammo KMGU-2 - 96 AO-2.5RT*10 [11440lb]"), clsid = "Herc_Ammo_KMGU296AO25RT_bombs", contents = "{96A7F676-F956-404A-AD04-F33FB2C74884}", count = 10,  mass = 520, wstype = {4,	5,	32,	94}}) --kgmu-2 rt
Ammo_Pallet_Contents({user_name = _("Ammo KMGU-2 - 96 PTAB-2.5KO*10 [11440lb]"), clsid = "Herc_Ammo_KMGU296AO25KO_bombs", contents = "{96A7F676-F956-404A-AD04-F33FB2C74881}", count = 10,  mass = 520, wstype = {4,	5,	32,	94}}) --kgmu-2 ko
Ammo_Pallet_Contents({user_name = _("Ammo MK20*20 [9768lb]"), clsid = "Herc_Ammo_MK20_bombs", contents = "{ADD3FAE1-EBF6-4EF9-8EFC-B36B5DDF1E6B}", count = 20,  mass = 222, wstype = {4,	5,	38,	45}}) --MK20
Ammo_Pallet_Contents({user_name = _("Ammo SAB-100*20 [11000lb]"), clsid = "Herc_Ammo_SAB100_bombs", contents = "0511E528-EA28-4caf-A212-00D1408DF10A}", count = 20,  mass = 100, wstype = {4,	5,	49,	63}}) --sab-100
--Ammo_Pallet_Contents({user_name = _(""), clsid = "Herc_Ammo__bombs", contents = "", count = ,  mass = , wstype = {}}) --addname
--------------------------------------------------Hercules Cargo_Contents Container-----------------------------------------------------------------
local function Cargo_Contents(main)
	local t = main
	t.category			= CAT_BOMBS
	t.name				= t.user_name
	t.wsTypeOfWeapon	= {wsType_Weapon, wsType_Bomb, wsType_Bomb_Lighter, WSTYPE_PLACEHOLDER}
	t.type				= 0
	t.hMin				= 100.0
	t.hMax				= 10000.0
	t.VyHold			= -100.0
	t.Ag      			= -1.23
	t.shape_table_data =
	{
		{
			name     = t.name,
			file     = t.model,
			life     = 1,
			fire     = {0, 1},
			username = t.user_name,
			index    = WSTYPE_PLACEHOLDER,
		},
	}
	t.mass				= t.mass
	t.scheme			= "bomb-light"
	t.class_name		= "wAmmunitionBallute"
	t.fm = 
	{
		mass            = t.mass,
		caliber         = 0.273,
		cx_coeff        = {1.0, 0.29, 0.71, 0.14, 1.28},
		cx_factor       = t.cx_factor or 30000,
		L               = t.L or 2.21,
		I               = t.I or 94.425933,
		Ma              = 2.746331,
		Mw              = 2.146083,
		wind_time       = 1000.0,
		wind_sigma      = t.wind_sigma or 80.0
	}
    t.light =
    {
        start_time  = 3600,
        duration    = 2,
        light_position = {0.7, 0, 0},
        light_color = {1, 1, 0.8},
        light_attenuation = 750.0,
        smoke_position = {-0.7, 0, 0},
        smoke_color = {0.952, 0.952, 0.952},
        smoke_transparency = 200.0/255.0,
        smoke_width = 2,
    }
    
    t.control = 
    {
        delay_par   = 0.7,
    }
	t.targeting_data = 
	{	
		char_time = 21.02, 
	}
	declare_weapon(t)
	declare_loadout({
		category 		= CAT_PODS,
		CLSID	 		= t.clsid,
		attribute		= t.wsTypeOfWeapon,
		Count 			= t.Count or 1,
		Cx_pil			= 0,
		Picture			= t.CargoIcon,
		displayName		= t.user_name,
		Weight			= t.mass,
		Elements  		= {{ShapeName = t.model}},
	})
	return t
end

Cargo_Contents({user_name = _("Squad 30 x Soldier [7950lb]"), clsid = "Herc_Soldier_Squad", mass = 120, model = "Hercules_Paratrooper", CargoIcon = "Soldier.png", Count = 30, cx_factor = 3000, L = 5, I = 10, wind_sigma = 10})
Cargo_Contents({user_name = _("APC M1043 HMMWV Armament Air [7023lb]"), clsid = "Herc_APC_M1043_HMMWV_Armament_Air", mass = 3192, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--8797kg APC M1043 HMMWV Armament air
Cargo_Contents({user_name = _("APC M1043 HMMWV Armament Skid [6912lb]"), clsid = "Herc_APC_M1043_HMMWV_Armament_Skid", mass = 3142, model = "HMMWV_M1043", CargoIcon = "Herc_Mil_Vehicle.png"})--8797kg APC M1043 HMMWV Armament skid
Cargo_Contents({user_name = _("ATGM M1045 HMMWV TOW Air [7183lb]"), clsid = "Herc_ATGM_M1045_HMMWV_TOW_Air", mass = 3265, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("ATGM M1045 HMMWV TOW Skid [7073lb]"), clsid = "Herc_ATGM_M1045_HMMWV_TOW_Skid", mass = 3215, model = "HMMWV_M1045", CargoIcon = "Herc_Mil_Vehicle.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("AAA Vulcan M163 Air [21666lb]"), clsid = "Herc_AAA_Vulcan_M163_Air", mass = 9848, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("AAA Vulcan M163 Skid [21577lb]"), clsid = "Herc_AAA_Vulcan_M163_Skid", mass = 9808, model = "VULCAN", CargoIcon = "Herc_Mil_Vehicle.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("APC M1126 Stryker ICV [29542lb]"), clsid = "Herc_SPG_M1126_Stryker_ICV", mass = 13429, model = "M1126", CargoIcon = "Herc_Mil_Vehicle.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("SPG M1128 Stryker MGS [33036lb]"), clsid = "Herc_SPG_M1128_Stryker_MGS", mass = 15016, model = "M1128", CargoIcon = "Herc_Mil_Vehicle.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("ATGM M1134 Stryker [30337lb]"), clsid = "Herc_ATGM_M1134_Stryker", mass = 13790, model = "M1134", CargoIcon = "Herc_Mil_Vehicle.png"})--8797kg APC M1043 HMMWV Armament
Cargo_Contents({user_name = _("APC LAV-25 Air [22520lb]"), clsid = "Herc_APC_LAV_25_Air", mass = 10254, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--12792kg APC lav-25 Armament Air
Cargo_Contents({user_name = _("APC LAV-25 Skid [22514lb]"), clsid = "Herc_APC_LAV_25_Skid", mass = 10234, model = "lav-25", CargoIcon = "Herc_Mil_Vehicle.png"})--12792kg APC lav-25 Armament skid
Cargo_Contents({user_name = _("M1025 HMMWV Air [6160lb]"), clsid = "Herc_APC_M1025_HMMWV_Air", mass = 2800, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--3500kg Humvee Clean air
Cargo_Contents({user_name = _("M1025 HMMWV Skid [6050lb]"), clsid = "Herc_APC_M1025_HMMWV_Skid", mass = 2750, model = "HMMWV_M1025", CargoIcon = "Herc_Mil_Vehicle.png"})--3500kg Humvee Clean skid
Cargo_Contents({user_name = _("SAM Avenger M1097 Air [7200lb]"), clsid = "Herc_SAM_M1097_HMMWV_Air", mass = 3273, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--Humvee Avenger air
Cargo_Contents({user_name = _("SAM Avenger M1097 Skid [7090lb]"), clsid = "Herc_SAM_M1097_HMMWV_Skid", mass = 3223, model = "HMMWV_M973", CargoIcon = "Herc_Mil_Vehicle.png"})--Humvee Avenger skid
Cargo_Contents({user_name = _("APC Cobra Air [10912lb]"), clsid = "Herc_APC_COBRA_Air", mass = 4960, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--Cobra APC air
Cargo_Contents({user_name = _("APC Cobra Skid [10802lb]"), clsid = "Herc_APC_COBRA_Skid", mass = 4910, model = "Otokar_Cobra", CargoIcon = "Herc_Mil_Vehicle.png"})--Cobra APC skid
Cargo_Contents({user_name = _("APC M113 Air [21624lb]"), clsid = "Herc_APC_M113_Air", mass = 9830, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--M113 APC
Cargo_Contents({user_name = _("APC M113 Skid [21494lb]"), clsid = "Herc_APC_M113_Skid", mass = 9770, model = "m-113", CargoIcon = "Herc_Mil_Vehicle.png"})--M113 APC
Cargo_Contents({user_name = _("Tanker M978 HEMTT [34000lb]"), clsid = "Herc_Tanker_HEMTT", mass = 15455, model = "HEMTT", CargoIcon = "Herc_Mil_Vehicle.png"})--Hemtt Tanker
Cargo_Contents({user_name = _("HEMTT TFFT [34400lb]"), clsid = "Herc_HEMTT_TFFT", mass = 15634, model = "hemtt_fire", CargoIcon = "Herc_Mil_Vehicle.png"})--Hemtt GPU
Cargo_Contents({user_name = _("IFV M2A2 Bradley [34720lb]"), clsid = "Herc_IFV_M2A2_Bradley", mass = 15782, model = "m-2", CargoIcon = "Herc_Mil_Vehicle.png"})--M2A2 Bradley
Cargo_Contents({user_name = _("IFV MCV-80 [34720lb]"), clsid = "Herc_IFV_MCV80_Warrior", mass = 15782, model = "mcv-80", CargoIcon = "Herc_Mil_Vehicle.png"}) --MCV-80
Cargo_Contents({user_name = _("IFV BMP-1 [23232lb]"), clsid = "Herc_IFV_BMP_1", mass = 10560, model = "bmp-1", CargoIcon = "Herc_Mil_Vehicle.png"})--BMP-1
Cargo_Contents({user_name = _("IFV BMP-2 [25168lb]"), clsid = "Herc_IFV_BMP_2", mass = 11440, model = "bmp-2", CargoIcon = "Herc_Mil_Vehicle.png"}) --BMP-2
Cargo_Contents({user_name = _("IFV BMP-3 [32912lb]"), clsid = "Herc_IFV_BMP_3", mass = 14960, model = "BMP-3", CargoIcon = "Herc_Mil_Vehicle.png"}) --BMP-3
Cargo_Contents({user_name = _("ARV BRDM-2 Air [12320lb]"), clsid = "Herc_ARV_BRDM_2_Air", mass = 5600, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"}) --BRDM-2 AIR
Cargo_Contents({user_name = _("ARV BRDM-2 Skid [12210lb]"), clsid = "Herc_ARV_BRDM_2_Skid", mass = 5550, model = "brdm-2", CargoIcon = "Herc_Mil_Vehicle.png"}) --BRDM-2 Skid
Cargo_Contents({user_name = _("APC BTR-80 Air [23936lb]"), clsid = "Herc_APC_BTR_80_Air", mass = 10880, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"}) --BTR-80 air
Cargo_Contents({user_name = _("APC BTR-80 Skid [23826lb]"), clsid = "Herc_APC_BTR_80_Skid", mass = 10830, model = "BTR-80", CargoIcon = "Herc_Mil_Vehicle.png"}) --BTR-80 skid
Cargo_Contents({user_name = _("SAM ROLAND ADS [34720lb]"), clsid = "Herc_SAM_ROLAND_ADS", mass = 15782, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Mil_Vehicle.png"}) --Roland ADS
Cargo_Contents({user_name = _("SAM ROLAND LN [34720b]"), clsid = "Herc_SAM_ROLAND_LN", mass = 15782, model = "roland", CargoIcon = "Herc_Mil_Vehicle.png"}) --Roland LN
Cargo_Contents({user_name = _("SAM SA-13 STRELA [21624lb]"), clsid = "Herc_SAM_13", mass = 9830, model = "9a35", CargoIcon = "Herc_Mil_Vehicle.png"}) --SA-13
Cargo_Contents({user_name = _("AAA ZSU-23-4 Shilka [32912lb]"), clsid = "Herc_ZSU_23_4", mass = 14960, model = "zsu-23-4", CargoIcon = "Herc_Mil_Vehicle.png"}) --ZSU-23-4
Cargo_Contents({user_name = _("SAM SA-19 Tunguska 2S6 [34720lb]"), clsid = "Herc_SAM_19", mass = 15782, model = "2c6m", CargoIcon = "Herc_Mil_Vehicle.png"}) --SA-19
Cargo_Contents({user_name = _("Transport UAZ-469 Air [3747lb]"), clsid = "Herc_UAZ_469_Air", mass = 1700, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"}) --UAZ-469 air
Cargo_Contents({user_name = _("Transport UAZ-469 Skid [3630lb]"), clsid = "Herc_UAZ_469_Skid", mass = 1650, model = "uaz-469", CargoIcon = "Herc_Mil_Vehicle.png"}) --UAZ-469 skid
Cargo_Contents({user_name = _("Transport URAL-375 [14815lb]"), clsid = "Herc_URAL_375", mass = 6734, model = "Ural_4320_B", CargoIcon =  "Herc_Mil_Vehicle.png"}) --ural 375
Cargo_Contents({user_name = _("Transport M818 [16000lb]"), clsid = "Herc_M_818", mass = 7272, model = "m-818", CargoIcon =  "Herc_Mil_Vehicle.png"}) --m818
Cargo_Contents({user_name = _("Transport Tigr Air [15900lb]"), clsid = "Herc_TIGR_233036_Air", mass = 7200, model = "Hercules_Container_Parachute", CargoIcon =  "Herc_Container.png"}) --tigr air
Cargo_Contents({user_name = _("Transport Tigr Skid [15730lb]"), clsid = "Herc_TIGR_233036_Skid", mass = 7150, model = "Tigr_233036", CargoIcon =  "Herc_Mil_Vehicle.png"}) --tigr skid
Cargo_Contents({user_name = _("AAA GEPARD [34720lb]"), clsid = "Herc_AAA_GEPARD", mass = 15782, model = "Gepard", CargoIcon = "Herc_Mil_Vehicle.png"}) --Geopard
Cargo_Contents({user_name = _("SAM CHAPARRAL Air [21624lb]"), clsid = "Herc_SAM_CHAPARRAL_Air", mass = 9830, model = "Hercules_Container_Parachute", CargoIcon =  "Herc_Container.png"}) --chaparal air
Cargo_Contents({user_name = _("SAM CHAPARRAL Skid [21516lb]"), clsid = "Herc_SAM_CHAPARRAL_Skid", mass = 9780, model = "M48", CargoIcon =  "Herc_Mil_Vehicle.png"}) --chaparal skid
Cargo_Contents({user_name = _("SAM LINEBACKER [34720lb]"), clsid = "Herc_SAM_LINEBACKER", mass = 15782, model = "M6", CargoIcon = "Herc_Mil_Vehicle.png"}) --linebacker
Cargo_Contents({user_name = _("IFV MARDER [34720lb]"), clsid = "Herc_IFV_MARDER", mass = 15782, model = "marder", CargoIcon =  "Herc_Mil_Vehicle.png"}) --Geopard
Cargo_Contents({user_name = _("IFV TPZ FUCH [33440lb]"), clsid = "Herc_IFV_TPZ", mass = 15200, model = "TPZ", CargoIcon = "Herc_Mil_Vehicle.png"}) --tpz
Cargo_Contents({user_name = _("IFV BMD-1 Air [18040lb]"), clsid = "Herc_IFV_BMD1_Air", mass = 8200, model = "Hercules_Container_Parachute", CargoIcon =  "Herc_Container.png"}) --BMD-1 air
Cargo_Contents({user_name = _("IFV BMD-1 Skid [17930lb]"), clsid = "Herc_IFV_BMD1_Skid", mass = 8150, model = "bmd-1", CargoIcon =  "Herc_Mil_Vehicle.png"}) --BMD-1 skid
Cargo_Contents({user_name = _("IFV BTR-D Air [18040lb]"), clsid = "Herc_IFV_BTRD_Air", mass = 8200, model = "Hercules_Container_Parachute", CargoIcon =  "Herc_Container.png"}) --BTR-D air
Cargo_Contents({user_name = _("IFV BTR-D Skid [17930lb]"), clsid = "Herc_IFV_BTRD_Skid", mass = 8150, model = "btr-d", CargoIcon =  "Herc_Mil_Vehicle.png"}) --BTR-D skid
Cargo_Contents({user_name = _("ART 2S9 NONA Air [19140lb]"), clsid = "Herc_ART_NONA_Air", mass = 8700, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"}) --nona air
Cargo_Contents({user_name = _("ART 2S9 NONA Skid [19030lb]"), clsid = "Herc_ART_NONA_Skid", mass = 8650, model = "2-c9", CargoIcon = "Herc_Mil_Vehicle.png"}) --nona skid
Cargo_Contents({user_name = _("ART GVOZDIKA [34720lb]"), clsid = "Herc_ART_GVOZDIKA", mass = 15782, model = "2c1", CargoIcon = "Herc_Mil_Vehicle.png"}) --Geopard
Cargo_Contents({user_name = _("APC MTLB Air [26400lb]"), clsid = "Herc_APC_MTLB_Air", mass = 12000, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--MTLB
Cargo_Contents({user_name = _("APC MTLB Skid [26290lb]"), clsid = "Herc_APC_MTLB_Skid", mass = 11950, model = "MTLB", CargoIcon = "Herc_Mil_Vehicle.png"})--MTLB
Cargo_Contents({user_name = _("Generic Crate [20000lb]"), clsid = "Herc_GEN_CRATE", mass = 9071, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"}) --Generic
Cargo_Contents({user_name = _("EWR SBORKA Air [21624lb]"), clsid = "Herc_EWR_SBORKA_Air", mass = 9829, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"})--sborka air
Cargo_Contents({user_name = _("EWR SBORKA Skid [21624lb]"), clsid = "Herc_EWR_SBORKA_Skid", mass = 9829, model = "Sborka", CargoIcon = "Herc_Mil_Vehicle.png"})--sborka air
Cargo_Contents({user_name = _("APC BTR-82A Air [24998lb]"), clsid = "Herc_APC_BTR_82A_Air", mass = 11363, model = "Hercules_Container_Parachute", CargoIcon = "Herc_Container.png"}) --BTR-82A
Cargo_Contents({user_name = _("APC BTR-82A Skid [24888lb]"), clsid = "Herc_APC_BTR_82A_Skid", mass = 11313, model = "BTR-82A", CargoIcon = "Herc_Mil_Vehicle.png"}) --BTR-82A

--------------------------------------------------------------------------------------------------------- MOAB
GBU_43_B_MOAB = {
    category        = CAT_BOMBS,
    name            = "GBU-43/B(MOAB)",
    user_name       = _("GBU-43/B(MOAB)"),
    model           = "Hercules_GBU_43_B_Moab",
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    scheme          = "bomb-parashute",
    class_name      = "wAmmunitionBallute",
    type            = 0,
    mass            = 9800,
    hMin            = 300.0,
    hMax            = 12000.0,
    Cx              = 0.00124,
    VyHold          = -100.0,
    Ag              = -1.23,
    fm              = {
        mass        = 9800,    -- Empty weight with warhead, W/O fuel, kg
        caliber     = 1.03,  -- Calibre, meters
        cx_coeff    = {1.000000, 0.390000, 0.380000, 0.236000, 1.310000}, -- Cx
        L           = 9.2,  -- Length, meters
        I           = 426.4835, -- kgm2 - moment of inertia - I = 1/12 ML2
        Ma          = 2.746331,  -- dependence moment coefficient of  by  AoA angular acceleration  T / I   (??? can't solve for torque w/o knowing rotation)
        Mw          = 2.146083, --  rad/s  - 57.3°/s - dependence moment coefficient by angular velocity (|V|*sin(?))/|r| -  Mw  =  Ma * t   (???)
        wind_sigma  = 0, -- dispersion coefficient  mk81=80, mk82=80, mk83=150, mk84=220 ... heavier = harder to push with wind?
        cx_factor   = 20,
    },
    warhead         = {
        mass        = 9800;
        expl_mass   = 9800;
        other_factors = {1.0, 1.0, 1.0};
        obj_factors = {1, 1};
        concrete_factors = {1.0, 1.0, 1.0};
        cumulative_factor = 1;
        concrete_obj_factor = 1.0;
        cumulative_thickness = 1.0;
        piercing_mass = 1.0;
        caliber     = 103;   -- centimeters
    },
    control =
    {
        open_delay = 0.0,
    },
    shape_table_data = {
        {
            name    = "GBU_43_B_MOAB";
            file    = "Hercules_GBU_43_B_Moab";
            life    = 1;
            fire    = {0, 1};
            username = "GBU-43/B(MOAB)";
            index   = WSTYPE_PLACEHOLDER;
        },
    },
    targeting_data  = {
        char_time   = 21.60, -- characteristic time for sights
    },
}
declare_weapon(GBU_43_B_MOAB)

declare_loadout({
    category        = CAT_BOMBS,
    CLSID           = "Herc_GBU-43/B(MOAB)",
    attribute       = GBU_43_B_MOAB.wsTypeOfWeapon,
    Count           = 1,
    Cx_pil          = GBU_43_B_MOAB.Cx,
    Picture         = "Herc_Bomb.png",
    displayName     = GBU_43_B_MOAB.user_name,
    Weight          = GBU_43_B_MOAB.mass,
    Elements        =
    {
        {
        Position    = {0, 0, 0},
        ShapeName   = GBU_43_B_MOAB.model
        }
    },
})
--------------------------------------------------------------------------------------------------------- Fuel Tanks
local wsType_Herc_Ext_Fuel_Tank = 22048
declare_loadout(
 	{
 		category		= CAT_FUEL_TANKS,
 		CLSID			= "Herc_Ext_Fuel_Tank",
 		attribute		=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
 		Picture			= "Herc_ExtFuelTank.png",
 		displayName		= _("External Fuel Tank"),
 		-- Weight_Empty	= 94,	-- (207lb empty tank)
 		Weight_Empty	= 4131,	-- used as a counter weight until we learn how to fill it
 		Weight			= 4131,	-- (9107lb loaded = 207lb empty tank + 8900lb fuel )
		Capacity		= 4031 - 94,
 		Cx_pil			= 0.002,
 		shape_table_data =
 		{
 			{
 				name	= "HerculesExtFuelTank";
 				file	= "Hercules_ExtFuelTank";
 				life	= 1;
 				fire	= { 0, 1};
 				username	= "HerculesExtFuelTank";
 				index	= WSTYPE_PLACEHOLDER;
 			},
 		},
 		Elements	=
 		{
 			{
 				ShapeName	= "Hercules_ExtFuelTank",
 			},
 		},
 	}
)
-- Battle_Station
declare_loadout(
	{
		category	= CAT_PODS,
		CLSID		= "Herc_BattleStation",
		Picture		= "Herc_Battle_Station.png",
		displayName	= _("Battle Station"),
		Weight		= 1160,--300
		Cx_pil		= 0.0,
		attribute	= {4, 15, 44, WSTYPE_PLACEHOLDER},
		shape_table_data =
		{
			{
				name		= "HerculesBattleStation";
				file		= "Hercules_Battle_Station";
				life		= 1;
				fire		= {0, 1};
				username	= "HerculesBattleStation";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			[1]	= {
				Position	=	{0,	0,	0},
				ShapeName	=	"Hercules_Battle_Station",
			}, 
		}, -- end of Elements
	}
)

declare_loadout(
	{
		category	= CAT_PODS,
		CLSID		= "Herc_BattleStation_TGP",
		Picture		= "Herc_Battle_Station.png",
		displayName	= _("Battle Station with TGP"),
		Weight		= 1160,--300
		Cx_pil		= 0.0,
		attribute	= {4, 15, 44, WSTYPE_PLACEHOLDER},
		shape_table_data =
		{
			{
				name		= "HerculesBattleStationTGP";
				file		= "Hercules_Battle_Station_TGP";
				life		= 1;
				fire		= {0, 1};
				username	= "HerculesBattleStationTGP";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			[1]	= {
				Position	=	{0,	0,	0},
				ShapeName	=	"Hercules_Battle_Station_TGP",
			}, 
		}, -- end of Elements
	}
)

-- JATO_Rocket_Attachment
declare_loadout(
	{
 		category	= CAT_PODS,
		CLSID		= "Herc_JATO",
		Picture		= "Herc_JATO_Rocket_Attachment.png",
		displayName	= _("JATO"),
		Weight		= 200,
		Cx_pil		= 0.0,
 		attribute		=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		shape_table_data =
		{
			{
				name		= "HerculesJATO";
				file		= "Hercules_JATO";
				life		= 1;
				fire		= {0, 1};
				username	= "HerculesJATO";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			[1]	= {
				Position	=	{0,	0,	0},
				ShapeName	=	"Hercules_JATO",
			}, 
		}, -- end of Elements
	}
)



-- 105mm_Howitzer
function Howitzer(tbl)
	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "105mm_Howitzer"
	tbl.supply 	 = 
	{
		shells = {"M68_105_HE", "M68_105_HE"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 300,
	}
	tbl.gun = 
	{
		max_burst_length = 1,
		rates 			 = {1000000},
		recoil_coeff 	 = 1.5,
		barrels_count 	 = 1,
	}
	tbl.ejector_pos 			= {0.0, 0.0, 0.0}
	tbl.ejector_dir 			= {0.0, 0.0, 0.0}
	tbl.supply_position  		= {0.0, 0.0, 0.0}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 14000
	tbl.drop_cartridge 			= 0
	tbl.muzzle_pos				= {0.0, 0.0, 0.0}
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector
	tbl.azimuth_initial 		= tbl.azimuth_initial 
	tbl.elevation_initial 		= tbl.elevation_initial
	return declare_weapon(tbl)
end

declare_loadout(
	{
		category			=  CAT_PODS,
		CLSID				= "{Herc_105mm_Howitzer}",
		displayName			= _("105mm Howitzer"),
		Picture				=	"Herc_105mm_Howitzer.png",
		attribute			= {wsType_Weapon, wsType_GContainer, wsType_Cannon_Cont, WSTYPE_PLACEHOLDER},
		-- wsTypeOfWeapon		= {wsType_Weapon, wsType_Shell, wsType_Shell_A, wsTypeVulkan},
        -- Weight_Empty        = 1200,
        Weight_Empty        = 1200,
		Weight				= 1200 + (300 * 14.7), -- INCLUDE AMMO FOR FULL WEIGHT
		Cx_pil				= 0.001220703125,
		kind_of_shipping	= 2,--SOLID_MUNITION
		gun_mounts			= {
			Howitzer(
				{
					muzzle_pos_connector	= "Gun_point",
					azimuth_initial			= -1.570796326795, -- -0.04363323, -- 90 degs to the left
					elevation_initial			= 1.570796326795, -- -0.04363323, -- 90 degs to the left
				}
			)
		},
		shape_table_data =
		{
			{
				name		= "Hercules_105mm_Howitzer";
				file		= "Hercules_105mm_Howitzer";
				life		= 1;
				fire		= {0, 1};
				username	= "Hercules_105mm_Howitzer";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements = {
			[1]	= {
				Position	=	{0, 0, 0},
				ShapeName	=	"Hercules_105mm_Howitzer",
			}, 
		}, -- end of Elements
	}
)

-- 30mm GAU-23A chain gun
function GAU_23A_Chain_Gun(tbl)
	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "GAU_23A_Chain_Gun"
	tbl.supply 	 = 
	{
		shells = {"GAU8_30_AP", "GAU8_30_HE"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 600,
	}
	tbl.gun = 
	{
		max_burst_length = 1.0,
		rates 			 = {100000000000},
		recoil_coeff 	 = 1.0,
		barrels_count 	 = 1,
	}
	tbl.ejector_pos 			= {0.0, 0.0, 0.0}
	tbl.ejector_dir 			= {0.0, 0.0, 0.0}
	tbl.supply_position  		= {0.0, 0.0, 0.0}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 10000
	tbl.drop_cartridge 			= 0
	tbl.muzzle_pos				= {0.0, 0.0, 0.0}
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector
	tbl.azimuth_initial 		= tbl.azimuth_initial
	tbl.elevation_initial 		= tbl.elevation_initial
	return declare_weapon(tbl)
end

declare_loadout(
	{
		category			=  CAT_PODS,
		CLSID				= "{Herc_GAU_23A_Chain_Gun}",
		displayName			= _("GAU 23A Chain Gun (30mm)"),
		Picture				=	"Herc_GAU_23A_Chain_Gun.png",
		attribute			= {wsType_Weapon, wsType_GContainer, wsType_Cannon_Cont, WSTYPE_PLACEHOLDER},
		-- wsTypeOfWeapon		= {wsType_Weapon, wsType_Shell, wsType_Shell_A, wsTypeVulkan},
        Weight_Empty        = 600,
		Weight				= 600 + (600 * 0.360), -- INCLUDE AMMO FOR FULL WEIGHT
		Cx_pil				= 0.001220703125,
		kind_of_shipping	= 2,--SOLID_MUNITION
		gun_mounts			= {
			GAU_23A_Chain_Gun(
				{
					muzzle_pos_connector	= "Gun_point",
					azimuth_initial			= -1.570796326795, -- -0.04363323, -- 90 degs to the left
					elevation_initial			= 1.570796326795, -- -0.04363323, -- 90 degs to the left
				}
			)
		},
		shape_table_data =
		{
			{
				name		= "Hercules_GAU_23A_Chain_Gun";
				file		= "Hercules_GAU_23A_Chain_Gun";
				life		= 1;
				fire		= {0, 1};
				username	= "Hercules_GAU_23A_Chain_Gun";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements = {
			[1]	= {
				Position	=	{0, 0, 0},
				ShapeName	=	"Hercules_GAU_23A_Chain_Gun",
			}, 
		}, -- end of Elements
	}
)

-- 20mm M61_Vulcan_Rotary_Cannon
function M61_Vulcan_Rotary_Cannon(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "M61_Vulcan_Rotary_Cannon"
	tbl.supply 	 = 
	{
		shells = {"M61_20_AP", "M61_20_HE"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 8000,
	}
	tbl.gun = 
	{
		max_burst_length = 6,
		rates 			 = {6600},
		recoil_coeff 	 = 0.9,
		barrels_count 	 = 6,
	}
	tbl.ejector_pos 			= {0.0, 0.0, 0.0}
	tbl.ejector_dir 			= {0.0, 0.0, 0.0}
	tbl.supply_position  		= {0.0, 0.0, 0.0}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 7408
	tbl.drop_cartridge 			= 0
	tbl.muzzle_pos				= {0.0, 0.0, 0.0}
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector
	tbl.azimuth_initial 		= tbl.azimuth_initial
	tbl.elevation_initial 		= tbl.elevation_initial
	return declare_weapon(tbl)
end

declare_loadout(
	{
		category			=  CAT_PODS,
		CLSID				= "{Herc_M61_Vulcan_Rotary_Cannon}",
		displayName			= _("M61 Vulcan Rotary Cannon (20mm)"),
		Picture				=	"Herc_M61_Vulcan_Rotary_Cannon.png",
		attribute			= {wsType_Weapon, wsType_GContainer, wsType_Cannon_Cont, WSTYPE_PLACEHOLDER},
		-- wsTypeOfWeapon		= {wsType_Weapon, wsType_Shell, wsType_Shell_A, wsTypeVulkan},
        Weight_Empty        = 136,
		Weight				= 136 + (8000 * 0.1), -- INCLUDE AMMO FOR FULL WEIGHT
		Cx_pil				= 0.001220703125,
		kind_of_shipping	= 2,--SOLID_MUNITION
		gun_mounts			= {
			M61_Vulcan_Rotary_Cannon(
				{
					muzzle_pos_connector	= "Gun_point",
					azimuth_initial			= -1.570796326795, -- -0.04363323, -- 90 degs to the left
					elevation_initial		= 1.570796326795, -- -0.04363323, -- 90 degs to the left
				}
			)
		},
		shape_table_data =
		{
			{
				name		= "Hercules_M61_Vulcan_Rotary_Cannon";
				file		= "Hercules_M61_Vulcan_Rotary_Cannon";
				life		= 1;
				fire		= {0, 1};
				username	= "Hercules_M61_Vulcan_Rotary_Cannon";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements = {
			[1]	= {
				Position	=	{0, 0, 0},
				ShapeName	=	"Hercules_M61_Vulcan_Rotary_Cannon",
			}, 
		}, -- end of Elements
	}
)



