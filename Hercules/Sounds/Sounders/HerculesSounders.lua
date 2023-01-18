
HerculesCptHost = ED_AudioAPI.createHost(ED_AudioAPI.ContextCockpit, "Cockpit")
-- HerculesHeadsetHost = ED_AudioAPI.createHost(ED_AudioAPI.ContextHeadphones, "Headphones")
HerculesExtHost = ED_AudioAPI.createHost(ED_AudioAPI.ContextWorld, "World")
-- HerculesExt2DHost = ED_AudioAPI.createHost(ED_AudioAPI.ContextWorld2D, "World2D")

function onUpdate(params)
	-- updateHost(host, params)
	ED_AudioAPI.setHostPosition(HerculesExtHost, params.posx, params.posy, params.posz)
	ED_AudioAPI.setHostOrientation(HerculesExtHost, params.orienta, params.orientb, params.orientc, params.orientd)
	ED_AudioAPI.setHostVelocity(HerculesExtHost, params.velx, params.vely, params.velz)
	-- ED_AudioAPI.setHostTimestamp(HerculesExtHost, params.timestamp)
	-- ED_AudioAPI.setHostSonicBoom(host, ED_AudioAPI.SonicBoomAircraft, 1.0)
end

function onEvent_cockpitDestroy()
	ED_AudioAPI.destroyHost(HerculesCptHost)
	ED_AudioAPI.destroyHost(HerculesExtHost)
end

---------------------------------------------------------------------------------------Testing_Volume
-- local Click_Value1 = 0.0
-- local Click_Value2 = 0.0
-- local Click_Value3 = 0.0
-- local Click_Value4 = 0.0
-- local Click_Value5 = 0.0
-- local Click_Value6 = 0.0
-- local Click_Value7 = 0.0
-- local Click_Value8 = 0.0
-- local Click_Value9 = 0.0
-- local Click_Value10 = 0.0
-- function onEvent_Testing_Volume(Value1, Value2, Value3, Value4, Value5, Value6, Value7, Value8, Value9, Value10)
	-- Click_Value1 = Value1
	-- Click_Value2 = Value2
	-- Click_Value3 = Value3
	-- Click_Value4 = Value4
	-- Click_Value5 = Value5
	-- Click_Value6 = Value6
	-- Click_Value7 = Value7
	-- Click_Value8 = Value8
	-- Click_Value9 = Value9
	-- Click_Value10 = Value10
-- end
---------------------------------------------------------------------------------------DC_On
local DC_OnCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_DC_On")
local DC_On = false
function onEvent_DC_On(DC, Volume)
	ED_AudioAPI.setSourceGain(DC_OnCpt, Volume)
	if DC > 22.0 then
		if DC_On == false then					
			ED_AudioAPI.playSourceLooped(DC_OnCpt)
			DC_On = true
		end
	else
		if DC_On == true then					
			ED_AudioAPI.stopSource(DC_OnCpt)
			DC_On = false
		end
	end
end
---------------------------------------------------------------------------------------Avionics_Fan
local Avionics_Fan_StartCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Avionics_Fan_Start")
local Avionics_Fan_ContCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Avionics_Fan_Cont")
local Avionics_Fan_StopCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Avionics_Fan_Stop")
local Avionics_Fan_Start = false
local Avionics_Fan_Cont = false
local Avionics_Fan_Stop = false
function onEvent_Avionics_Fan(AC, Avionics_Fan_Speed, Volume)
	ED_AudioAPI.setSourceGain(Avionics_Fan_StartCpt, Volume)
	ED_AudioAPI.setSourceGain(Avionics_Fan_StopCpt, Volume)
	ED_AudioAPI.setSourceGain(Avionics_Fan_StartCpt, Volume)
	if AC > 112.0 then
		if Avionics_Fan_Start == false then					
			ED_AudioAPI.playSourceOnce(Avionics_Fan_StartCpt, 13.5 * Avionics_Fan_Speed)
			Avionics_Fan_Stop = false
			Avionics_Fan_Start = true
		end
		if Avionics_Fan_Speed > 0.99 then					
			if Avionics_Fan_Cont == false then					
				ED_AudioAPI.stopSource(Avionics_Fan_StartCpt)
				ED_AudioAPI.playSourceLooped(Avionics_Fan_ContCpt)
				Avionics_Fan_Cont = true
			end
		end
	else
		if Avionics_Fan_Stop == false then					
			ED_AudioAPI.stopSource(Avionics_Fan_StartCpt)
			ED_AudioAPI.stopSource(Avionics_Fan_ContCpt)
			ED_AudioAPI.playSourceOnce(Avionics_Fan_StopCpt, (-10.0 * Avionics_Fan_Speed) + 10.0)
			Avionics_Fan_Start = false
			Avionics_Fan_Cont = false
			Avionics_Fan_Stop = true
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------Aux Hyd Pump
local AuxHydPumpOnExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_AuxHydPumpOnExt")
local AuxHydPumpRunExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_AuxHydPumpRunExt")
local AuxHydPumpOffExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_AuxHydPumpOffExt")
local AuxHydPumpLoop = false
local AuxHydPumpPressLoop = 0
function onEvent_AuxHydPump(AC, ElecHydPump_Switch, ElecHydPump_PressSwitch, Volume)
	ED_AudioAPI.setSourceGain(AuxHydPumpOnExt, Volume)
	ED_AudioAPI.setSourceGain(AuxHydPumpRunExt, Volume)
	ED_AudioAPI.setSourceGain(AuxHydPumpOffExt, Volume)
	if ElecHydPump_Switch > 0 and AC > 100 then
		AuxHydPumpLoop = true
		if ElecHydPump_PressSwitch == 0 then
			if AuxHydPumpPressLoop == 0 then					
				ED_AudioAPI.playSourceOnce(AuxHydPumpOnExt)
				AuxHydPumpPressLoop = 1
			else
				if AuxHydPumpPressLoop < 80 then					
					AuxHydPumpPressLoop = AuxHydPumpPressLoop + 1
				else
					if AuxHydPumpPressLoop == 80 then					
						ED_AudioAPI.playSourceLooped(AuxHydPumpRunExt)
						AuxHydPumpPressLoop = 81
					end
				end
			end
		else
			if AuxHydPumpPressLoop == 81 then					
				ED_AudioAPI.stopSource(AuxHydPumpRunExt)
				ED_AudioAPI.playSourceOnce(AuxHydPumpOffExt)
				AuxHydPumpPressLoop = 0
			end
		end
	else
		if AuxHydPumpLoop == true and AuxHydPumpPressLoop > 0 then					
			ED_AudioAPI.stopSource(AuxHydPumpRunExt)
			ED_AudioAPI.playSourceOnce(AuxHydPumpOffExt)
			AuxHydPumpPressLoop = 0
			AuxHydPumpLoop = false
		else
			AuxHydPumpLoop = false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------CargoDoorsPump
local CargoDoorsPumpOnExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoDoorsPumpOnExt")
local CargoDoorsPumpRunExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoDoorsPumpRunExt")
local CargoDoorsPumpOffExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoDoorsPumpOffExt")
local CargoDoorsPumpLoop = false
local CargoDoorsPumpPressLoop = 0
function onEvent_CargoDoorsPump(AC, CargoDoorRamp_Operating, HydraulicPress, Volume)
	ED_AudioAPI.setSourceGain(CargoDoorsPumpOnExt, Volume)
	ED_AudioAPI.setSourceGain(CargoDoorsPumpRunExt, Volume)
	ED_AudioAPI.setSourceGain(CargoDoorsPumpOffExt, Volume)
	if CargoDoorRamp_Operating > 0 and AC > 100 then
		CargoDoorsPumpLoop = true
		if HydraulicPress > 0 then
			if CargoDoorsPumpPressLoop == 0 then					
				ED_AudioAPI.playSourceOnce(CargoDoorsPumpOnExt)
				CargoDoorsPumpPressLoop = 1
			else
				if CargoDoorsPumpPressLoop < 1100.0 then					
					CargoDoorsPumpPressLoop = CargoDoorsPumpPressLoop + 1
				else
					if CargoDoorsPumpPressLoop == 1100.0 then					
						ED_AudioAPI.playSourceLooped(CargoDoorsPumpRunExt)
						CargoDoorsPumpPressLoop = 1101.0
					end
				end
			end
		else
			if CargoDoorsPumpPressLoop == 1101.0 then					
				ED_AudioAPI.stopSource(CargoDoorsPumpRunExt)
				ED_AudioAPI.playSourceOnce(CargoDoorsPumpOffExt)
				CargoDoorsPumpPressLoop = 0
			end
		end
	else
		if CargoDoorsPumpLoop == true and CargoDoorsPumpPressLoop > 0 then					
			ED_AudioAPI.stopSource(CargoDoorsPumpRunExt)
			ED_AudioAPI.playSourceOnce(CargoDoorsPumpOffExt)
			CargoDoorsPumpPressLoop = 0
			CargoDoorsPumpLoop = false
		else
			CargoDoorsPumpLoop = false
		end
	end
