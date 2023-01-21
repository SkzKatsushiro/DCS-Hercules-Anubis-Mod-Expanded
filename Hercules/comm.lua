
io = data.base.io
table = data.base.table
tostring = data.base.tostring
type = data.base.type
getmetatable = data.base.getmetatable

local openFormation = true

function specialEvent(params)
	return staticParamsEvent(Message.wMsgLeaderSpecialCommand, params)
end

local menus = data.menus

data.rootItem = {
	name = _('Main'),
	getSubmenu = function(self)
		local tbl = {
			name = _('Main'),
			items = {}
		}

		if data.pUnit == nil or data.pUnit:isExist() == false then
			return tbl
		end

		if self.builders ~= nil then
			for index, builder in pairs(self.builders) do
				builder(self, tbl)
			end
		end

		if #data.menuOther.submenu.items > 0 then
			tbl.items[10] = {
				name = _('Other'),
				submenu = data.menuOther.submenu
			}
		end

		return tbl
	end,
	builders = {}
}

local parameters = {
	fighter = true,
	radar = true,
	ECM = true,
	refueling = true
}

local menus = data.menus

utils.verifyChunk(utils.loadfileIn('Scripts/UI/RadioCommandDialogPanel/Config/LockOnAirplane.lua', getfenv()))(parameters)

-- Wheel Chocks
menus['Ground air supply'] = {
	name = _('Ground air supply'),
	items = {
		[1] = {
			name = _('Connect air'),
			command = sendMessage.new(Message.wMsgLeaderGroundToggleAir, true)
		},
		[2] = {
			name = _('Disconnect air'),
			command = sendMessage.new(Message.wMsgLeaderGroundToggleAir, false)
		}
	}
}
menus['Ground Crew'].items[4] = { name = _('Ground air supply'), submenu = menus['Ground air supply']}
-- menus['Ground Crew'].items[5] = { name = _('Salute!'), command = sendMessage.new(Message.wMsgLeaderGroundGestureSalut, true)}
-- menus['Ground Crew'].items[6] = { name = _('Request Launch'), command = sendMessage.new(Message.wMsgLeaderGroundRequestLaunch, true)}