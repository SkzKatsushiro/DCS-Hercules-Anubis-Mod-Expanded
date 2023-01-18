
dofile(LockOn_Options.common_script_path.."tools.lua")
	

local mdir      = lfs.tempdir()
local cfile     = lfs.writedir()..'Data\\tempMission.lua'
local userPath  = lfs.writedir()..'Data\\'

function scandir(directory)
	local i, t = 0, {}
	for file in lfs.dir(directory) do
		if string.match(file, "~mis") then
			i = i + 1
			t[i] = directory .. file
		end
	end
	return t
end

function findMissionFile(fileList)
	local correctFile = 0
	local newest = 0
	local file_attr

	for fileNumber, filepath in pairs(fileList) do
	
		file = io.open(filepath, "r") 
	
		local fLine = file:read()
		
		if string.match(fLine, "mission") then
			file_attr = lfs.attributes(filepath)
			if file_attr.modification > newest then
				correctFile = filepath
				newest = file_attr.modification
			end
		end
		if file then
		file:close()
		end
	end
	return correctFile
	
end

function copyFile(fpath, cpath)
	infile = io.open(fpath, "r")
	instr = infile:read("*a")
	infile:close()

	outfile = io.open(cpath, "w+")
	outfile:write(instr)
	outfile:close()
end


function load_Tempmission_file()

	local fList = scandir(mdir)
	local rf 	= findMissionFile(fList)
	if rf ~= 0 then
		copyFile(rf, cfile)
		dofile(userPath..'tempMission.lua')
	end


end