end
---------------------------------------------------------------------------------------CargoDownLoadingFWD
local CargoDownLoadingFWDExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoDownLoadingFWDExt")
local CargoDownloadingFWD = false
function onEvent_CargoDownloadingFWD(Pallet_Loading, Volume)
	ED_AudioAPI.setSourceGain(CargoDownLoadingFWDExt, Volume)
	if Pallet_Loading > 0 then
		if CargoDownloadingFWD == false then					
			ED_AudioAPI.playSourceOnce(CargoDownLoadingFWDExt)
			CargoDownloadingFWD = true
		end
	else
		ED_AudioAPI.stopSource(CargoDownLoadingFWDExt)
		CargoDownloadingFWD = false
	end
end
---------------------------------------------------------------------------------------CargoDownLoadingMID
local CargoDownLoadingMIDExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoDownLoadingMIDExt")
local CargoDownloadingMID = false
function onEvent_CargoDownloadingMID(Pallet_Loading, Volume)
	ED_AudioAPI.setSourceGain(CargoDownLoadingMIDExt, Volume)
	if Pallet_Loading > 0 then
		if CargoDownloadingMID == false then					
			ED_AudioAPI.playSourceOnce(CargoDownLoadingMIDExt)
			CargoDownloadingMID = true
		end
	else
		ED_AudioAPI.stopSource(CargoDownLoadingMIDExt)
		CargoDownloadingMID = false
	end
end
---------------------------------------------------------------------------------------CargoDownLoadingAFT
local CargoDownLoadingAFTExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoDownLoadingAFTExt")
local CargoDownloadingAFT = false
function onEvent_CargoDownloadingAFT(Pallet_Loading, Volume)
	ED_AudioAPI.setSourceGain(CargoDownLoadingAFTExt, Volume)
	if Pallet_Loading > 0 then
		if CargoDownloadingAFT == false then					
			ED_AudioAPI.playSourceOnce(CargoDownLoadingAFTExt)
			CargoDownloadingAFT = true
		end
	else
		ED_AudioAPI.stopSource(CargoDownLoadingAFTExt)
		CargoDownloadingAFT = false
	end
end
---------------------------------------------------------------------------------------CargoUpLoadingFWD
local CargoUpLoadingFWDExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoUpLoadingFWDExt")
local CargoUpLoadingFWD = false
function onEvent_CargoUpLoadingFWD(Pallet_Loading, Volume)
	ED_AudioAPI.setSourceGain(CargoUpLoadingFWDExt, Volume)
	if Pallet_Loading > 0 then
		if CargoUpLoadingFWD == false then					
			ED_AudioAPI.playSourceOnce(CargoUpLoadingFWDExt)
			CargoUpLoadingFWD = true
		end
	else
		ED_AudioAPI.stopSource(CargoUpLoadingFWDExt)
		CargoUpLoadingFWD = false
	end
end
---------------------------------------------------------------------------------------CargoUpLoadingMID
local CargoUpLoadingMIDExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoUpLoadingMIDExt")
local CargoUpLoadingMID = false
function onEvent_CargoUpLoadingMID(Pallet_Loading, Volume)
	ED_AudioAPI.setSourceGain(CargoUpLoadingMIDExt, Volume)
	if Pallet_Loading > 0 then
		if CargoUpLoadingMID == false then					
			ED_AudioAPI.playSourceOnce(CargoUpLoadingMIDExt)
			CargoUpLoadingMID = true
		end
	else
		ED_AudioAPI.stopSource(CargoUpLoadingMIDExt)
		CargoUpLoadingMID = false
	end
end
---------------------------------------------------------------------------------------CargoUpLoadingAFT
local CargoUpLoadingAFTExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_CargoUpLoadingAFTExt")
local CargoUpLoadingAFT = false
function onEvent_CargoUpLoadingAFT(Pallet_Loading, Volume)
	ED_AudioAPI.setSourceGain(CargoUpLoadingAFTExt, Volume)
	if Pallet_Loading > 0 then
		if CargoUpLoadingAFT == false then					
			ED_AudioAPI.playSourceOnce(CargoUpLoadingAFTExt)
			CargoUpLoadingAFT = true
		end
	else
		ED_AudioAPI.stopSource(CargoUpLoadingAFTExt)
		CargoUpLoadingAFT = false
	end
end
---------------------------------------------------------------------------------------Paratroop_PortDoorCpt
local Paratroop_PortDoorCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Paratroop_DoorCpt")
local Paratroop_PortDoor_Open = false
local Paratroop_PortDoor_Close = false
function onEvent_Paratroop_PortDoor(Open, Close, Volume)
	ED_AudioAPI.setSourceGain(Paratroop_PortDoorCpt, Volume)
	if Open > 0 then
		if Paratroop_PortDoor_Open == false then					
			ED_AudioAPI.playSourceOnce(Paratroop_PortDoorCpt)
			Paratroop_PortDoor_Open = true
		end
	else
		Paratroop_PortDoor_Open = false
	end
	if Close > 0 then
		if Paratroop_PortDoor_Close == false then					
			ED_AudioAPI.playSourceOnce(Paratroop_PortDoorCpt)
			Paratroop_PortDoor_Close = true
		end
	else
		Paratroop_PortDoor_Close = false
	end
end
---------------------------------------------------------------------------------------Paratroop_StarboardDoorCpt
local Paratroop_StarboardDoorCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Paratroop_DoorCpt")
local Paratroop_StarboardDoor_Open = false
local Paratroop_StarboardDoor_Close = false
function onEvent_Paratroop_StarboardDoor(Open, Close, Volume)
	ED_AudioAPI.setSourceGain(Paratroop_StarboardDoorCpt, Volume)
	if Open > 0 then
		if Paratroop_StarboardDoor_Open == false then					
			ED_AudioAPI.playSourceOnce(Paratroop_StarboardDoorCpt)
			Paratroop_StarboardDoor_Open = true
		end
	else
		Paratroop_StarboardDoor_Open = false
	end
	if Close > 0 then
		if Paratroop_StarboardDoor_Close == false then					
			ED_AudioAPI.playSourceOnce(Paratroop_StarboardDoorCpt)
			Paratroop_StarboardDoor_Close = true
		end
	else
		Paratroop_StarboardDoor_Close = false
	end
end
---------------------------------------------------------------------------------------------------------------------------Air_Deflector
local AirDeflectorWindFadeInCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AirDeflectorWindFadeInCpt")
local AirDeflectorWindCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AirDeflectorWindCpt")
local AirDeflectorWindFadeOutCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AirDeflectorWindFadeOutCpt")
local AirDeflectorWindLoopStart = false
local AirDeflectorWindLoopRun = false
function onEvent_AirDeflector(AirDeflector_Pct, IAS, Volume)
	ED_AudioAPI.setSourceGain(AirDeflectorWindFadeInCpt, Volume)
	ED_AudioAPI.setSourceGain(AirDeflectorWindCpt, Volume)
	ED_AudioAPI.setSourceGain(AirDeflectorWindFadeOutCpt, Volume)
	if AirDeflector_Pct > 0 and IAS > 70.0 then
		if AirDeflectorWindLoopStart == false then					
			ED_AudioAPI.playSourceOnce(AirDeflectorWindFadeInCpt)
			AirDeflectorWindLoopStart = true
		end
		if AirDeflector_Pct > 0.5 then
			if AirDeflectorWindLoopRun == false then					
				ED_AudioAPI.playSourceLooped(AirDeflectorWindCpt)
				AirDeflectorWindLoopRun = true
			end
		end
	else
		if AirDeflectorWindLoopStart == true then					
			ED_AudioAPI.playSourceOnce(AirDeflectorWindFadeOutCpt, 0.3 * AirDeflector_Pct)
			ED_AudioAPI.stopSource(AirDeflectorWindFadeInCpt)
			ED_AudioAPI.stopSource(AirDeflectorWindCpt)
			AirDeflectorWindLoopStart = false
		end
		AirDeflectorWindLoopRun = false
	end
end
---------------------------------------------------------------------------------------------------------------------------Gear Operation
local GearExtendCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearExtendCpt")
local GearWindFadeInCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearWindFadeInCpt")
local GearWindCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearWindCpt")
local GearWindFadeOutCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearWindFadeOutCpt")
local GearRetractCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearRetractCpt")
local GearNoseTouchCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearNoseTouchCpt")
local GearLeftMainTouchCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearLeftMainTouchCpt")
local GearRightMainTouchCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_GearRightMainTouchCpt")
local GearWindLoop = false
local GearNoseTouchLoop = 0
local GearLeftMainTouchLoop = 0
local GearRightMainTouchLoop = 0
function onEvent_GearOper(GEAR_COMMAND, Gear_PRESS, NWStrutComp, LWStrutComp, RWStrutComp, IAS, Volume)
	ED_AudioAPI.setSourceGain(GearExtendCpt, Volume)
	ED_AudioAPI.setSourceGain(GearWindFadeInCpt, Volume - 0.4)
	ED_AudioAPI.setSourceGain(GearWindCpt, Volume - 0.4)
	ED_AudioAPI.setSourceGain(GearWindFadeOutCpt, Volume - 0.4)
	ED_AudioAPI.setSourceGain(GearRetractCpt, Volume)
	if IAS < 70 then					
		ED_AudioAPI.stopSource(GearWindCpt)
		ED_AudioAPI.setSourceGain(GearNoseTouchCpt, 0)
		ED_AudioAPI.setSourceGain(GearLeftMainTouchCpt, 0)
		ED_AudioAPI.setSourceGain(GearRightMainTouchCpt, 0)
	else
		ED_AudioAPI.setSourceGain(GearNoseTouchCpt, 0.3)
		ED_AudioAPI.setSourceGain(GearLeftMainTouchCpt, 0.25)
		ED_AudioAPI.setSourceGain(GearRightMainTouchCpt, 0.25)
		ED_AudioAPI.setSourceGain(GearNoseTouchCpt, Volume)
		ED_AudioAPI.setSourceGain(GearLeftMainTouchCpt, Volume)
		ED_AudioAPI.setSourceGain(GearRightMainTouchCpt, Volume)
	end
	if GEAR_COMMAND > 0 then
		if Gear_PRESS > 0 and Gear_PRESS < 0.4 then					
			if GearWindLoop == false then					
				ED_AudioAPI.playSourceOnce(GearExtendCpt)
				ED_AudioAPI.playSourceOnce(GearWindFadeInCpt)
				GearWindLoop = true
			end
		else
			if GearWindLoop == true then					
				ED_AudioAPI.playSourceLooped(GearWindCpt)
				GearWindLoop = false
			end
		end
		if NWStrutComp > 0.0 and GearNoseTouchLoop == 0 then					
			ED_AudioAPI.playSourceOnce(GearNoseTouchCpt)
			GearNoseTouchLoop = 1000
		else
			if NWStrutComp == 0.0 and GearNoseTouchLoop > 0 then					
				GearNoseTouchLoop = GearNoseTouchLoop - 1
			end
		end
		if LWStrutComp > 0.0 and GearLeftMainTouchLoop == 0  then					
			ED_AudioAPI.playSourceOnce(GearLeftMainTouchCpt)
			GearLeftMainTouchLoop = 1000
		else
			if LWStrutComp == 0.0 and GearLeftMainTouchLoop > 0 then					
				GearLeftMainTouchLoop = GearLeftMainTouchLoop - 1
			end
		end
		if RWStrutComp > 0.0 and GearRightMainTouchLoop == 0  then					
			ED_AudioAPI.playSourceOnce(GearRightMainTouchCpt)
			GearRightMainTouchLoop = 1000
		else
			if RWStrutComp == 0.0 and GearRightMainTouchLoop > 0 then					
				GearRightMainTouchLoop = GearRightMainTouchLoop - 1
			end
		end
	else
		if Gear_PRESS > 0 and Gear_PRESS < 0.4 then					
			if GearWindLoop == false then					
				ED_AudioAPI.stopSource(GearWindCpt)
				ED_AudioAPI.playSourceOnce(GearWindFadeOutCpt)
				GearWindLoop = true
			end
		else
			if GearWindLoop == true then					
				ED_AudioAPI.playSourceOnce(GearRetractCpt)
				GearWindLoop = false
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------APU
local APUstartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_APUstartExt")
local APUrunExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_APUrunExt")
local APUstopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_APUstopExt")
local StartAPU = false
local RunAPU = false
local StopAPU = false
function onEvent_APU(APU_Start_Sequence_Energized, APU_rpm, APU_stop, Volume)
	ED_AudioAPI.setSourceGain(APUstartExt, Volume)
	ED_AudioAPI.setSourceGain(APUrunExt, Volume)
	ED_AudioAPI.setSourceGain(APUstopExt, Volume)
	if APU_Start_Sequence_Energized > 0 then
		if StartAPU == false then					
			ED_AudioAPI.playSourceOnce(APUstartExt)
			StopAPU = false
			StartAPU = true
		end
		if APU_rpm > 0.99 then
			if RunAPU == false then					
				ED_AudioAPI.stopSource(APUstartExt)
				ED_AudioAPI.playSourceLooped(APUrunExt)
				RunAPU = true
			end
		end
	else
		if APU_stop > 0 then					
			if StopAPU == false then					
				ED_AudioAPI.stopSource(APUstartExt)
				ED_AudioAPI.stopSource(APUrunExt)
				ED_AudioAPI.playSourceOnce(APUstopExt, (-11.5 * APU_rpm) + 11.5)
				StartAPU = false
				RunAPU = false
				StopAPU = true
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------Engines

---------------------------------------------------------------------------------------Eng1Motoring
local Eng1MotoringStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1MotoringStartExt")
local Eng1MotoringContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1MotoringContExt")
local Eng1MotoringStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1MotoringStopExt")
local Eng1Motoring_Start = false
local Eng1Motoring_Cont = false
local Eng1Motoring_Stop = false
function onEvent_Eng1Motoring(Eng1Motoring, Eng1NP, Eng1Volume)
	ED_AudioAPI.setSourceGain(Eng1MotoringStartExt, Eng1Volume)
	ED_AudioAPI.setSourceGain(Eng1MotoringContExt, Eng1Volume)
	ED_AudioAPI.setSourceGain(Eng1MotoringStopExt, Eng1Volume)
	if Eng1Motoring == -1.0 then
		if Eng1Motoring_Start == false then					
			ED_AudioAPI.playSourceOnce(Eng1MotoringStartExt, 58.7 * Eng1NP)
			Eng1Motoring_Start = true
		end
		Eng1Motoring_Stop = false
		if Eng1NP > 0.1 then					
			if Eng1Motoring_Cont == false then					
				ED_AudioAPI.stopSource(Eng1MotoringStartExt)
				ED_AudioAPI.playSourceLooped(Eng1MotoringContExt)
				Eng1Motoring_Cont = true
			end
		end
	else
		if Eng1Motoring_Stop == false then					
			ED_AudioAPI.stopSource(Eng1MotoringStartExt)
			ED_AudioAPI.stopSource(Eng1MotoringContExt)
			ED_AudioAPI.playSourceOnce(Eng1MotoringStopExt, (-26.5 * Eng1NP) + 6.1)
			Eng1Motoring_Start = false
			Eng1Motoring_Cont = false
			Eng1Motoring_Stop = true
		end
	end
end
---------------------------------------------------------------------------------------Eng1
local Eng1EngineContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1EngineContExt")
local Eng1EngineStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1EngineStartExt")
local Eng1EngineStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1EngineStopExt")
local Eng1PropPowerCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Eng1PropPowerCpt")
local Eng1PropPowerExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1PropPowerExt")
local Eng1PropPowerRevSwitchExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1PropPowerRevSwitchExt")
local Eng1PropReverseExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng1PropReverseExt")
local StartEng1 = false
local StartedEng1 = false
local StopEng1 = false
local PowRevSwitchEng1 = false
function onEvent_Eng1(Eng1Start, Eng1Started, Eng1Stop, Eng1NP, Eng1NormalSpeedMode, Eng1LowSpeedMode, Eng1HotelMode, Eng1GroundRange_Engaged, Eng1Throttle_Beta_Reverse_Gate, Eng1ThrottleInput, Eng1Volume, Eng1ExtGain, Eng1CockpitGain, Eng1Pitch)
	if Eng1NP > 0.0 then
		if Eng1Start > 0.0 then
			if StartEng1 == false then					
				ED_AudioAPI.playSourceOnce(Eng1EngineStartExt)
				StartEng1 = true
				StartedEng1 = false
				StopEng1 = false
				PowRevSwitchEng1 = true
			end
			ED_AudioAPI.setSourceGain(Eng1EngineStartExt, Eng1Volume)
			ED_AudioAPI.setSourcePitch(Eng1EngineStartExt, Eng1Pitch)
		else
			if Eng1Started > 0.0 then
				if Eng1NormalSpeedMode > 0.0 and Eng1NP > 0.99 then					
					if StartedEng1 == false then					
						ED_AudioAPI.stopSource(Eng1EngineStartExt)
						ED_AudioAPI.playSourceLooped(Eng1EngineContExt)
						ED_AudioAPI.playSourceLooped(Eng1PropPowerExt)
						ED_AudioAPI.playSourceLooped(Eng1PropPowerCpt)
						ED_AudioAPI.playSourceLooped(Eng1PropReverseExt)
						StartedEng1 = true
					end
				else
					if Eng1LowSpeedMode > 0.0 and Eng1NP > 0.72 then					
						if StartedEng1 == false then					
							ED_AudioAPI.stopSource(Eng1EngineStartExt)
							ED_AudioAPI.playSourceLooped(Eng1EngineContExt)
							ED_AudioAPI.playSourceLooped(Eng1PropPowerExt)
							ED_AudioAPI.playSourceLooped(Eng1PropPowerCpt)
							ED_AudioAPI.playSourceLooped(Eng1PropReverseExt)
							StartedEng1 = true
						end
					else
						if Eng1HotelMode > 0.0 and Eng1NP > 0.24 then					
							if StartedEng1 == false then					
								ED_AudioAPI.stopSource(Eng1EngineStartExt)
								ED_AudioAPI.playSourceLooped(Eng1EngineContExt)
								ED_AudioAPI.playSourceLooped(Eng1PropPowerExt)
								ED_AudioAPI.playSourceLooped(Eng1PropPowerCpt)
								ED_AudioAPI.playSourceLooped(Eng1PropReverseExt)
								StartedEng1 = true
							end
						end
					end
				end
				ED_AudioAPI.setSourceGain(Eng1EngineContExt, Eng1Volume)
				ED_AudioAPI.setSourcePitch(Eng1EngineContExt, Eng1Pitch)
				if Eng1GroundRange_Engaged > 0.0 then
					if Eng1HotelMode == 0 then					
						if Eng1ThrottleInput <= 0.1 and Eng1NP > 0.71 and Eng1Throttle_Beta_Reverse_Gate > 0.0 then
							ED_AudioAPI.setSourceGain(Eng1PropPowerExt, Eng1ExtGain)
							ED_AudioAPI.setSourceGain(Eng1PropPowerCpt, 0.0)
							ED_AudioAPI.setSourceGain(Eng1PropReverseExt, Eng1ExtGain)
							PowRevSwitchEng1 = false
						else
							if PowRevSwitchEng1 == false then					
								ED_AudioAPI.setSourceGain(Eng1PropPowerRevSwitchExt, Eng1Volume)
								ED_AudioAPI.playSourceOnce(Eng1PropPowerRevSwitchExt)
								PowRevSwitchEng1 = true
							end
							if Eng1NP > 0.71 then					
								ED_AudioAPI.setSourceGain(Eng1PropPowerExt, Eng1ExtGain)
								ED_AudioAPI.setSourceGain(Eng1PropPowerCpt, 0.0)
							end
							ED_AudioAPI.setSourceGain(Eng1PropReverseExt, 0.0)
						end
					else
						ED_AudioAPI.setSourceGain(Eng1PropPowerExt, Eng1ExtGain)
						ED_AudioAPI.setSourceGain(Eng1PropPowerCpt, Eng1CockpitGain)
						ED_AudioAPI.setSourceGain(Eng1PropReverseExt, 0.0)
					end
				else
					ED_AudioAPI.setSourceGain(Eng1PropPowerExt, Eng1ExtGain)
					ED_AudioAPI.setSourceGain(Eng1PropPowerCpt, Eng1CockpitGain)
					ED_AudioAPI.setSourceGain(Eng1PropReverseExt, 0.0)
					PowRevSwitchEng1 = true
				end
			else
				if Eng1Stop > 0.0 then
					if StopEng1 == false then					
						ED_AudioAPI.stopSource(Eng1EngineStartExt)
						ED_AudioAPI.stopSource(Eng1EngineContExt)
						ED_AudioAPI.stopSource(Eng1PropPowerExt)
						ED_AudioAPI.stopSource(Eng1PropPowerCpt)
						ED_AudioAPI.stopSource(Eng1PropReverseExt)
						ED_AudioAPI.playSourceOnce(Eng1EngineStopExt, (-27.0 * Eng1NP) + 27.0)
						StartEng1 = false
						StartedEng1 = false
						StopEng1 = true
					end
					ED_AudioAPI.setSourceGain(Eng1EngineStopExt, Eng1Volume)
					ED_AudioAPI.setSourcePitch(Eng1EngineStopExt, Eng1Pitch)
				end
			end
		end
	end
end
---------------------------------------------------------------------------------------Eng2Motoring
local Eng2MotoringStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2MotoringStartExt")
local Eng2MotoringContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2MotoringContExt")
local Eng2MotoringStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2MotoringStopExt")
local Eng2Motoring_Start = false
local Eng2Motoring_Cont = false
local Eng2Motoring_Stop = false
function onEvent_Eng2Motoring(Eng2Motoring, Eng2NP, Eng2Volume)
	ED_AudioAPI.setSourceGain(Eng2MotoringStartExt, Eng2Volume)
	ED_AudioAPI.setSourceGain(Eng2MotoringContExt, Eng2Volume)
	ED_AudioAPI.setSourceGain(Eng2MotoringStopExt, Eng2Volume)
	if Eng2Motoring == -1.0 then
		if Eng2Motoring_Start == false then					
			ED_AudioAPI.playSourceOnce(Eng2MotoringStartExt, 58.7 * Eng2NP)
			Eng2Motoring_Start = true
		end
		Eng2Motoring_Stop = false
		if Eng2NP > 0.1 then					
			if Eng2Motoring_Cont == false then					
				ED_AudioAPI.stopSource(Eng2MotoringStartExt)
				ED_AudioAPI.playSourceLooped(Eng2MotoringContExt)
				Eng2Motoring_Cont = true
			end
		end
	else
		if Eng2Motoring_Stop == false then					
			ED_AudioAPI.stopSource(Eng2MotoringStartExt)
			ED_AudioAPI.stopSource(Eng2MotoringContExt)
			ED_AudioAPI.playSourceOnce(Eng2MotoringStopExt, (-26.5 * Eng2NP) + 6.1)
			Eng2Motoring_Start = false
			Eng2Motoring_Cont = false
			Eng2Motoring_Stop = true
		end
	end
end
---------------------------------------------------------------------------------------Eng2
local Eng2EngineContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2EngineContExt")
local Eng2EngineStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2EngineStartExt")
local Eng2EngineStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2EngineStopExt")
local Eng2PropPowerCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Eng2PropPowerCpt")
local Eng2PropPowerExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2PropPowerExt")
local Eng2PropPowerRevSwitchExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2PropPowerRevSwitchExt")
local Eng2PropReverseExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng2PropReverseExt")
local StartEng2 = false
local StartedEng2 = false
local StopEng2 = false
local PowRevSwitchEng2 = false
function onEvent_Eng2(Eng2Start, Eng2Started, Eng2Stop, Eng2NP, Eng2NormalSpeedMode, Eng2LowSpeedMode, Eng2HotelMode, Eng2GroundRange_Engaged, Eng2Throttle_Beta_Reverse_Gate, Eng2ThrottleInput, Eng2Volume, Eng2ExtGain, Eng2CockpitGain, Eng2Pitch)
	if Eng2NP > 0.0 then
		if Eng2Start > 0.0 then
			if StartEng2 == false then					
				ED_AudioAPI.playSourceOnce(Eng2EngineStartExt)
				StartEng2 = true
				StartedEng2 = false
				StopEng2 = false
				PowRevSwitchEng2 = true
			end
			ED_AudioAPI.setSourceGain(Eng2EngineStartExt, Eng2Volume)
			ED_AudioAPI.setSourcePitch(Eng2EngineStartExt, Eng2Pitch)
		else
			if Eng2Started > 0.0 then
				if Eng2NormalSpeedMode > 0.0 and Eng2NP > 0.99 then					
					if StartedEng2 == false then					
						ED_AudioAPI.stopSource(Eng2EngineStartExt)
						ED_AudioAPI.playSourceLooped(Eng2EngineContExt)
						ED_AudioAPI.playSourceLooped(Eng2PropPowerExt)
						ED_AudioAPI.playSourceLooped(Eng2PropPowerCpt)
						ED_AudioAPI.playSourceLooped(Eng2PropReverseExt)
						StartedEng2 = true
					end
				else
					if Eng2LowSpeedMode > 0.0 and Eng2NP > 0.72 then					
						if StartedEng2 == false then					
							ED_AudioAPI.stopSource(Eng2EngineStartExt)
							ED_AudioAPI.playSourceLooped(Eng2EngineContExt)
							ED_AudioAPI.playSourceLooped(Eng2PropPowerExt)
							ED_AudioAPI.playSourceLooped(Eng2PropPowerCpt)
							ED_AudioAPI.playSourceLooped(Eng2PropReverseExt)
							StartedEng2 = true
						end
					else
						if Eng2HotelMode > 0.0 and Eng2NP > 0.24 then					
							if StartedEng2 == false then					
								ED_AudioAPI.stopSource(Eng2EngineStartExt)
								ED_AudioAPI.playSourceLooped(Eng2EngineContExt)
								ED_AudioAPI.playSourceLooped(Eng2PropPowerExt)
								ED_AudioAPI.playSourceLooped(Eng2PropPowerCpt)
								ED_AudioAPI.playSourceLooped(Eng2PropReverseExt)
								StartedEng2 = true
							end
						end
					end
				end
				ED_AudioAPI.setSourceGain(Eng2EngineContExt, Eng2Volume)
				ED_AudioAPI.setSourcePitch(Eng2EngineContExt, Eng2Pitch)
				if Eng2GroundRange_Engaged > 0.0 then
					if Eng2HotelMode == 0 then					
						if Eng2ThrottleInput <= 0.1 and Eng2NP > 0.71 and Eng2Throttle_Beta_Reverse_Gate > 0.0 then
							ED_AudioAPI.setSourceGain(Eng2PropPowerExt, Eng2ExtGain)
							ED_AudioAPI.setSourceGain(Eng2PropPowerCpt, 0.0)
							ED_AudioAPI.setSourceGain(Eng2PropReverseExt, Eng2ExtGain)
							PowRevSwitchEng2 = false
						else
							if PowRevSwitchEng2 == false then					
								ED_AudioAPI.setSourceGain(Eng2PropPowerRevSwitchExt, Eng2Volume)
								ED_AudioAPI.playSourceOnce(Eng2PropPowerRevSwitchExt)
								PowRevSwitchEng2 = true
							end
							if Eng2NP > 0.71 then					
								ED_AudioAPI.setSourceGain(Eng2PropPowerExt, Eng2ExtGain)
								ED_AudioAPI.setSourceGain(Eng2PropPowerCpt, 0.0)
							end
							ED_AudioAPI.setSourceGain(Eng2PropReverseExt, 0.0)
						end
					else
						ED_AudioAPI.setSourceGain(Eng2PropPowerExt, Eng2ExtGain)
						ED_AudioAPI.setSourceGain(Eng2PropPowerCpt, Eng2CockpitGain)
						ED_AudioAPI.setSourceGain(Eng2PropReverseExt, 0.0)
					end
				else
					ED_AudioAPI.setSourceGain(Eng2PropPowerExt, Eng2ExtGain)
					ED_AudioAPI.setSourceGain(Eng2PropPowerCpt, Eng2CockpitGain)
					ED_AudioAPI.setSourceGain(Eng2PropReverseExt, 0.0)
					PowRevSwitchEng2 = true
				end
			else
				if Eng2Stop > 0.0 then
					if StopEng2 == false then					
						ED_AudioAPI.stopSource(Eng2EngineStartExt)
						ED_AudioAPI.stopSource(Eng2EngineContExt)
						ED_AudioAPI.stopSource(Eng2PropPowerExt)
						ED_AudioAPI.stopSource(Eng2PropPowerCpt)
						ED_AudioAPI.stopSource(Eng2PropReverseExt)
						ED_AudioAPI.playSourceOnce(Eng2EngineStopExt, (-27.0 * Eng2NP) + 27.0)
						StartEng2 = false
						StartedEng2 = false
						StopEng2 = true
					end
					ED_AudioAPI.setSourceGain(Eng2EngineStopExt, Eng2Volume)
					ED_AudioAPI.setSourcePitch(Eng2EngineStopExt, Eng2Pitch)
				end
			end
		end
	end
end
---------------------------------------------------------------------------------------Eng3Motoring
local Eng3MotoringStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3MotoringStartExt")
local Eng3MotoringContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3MotoringContExt")
local Eng3MotoringStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3MotoringStopExt")
local Eng3Motoring_Start = false
local Eng3Motoring_Cont = false
local Eng3Motoring_Stop = false
function onEvent_Eng3Motoring(Eng3Motoring, Eng3NP, Eng3Volume)
	ED_AudioAPI.setSourceGain(Eng3MotoringStartExt, Eng3Volume)
	ED_AudioAPI.setSourceGain(Eng3MotoringContExt, Eng3Volume)
	ED_AudioAPI.setSourceGain(Eng3MotoringStopExt, Eng3Volume)
	if Eng3Motoring == -1.0 then
		if Eng3Motoring_Start == false then					
			ED_AudioAPI.playSourceOnce(Eng3MotoringStartExt, 58.7 * Eng3NP)
			Eng3Motoring_Start = true
		end
		Eng3Motoring_Stop = false
		if Eng3NP > 0.1 then					
			if Eng3Motoring_Cont == false then					
				ED_AudioAPI.stopSource(Eng3MotoringStartExt)
				ED_AudioAPI.playSourceLooped(Eng3MotoringContExt)
				Eng3Motoring_Cont = true
			end
		end
	else
		if Eng3Motoring_Stop == false then					
			ED_AudioAPI.stopSource(Eng3MotoringStartExt)
			ED_AudioAPI.stopSource(Eng3MotoringContExt)
			ED_AudioAPI.playSourceOnce(Eng3MotoringStopExt, (-26.5 * Eng3NP) + 6.1)
			Eng3Motoring_Start = false
			Eng3Motoring_Cont = false
			Eng3Motoring_Stop = true
		end
	end
end
---------------------------------------------------------------------------------------Eng3
local Eng3EngineContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3EngineContExt")
local Eng3EngineStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3EngineStartExt")
local Eng3EngineStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3EngineStopExt")
local Eng3PropPowerCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Eng3PropPowerCpt")
local Eng3PropPowerExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3PropPowerExt")
local Eng3PropPowerRevSwitchExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3PropPowerRevSwitchExt")
local Eng3PropReverseExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng3PropReverseExt")
local StartEng3 = false
local StartedEng3 = false
local StopEng3 = false
local PowRevSwitchEng3 = false
function onEvent_Eng3(Eng3Start, Eng3Started, Eng3Stop, Eng3NP, Eng3NormalSpeedMode, Eng3LowSpeedMode, Eng3HotelMode, Eng3GroundRange_Engaged, Eng3Throttle_Beta_Reverse_Gate, Eng3ThrottleInput, Eng3Volume, Eng3ExtGain, Eng3CockpitGain, Eng3Pitch)
	if Eng3NP > 0.0 then
		if Eng3Start > 0.0 then
			if StartEng3 == false then					
				ED_AudioAPI.playSourceOnce(Eng3EngineStartExt)
				StartEng3 = true
				StartedEng3 = false
				StopEng3 = false
				PowRevSwitchEng3 = true
			end
			ED_AudioAPI.setSourceGain(Eng3EngineStartExt, Eng3Volume)
			ED_AudioAPI.setSourcePitch(Eng3EngineStartExt, Eng3Pitch)
		else
			if Eng3Started > 0.0 then
				if Eng3NormalSpeedMode > 0.0 and Eng3NP > 0.99 then					
					if StartedEng3 == false then					
						ED_AudioAPI.stopSource(Eng3EngineStartExt)
						ED_AudioAPI.playSourceLooped(Eng3EngineContExt)
						ED_AudioAPI.playSourceLooped(Eng3PropPowerExt)
						ED_AudioAPI.playSourceLooped(Eng3PropPowerCpt)
						ED_AudioAPI.playSourceLooped(Eng3PropReverseExt)
						StartedEng3 = true
					end
				else
					if Eng3LowSpeedMode > 0.0 and Eng3NP > 0.72 then					
						if StartedEng3 == false then					
							ED_AudioAPI.stopSource(Eng3EngineStartExt)
							ED_AudioAPI.playSourceLooped(Eng3EngineContExt)
							ED_AudioAPI.playSourceLooped(Eng3PropPowerExt)
							ED_AudioAPI.playSourceLooped(Eng3PropPowerCpt)
							ED_AudioAPI.playSourceLooped(Eng3PropReverseExt)
							StartedEng3 = true
						end
					else
						if Eng3HotelMode > 0.0 and Eng3NP > 0.24 then					
							if StartedEng3 == false then					
								ED_AudioAPI.stopSource(Eng3EngineStartExt)
								ED_AudioAPI.playSourceLooped(Eng3EngineContExt)
								ED_AudioAPI.playSourceLooped(Eng3PropPowerExt)
								ED_AudioAPI.playSourceLooped(Eng3PropPowerCpt)
								ED_AudioAPI.playSourceLooped(Eng3PropReverseExt)
								StartedEng3 = true
							end
						end
					end
				end
				ED_AudioAPI.setSourceGain(Eng3EngineContExt, Eng3Volume)
				ED_AudioAPI.setSourcePitch(Eng3EngineContExt, Eng3Pitch)
				if Eng3GroundRange_Engaged > 0.0 then
					if Eng3HotelMode == 0 then					
						if Eng3ThrottleInput <= 0.1 and Eng3NP > 0.71 and Eng3Throttle_Beta_Reverse_Gate > 0.0 then
							ED_AudioAPI.setSourceGain(Eng3PropPowerExt, Eng3ExtGain)
							ED_AudioAPI.setSourceGain(Eng3PropPowerCpt, 0.0)
							ED_AudioAPI.setSourceGain(Eng3PropReverseExt, Eng3ExtGain)
							PowRevSwitchEng3 = false
						else
							if PowRevSwitchEng3 == false then					
								ED_AudioAPI.setSourceGain(Eng3PropPowerRevSwitchExt, Eng3Volume)
								ED_AudioAPI.playSourceOnce(Eng3PropPowerRevSwitchExt)
								PowRevSwitchEng3 = true
							end
							if Eng3NP > 0.71 then					
								ED_AudioAPI.setSourceGain(Eng3PropPowerExt, Eng3ExtGain)
								ED_AudioAPI.setSourceGain(Eng3PropPowerCpt, 0.0)
							end
							ED_AudioAPI.setSourceGain(Eng3PropReverseExt, 0.0)
						end
					else
						ED_AudioAPI.setSourceGain(Eng3PropPowerExt, Eng3ExtGain)
						ED_AudioAPI.setSourceGain(Eng3PropPowerCpt, Eng3CockpitGain)
						ED_AudioAPI.setSourceGain(Eng3PropReverseExt, 0.0)
					end
				else
					ED_AudioAPI.setSourceGain(Eng3PropPowerExt, Eng3ExtGain)
					ED_AudioAPI.setSourceGain(Eng3PropPowerCpt, Eng3CockpitGain)
					ED_AudioAPI.setSourceGain(Eng3PropReverseExt, 0.0)
					PowRevSwitchEng3 = true
				end
			else
				if Eng3Stop > 0.0 then
					if StopEng3 == false then					
						ED_AudioAPI.stopSource(Eng3EngineStartExt)
						ED_AudioAPI.stopSource(Eng3EngineContExt)
						ED_AudioAPI.stopSource(Eng3PropPowerExt)
						ED_AudioAPI.stopSource(Eng3PropPowerCpt)
						ED_AudioAPI.stopSource(Eng3PropReverseExt)
						ED_AudioAPI.playSourceOnce(Eng3EngineStopExt, (-27.0 * Eng3NP) + 27.0)
						StartEng3 = false
						StartedEng3 = false
						StopEng3 = true
					end
					ED_AudioAPI.setSourceGain(Eng3EngineStopExt, Eng3Volume)
					ED_AudioAPI.setSourcePitch(Eng3EngineStopExt, Eng3Pitch)
				end
			end
		end
	end
end
---------------------------------------------------------------------------------------Eng4Motoring
local Eng4MotoringStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4MotoringStartExt")
local Eng4MotoringContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4MotoringContExt")
local Eng4MotoringStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4MotoringStopExt")
local Eng4Motoring_Start = false
local Eng4Motoring_Cont = false
local Eng4Motoring_Stop = false
function onEvent_Eng4Motoring(Eng4Motoring, Eng4NP, Eng4Volume)
	ED_AudioAPI.setSourceGain(Eng4MotoringStartExt, Eng4Volume)
	ED_AudioAPI.setSourceGain(Eng4MotoringContExt, Eng4Volume)
	ED_AudioAPI.setSourceGain(Eng4MotoringStopExt, Eng4Volume)
	if Eng4Motoring == -1.0 then
		if Eng4Motoring_Start == false then					
			ED_AudioAPI.playSourceOnce(Eng4MotoringStartExt, 58.7 * Eng4NP)
			Eng4Motoring_Start = true
		end
		Eng4Motoring_Stop = false
		if Eng4NP > 0.1 then					
			if Eng4Motoring_Cont == false then					
				ED_AudioAPI.stopSource(Eng4MotoringStartExt)
				ED_AudioAPI.playSourceLooped(Eng4MotoringContExt)
				Eng4Motoring_Cont = true
			end
		end
	else
		if Eng4Motoring_Stop == false then					
			ED_AudioAPI.stopSource(Eng4MotoringStartExt)
			ED_AudioAPI.stopSource(Eng4MotoringContExt)
			ED_AudioAPI.playSourceOnce(Eng4MotoringStopExt, (-26.5 * Eng4NP) + 6.1)
			Eng4Motoring_Start = false
			Eng4Motoring_Cont = false
			Eng4Motoring_Stop = true
		end
	end
end
---------------------------------------------------------------------------------------Eng4
local Eng4EngineContExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4EngineContExt")
local Eng4EngineStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4EngineStartExt")
local Eng4EngineStopExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4EngineStopExt")
local Eng4PropPowerCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Eng4PropPowerCpt")
local Eng4PropPowerExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4PropPowerExt")
local Eng4PropPowerRevSwitchExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4PropPowerRevSwitchExt")
local Eng4PropReverseExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_Eng4PropReverseExt")
local StartEng4 = false
local StartedEng4 = false
local StopEng4 = false
local PowRevSwitchEng4 = false
function onEvent_Eng4(Eng4Start, Eng4Started, Eng4Stop, Eng4NP, Eng4NormalSpeedMode, Eng4LowSpeedMode, Eng4HotelMode, Eng4GroundRange_Engaged, Eng4Throttle_Beta_Reverse_Gate, Eng4ThrottleInput, Eng4Volume, Eng4ExtGain, Eng4CockpitGain, Eng4Pitch)
	if Eng4NP > 0.0 then
		if Eng4Start > 0.0 then
			if StartEng4 == false then					
				ED_AudioAPI.playSourceOnce(Eng4EngineStartExt)
				StartEng4 = true
				StartedEng4 = false
				StopEng4 = false
				PowRevSwitchEng4 = true
			end
			ED_AudioAPI.setSourceGain(Eng4EngineStartExt, Eng4Volume)
			ED_AudioAPI.setSourcePitch(Eng4EngineStartExt, Eng4Pitch)
		else
			if Eng4Started > 0.0 then
				if Eng4NormalSpeedMode > 0.0 and Eng4NP > 0.99 then					
					if StartedEng4 == false then					
						ED_AudioAPI.stopSource(Eng4EngineStartExt)
						ED_AudioAPI.playSourceLooped(Eng4EngineContExt)
						ED_AudioAPI.playSourceLooped(Eng4PropPowerExt)
						ED_AudioAPI.playSourceLooped(Eng4PropPowerCpt)
						ED_AudioAPI.playSourceLooped(Eng4PropReverseExt)
						StartedEng4 = true
					end
				else
					if Eng4LowSpeedMode > 0.0 and Eng4NP > 0.72 then					
						if StartedEng4 == false then					
							ED_AudioAPI.stopSource(Eng4EngineStartExt)
							ED_AudioAPI.playSourceLooped(Eng4EngineContExt)
							ED_AudioAPI.playSourceLooped(Eng4PropPowerExt)
							ED_AudioAPI.playSourceLooped(Eng4PropPowerCpt)
							ED_AudioAPI.playSourceLooped(Eng4PropReverseExt)
							StartedEng4 = true
						end
					else
						if Eng4HotelMode > 0.0 and Eng4NP > 0.24 then					
							if StartedEng4 == false then					
								ED_AudioAPI.stopSource(Eng4EngineStartExt)
								ED_AudioAPI.playSourceLooped(Eng4EngineContExt)
								ED_AudioAPI.playSourceLooped(Eng4PropPowerExt)
								ED_AudioAPI.playSourceLooped(Eng4PropPowerCpt)
								ED_AudioAPI.playSourceLooped(Eng4PropReverseExt)
								StartedEng4 = true
							end
						end
					end
				end
				ED_AudioAPI.setSourceGain(Eng4EngineContExt, Eng4Volume)
				ED_AudioAPI.setSourcePitch(Eng4EngineContExt, Eng4Pitch)
				if Eng4GroundRange_Engaged > 0.0 then
					if Eng4HotelMode == 0 then					
						if Eng4ThrottleInput <= 0.1 and Eng4NP > 0.71 and Eng4Throttle_Beta_Reverse_Gate > 0.0 then
							ED_AudioAPI.setSourceGain(Eng4PropPowerExt, Eng4ExtGain)
							ED_AudioAPI.setSourceGain(Eng4PropPowerCpt, 0.0)
							ED_AudioAPI.setSourceGain(Eng4PropReverseExt, Eng4ExtGain)
							PowRevSwitchEng4 = false
						else
							if PowRevSwitchEng4 == false then					
								ED_AudioAPI.setSourceGain(Eng4PropPowerRevSwitchExt, Eng4Volume)
								ED_AudioAPI.playSourceOnce(Eng4PropPowerRevSwitchExt)
								PowRevSwitchEng4 = true
							end
							if Eng4NP > 0.71 then					
								ED_AudioAPI.setSourceGain(Eng4PropPowerExt, Eng4ExtGain)
								ED_AudioAPI.setSourceGain(Eng4PropPowerCpt, 0.0)
							end
							ED_AudioAPI.setSourceGain(Eng4PropReverseExt, 0.0)
						end
					else
						ED_AudioAPI.setSourceGain(Eng4PropPowerExt, Eng4ExtGain)
						ED_AudioAPI.setSourceGain(Eng4PropPowerCpt, Eng4CockpitGain)
						ED_AudioAPI.setSourceGain(Eng4PropReverseExt, 0.0)
					end
				else
					ED_AudioAPI.setSourceGain(Eng4PropPowerExt, Eng4ExtGain)
					ED_AudioAPI.setSourceGain(Eng4PropPowerCpt, Eng4CockpitGain)
					ED_AudioAPI.setSourceGain(Eng4PropReverseExt, 0.0)
					PowRevSwitchEng4 = true
				end
			else
				if Eng4Stop > 0.0 then
					if StopEng4 == false then					
						ED_AudioAPI.stopSource(Eng4EngineStartExt)
						ED_AudioAPI.stopSource(Eng4EngineContExt)
						ED_AudioAPI.stopSource(Eng4PropPowerExt)
						ED_AudioAPI.stopSource(Eng4PropPowerCpt)
						ED_AudioAPI.stopSource(Eng4PropReverseExt)
						ED_AudioAPI.playSourceOnce(Eng4EngineStopExt, (-27.0 * Eng4NP) + 27.0)
						StartEng4 = false
						StartedEng4 = false
						StopEng4 = true
					end
					ED_AudioAPI.setSourceGain(Eng4EngineStopExt, Eng4Volume)
					ED_AudioAPI.setSourcePitch(Eng4EngineStopExt, Eng4Pitch)
				end
			end
		end
	end
end
---------------------------------------------------------------------------------------TORocket
local TORocketStartExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_TORocketStartExt")
local TORocketEngineExt = ED_AudioAPI.createSource(HerculesExtHost, "External/Herc_TORocketEngineExt")
local TORocket = false
function onEvent_TORocket(Rocket_Assist_Triggered, Volume)
	if Rocket_Assist_Triggered > 0 then
		ED_AudioAPI.setSourceGain(TORocketStartExt, Volume)
		ED_AudioAPI.setSourceGain(TORocketEngineExt, Volume)
		if TORocket == false then					
			ED_AudioAPI.playSourceOnce(TORocketStartExt)
			ED_AudioAPI.playSourceLooped(TORocketEngineExt)
			TORocket = true
		end
	else
		ED_AudioAPI.stopSource(TORocketEngineExt)
		TORocket = false
	end
end
---------------------------------------------------------------------------------------Bell_Alarm
local Bell_AlarmCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_Bell_AlarmCpt")
local Bell_Alarm = false
function onEvent_Bell_Alarm(Bell_Alarm_state, Volume)
	if Bell_Alarm_state > 0 then
		ED_AudioAPI.setSourceGain(Bell_AlarmCpt, Volume)
		if Bell_Alarm == false then					
			ED_AudioAPI.playSourceLooped(Bell_AlarmCpt)
			Bell_Alarm = true
		end
	else
		if Bell_Alarm == true then					
			ED_AudioAPI.stopSource(Bell_AlarmCpt)
			Bell_Alarm = false
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------SpecialAlerts
local ICS_Volume = 0.0
function onEvent_ICS_Volume(ICS_Volume_Change)
	ICS_Volume = ICS_Volume_Change
end
---------------------------------------------------------------------------------------ICS_Testing_Sound
local ICS_TestingSoundCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_ICS_TestingSoundCpt")
local ICS_Testing_Sound = false
function onEvent_ICS_Testing(ICS_Sound_Testing)
	if ICS_Sound_Testing > 0 then
		ED_AudioAPI.setSourceGain(ICS_TestingSoundCpt, ICS_Volume)
		if ICS_Testing_Sound == false then					
			ED_AudioAPI.playSourceLooped(ICS_TestingSoundCpt)
			ICS_Testing_Sound = true
		end
	else
		if ICS_Testing_Sound == true then					
			ED_AudioAPI.stopSource(ICS_TestingSoundCpt)
			ICS_Testing_Sound = false
		end
	end
end
---------------------------------------------------------------------------------------Altitude Alert
local AlertAltitudeCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertAltitudeCpt")
local AltitudeAlert = false
function onEvent_AlertAltitude(AlertAltitude_Message)
	ED_AudioAPI.setSourceGain(AlertAltitudeCpt, ICS_Volume)
	if AlertAltitude_Message > 0 then
		if AltitudeAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertAltitudeCpt)
			AltitudeAlert = true
		end
	else
		if AltitudeAlert == true then					
			ED_AudioAPI.stopSource(AlertAltitudeCpt)
			AltitudeAlert = false
		end
	end
end
---------------------------------------------------------------------------------------Bankangle
local AlertBankangleCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertBankangleCpt")
local BankangleAlert = false
function onEvent_AlertBankangle(AlertBankangle_Message)
	ED_AudioAPI.setSourceGain(AlertBankangleCpt, ICS_Volume)
	if AlertBankangle_Message > 0 then
		if BankangleAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertBankangleCpt)
			BankangleAlert = true
		end
	else
		if BankangleAlert == true then					
			ED_AudioAPI.stopSource(AlertBankangleCpt)
			BankangleAlert = false
		end
	end
end
---------------------------------------------------------------------------------------Check Altitude
local AlertCheckAltitudeCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertCheckAltitudeCpt")
local CheckAltitudeAlert = false
function onEvent_AlertCheckAltitude(AlertCheckAltitude_Message)
	ED_AudioAPI.setSourceGain(AlertCheckAltitudeCpt, ICS_Volume)
	if AlertCheckAltitude_Message > 0 then
		if CheckAltitudeAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertCheckAltitudeCpt)
			CheckAltitudeAlert = true
		end
	else
		if CheckAltitudeAlert == true then					
			ED_AudioAPI.stopSource(AlertCheckAltitudeCpt)
			CheckAltitudeAlert = false
		end
	end
end
---------------------------------------------------------------------------------------Thousand to Go
local AlertThousandCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertThousandCpt")
local ThousandAlert = false
function onEvent_AlertThousand(AlertThousand_Message)
	ED_AudioAPI.setSourceGain(AlertThousandCpt, ICS_Volume)
	if AlertThousand_Message > 0 then
		if ThousandAlert == false then					
			ED_AudioAPI.playSourceOnce(AlertThousandCpt)
			ThousandAlert = true
		end
	else
		ThousandAlert = false
	end
end
---------------------------------------------------------------------------------------OverspeedAlert
local AlertOverspeedCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertOverspeedCpt")
local OverspeedAlert = false
function onEvent_AlertOverspeed(AlertOverspeed_Message)
	ED_AudioAPI.setSourceGain(AlertOverspeedCpt, ICS_Volume)
	if AlertOverspeed_Message > 0 then
		if OverspeedAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertOverspeedCpt)
			OverspeedAlert = true
		end
	else
		if OverspeedAlert == true then					
			ED_AudioAPI.stopSource(AlertOverspeedCpt)
			OverspeedAlert = false
		end
	end
end
---------------------------------------------------------------------------------------stickshakerAlert
local AlertStickShakerCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertStickShakerCpt")
local StickShakerAlert = false
function onEvent_AlertStickShaker(AlertStickShaker_Message)
	ED_AudioAPI.setSourceGain(AlertStickShakerCpt, ICS_Volume)
	if AlertStickShaker_Message > 0 then
		if StickShakerAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertStickShakerCpt)
			StickShakerAlert = true
		end
	else
		if StickShakerAlert == true then					
			ED_AudioAPI.stopSource(AlertStickShakerCpt)
			StickShakerAlert = false
		end
	end
end
---------------------------------------------------------------------------------------FLAPS (Voice) special alert
local AlertFlapsCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertFlapsCpt")
local FlapsAlert = false
function onEvent_AlertFlaps(FLAPS_Message)
	ED_AudioAPI.setSourceGain(AlertFlapsCpt, ICS_Volume)
	if FLAPS_Message > 0 then
		if FlapsAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertFlapsCpt)
			FlapsAlert = true
		end
	else
		if FlapsAlert == true then					
			ED_AudioAPI.stopSource(AlertFlapsCpt)
			FlapsAlert = false
		end
	end
end
---------------------------------------------------------------------------------------TOO LOW FLAPS (Voice) special alert
local AlertTooLowFlapsCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertTooLowFlapsCpt")
local FlapsTooLowAlert = false
function onEvent_AlertTooLowFlaps(FlapsTooLow_Message)
	ED_AudioAPI.setSourceGain(AlertTooLowFlapsCpt, ICS_Volume)
	if FlapsTooLow_Message > 0 then
		if FlapsTooLowAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertTooLowFlapsCpt)
			FlapsTooLowAlert = true
		end
	else
		if FlapsTooLowAlert == true then					
			ED_AudioAPI.stopSource(AlertTooLowFlapsCpt)
			FlapsTooLowAlert = false
		end
	end
end
---------------------------------------------------------------------------------------LANDING GEAR (Voice) special alert
local AlertGearCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertGearCpt")
local GearAlert = false
function onEvent_AlertGear(GearMessage)
	ED_AudioAPI.setSourceGain(AlertGearCpt, ICS_Volume)
	if GearMessage > 0 then
		if GearAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertGearCpt)
			GearAlert = true
		end
	else
		if GearAlert == true then					
			ED_AudioAPI.stopSource(AlertGearCpt)
			GearAlert = false
		end
	end
end
---------------------------------------------------------------------------------------StallAlert
local AlertStallCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertStallCpt")
local StallAlert = false
function onEvent_AlertStall(AlertStallMessage)
	ED_AudioAPI.setSourceGain(AlertStallCpt, ICS_Volume)
	if AlertStallMessage > 0 then
		if StallAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertStallCpt)
			StallAlert = true
		end
	else
		if StallAlert == true then					
			ED_AudioAPI.stopSource(AlertStallCpt)
			StallAlert = false
		end
	end
end
-------------------------------------------------------------------------------------AutoPilotAlert
local AlertAutoPilotCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertAutoPilotCpt")
local AutoPilotAlert = false
function onEvent_AlertAutoPilot(AlertAutoPilotMessage)
	ED_AudioAPI.setSourceGain(AlertAutoPilotCpt, ICS_Volume)
	if AlertAutoPilotMessage > 0 then
		if AutoPilotAlert == false then					
			ED_AudioAPI.playSourceLooped(AlertAutoPilotCpt)
			AutoPilotAlert = true
		end
	else
		if AutoPilotAlert == true then					
			ED_AudioAPI.stopSource(AlertAutoPilotCpt)
			AutoPilotAlert = false
		end
	end
end
-------------------------------------------------------------------------------------AutoThrottleAlert
local AlertAutoThrottleCpt = ED_AudioAPI.createSource(HerculesCptHost, "Cockpit/Herc_AlertAutoThrottleCpt")
local AutoThrottleAlert = false
function onEvent_AlertAutoThrottle(AlertAutoThrottleMessage)
	ED_AudioAPI.setSourceGain(AlertAutoThrottleCpt, ICS_Volume)
	if AlertAutoThrottleMessage > 0 then
		if AutoThrottleAlert == false then					
			ED_AudioAPI.playSourceOnce(AlertAutoThrottleCpt)
			AutoThrottleAlert = true
		end
	else
		AutoThrottleAlert = false
	end
end














