script_name("Luxwen-RP Extended")
script_version("02.13.04.23")
script_author("msssssx")

-- =================================================================================

local sampev	= require 'lib.samp.events'

-- =================================================================================

local filter = {
	"^{FFAF00}SMS:.+Cavallaro$",
	"^%[�������%]",
	"^{00a1fa}%[����������%] {ffffff}���� ������ ���������, ��������������: {00a1fa}vk%.com/luxwen_rp",
	"^{00a1fa}%[����������%] {ffffff}��������� ������, �� ������� ������� {00a1fa}�����%-������!",
	"^{00a1fa}%[����������%] {ffffff}��������� ���������� � ���� �� ������ ������ � {00a1fa}/donaterub",
	"^{00a1fa}%[����������%] {ffffff}��� ���������� �������� �����, ��������� �� ���� {00a1fa}www%.gta%-lux%.ru",
	"^{00a1fa}%[����������%] {ffffff}�� �������%? ������ ���: {00a1fa}vk%.com/vlad_30_2021",
	"^{00a1fa}%[����������%] {ffffff}������! ������� � 2 ���� �������! {FFFFFF}1 LVL = 50 ������%. 12 LVL = 600 ������%. �����������: {00a1fa}gta%-lux%.ru",
	"^{00a1fa}%[����������%] {ffffff}������� > {00a1fa}������� ������� %- /rub, ����� �������� ������ ��� �� 1 �����%-���!",
	"^{00a1fa}%[����������%] {ffffff}������������� ������� ������ �������� ����!",
	"^$",
	"^ $",
	"^{00a1fa}%[����������%] {ffffff}� �����!!!",
	"^{00a1fa}%[����������%] {ffffff}� �������, ��������� ��� %- {FFFF00}/ahelp{FFFFFF}%.",
	"^{00a1fa}%[����������%] {ffffff}� ���� ����� ������������ �� {FFFF00}4 ��� {FFFFFF}�������%. �� ����� ��������� �� {FFFF00}12 ��� {FFFFFF}�������%.",
	"^{00a1fa}%[����������%] {ffffff}� ����� �������� '�������� ����' ������, ������� {FFFF00}/gg %[id%]%.",
	"^{00a1fa}%[����������%] {ffffff}� ��������� �� ������� %({FF0000}/arep{FFFFFF}%)%. ���� �� ������ ������������ ������, �� ������ �������� ���������%.",
	"^{00a1fa}%[����������%] {ffffff}� ����������� ������� Luxwen Role Play ������ ��� ��������� �����������������%.",
	"^{00a1fa}%[����������%] {ffffff}� ������ ������� ��������� � ������� ������������� ���� �� ������!",
	"^{00a1fa}%[����������%] {ffffff}� ������������ � ����! %- luxwen%-rp%.ru",
	"^������ �������",
	"^%[A%] : %({005BBB}�����������{FFFFFF}%) khromov%[0%]: ������������ ����������� ������� FullDostup%.",
	"^%[A%] : %({005BBB}�����������{FFFFFF}%) khromov%[0%]: ����� � ������� ������ �������, ������ ���� � �� � �� ������!",
	"^%[A%] : %({005BBB}�����������{FFFFFF}%) khromov%[0%]: ���������%? �� ������ � �� vk%.com/khromovxgod",
	"^{FFFF00}%[���������%] {ffffff}�� ������� ���������� ������",
	"^{00a1fa}%[����������%] {ffffff}GTA%-LUX%.RU ���������� ��� ������ � ���������: {8BD032}194%.93%.2%.198:7777",
	"^{00a1fa}%[����������%] {ffffff}GTA%-LUX%.RU ���� ����������� ������ VK: {8BD032}vk%.com/luxwen_rp",
	"^{00a1fa}%[����������%] {ffffff}GTA%-LUX%.RU �����: {8BD032}luxwen%-rp%.ru",
	"^{00a1fa}%[����������%] {ffffff}GTA%-LUX%.RU �� ������ ������ ����� ����������%. �������: {8BD032}/donaterub",
	"^{00a1fa}%[����������%] {ffffff}����� � {FF9A30}��������� ���� �� 500 ������ � �� �������� 1150 �� ���� ��������!",
	"^{00a1fa}%[����������%] {ffffff}{FFFFFF}�������� �������������� ���������� ����� ��������%. ���������: {FFCC00}GTA%-LUX%.RU > �����",
	"^{FFFF00}%[���������%] {ffffff}{ffffff}����� ������� ��������� ����������� ������� Y ���� ������� {FFFF00}/inv",
	"^%[�����%] {ffffff}���������� ������� ������ ���������: {ffff00}/aprav{ffffff}%. �������� ������ �� ����������� �� ���������������!",
	"^{00a1fa}%[����������%] {ffffff}�� ������� {00FA9A}�����%-���{ffffff} �� �������� %+ �������! ����� ������ �������{00FA9A} /PR",
	"^{FFFF00}%[���������%] {ffffff}��� ��������� ������� ������� \"L%.Alt\"",
	"^{FFFF00}%[���������%] {ffffff}��� ����, ����� ��������� ������ �� �������, �������: \"/re off\" ��� ������� ������",
	"^{00a1fa}%[Luxwen%] {ffffff}AntiBot System by {7B68EE}khromov",
	"^{00a1fa}%[����������%] {ffffff}~ �������/������� �� {ff0000}25 {ffffff}������! {ffff00}�������� %- 750� {ffffff}/buyfull",
	"^��� |",
	"^  ����������"
}

-- =================================================================================

local victorina = {
	{"����� ����� ��������, ��� ����� �����", "4"},
	{"��� ��������� ������� �������� ����� ������� � \"������� ���������� ����\"", "2"},
	{"����� �������� ������������� � ������� �������", "2"},
	{"��� ����� ������� ��������� �����", "1"},
	{"������� ����� ������ ���� �� �����", "1"},
	{"������� �������� ���������� ����� ������� ������������ ����", "3"},
	{"����������� � ��� ����� ����", "4"},
	{"������� ������ � ���� ��������", "1"},
	{"��� ��������� ���� ����", "2"},
	{"��� �������� ������ \"�����\"", "1"},
	{"������� ����� ������ ���� �� ��� ��������� ��������", "2"},
	{"����� ������� ����� �������", "1"},
	{"������ ����� ���� ��������, ������� ��������� ��� � ������ ���������", "1"},
	{"������� ���� � ������� � ���������� ���", "2"},
	{"����� ������ ��� �������� ����������� ������ �� ������ 1921 ����", "2"},
	{"����� ������������ ��� ������ ������", "3"},
	{"������� ����� �� ����������� �����", "3"},
	{"������ ���� �������������� �������� ���%-�����", "3"},
	{"����� ������� ��������� � C�����", "1"},
	{"��� ���������� ������� ����� ���������������� ������ � �������", "1"},
	{"� ����� ������ ��������� ������ ����������� ���� 2016 ����", "3"},
	{"������ %- ������� ����� ������", "1"},
	{"����� ������ ���������� ������ ����� ��������", "4"},
	{"������� ����� ������ �������", "1"},
	{"� ����� ������ ��������� �����", "3"},
	{"������� ������ ���������", "2"},
	{"�� ����� ����� ������� ������ ����� ����� �� �����", "1"},
	{"����� ����� ������ ������ �����", "1"},
	{"����� ������� ��������� � C�����", "1"},
	{"������� ������ � ���������", "3"},
	{"� ����� ���� ����� ����� \"�������\"", "1"},
	{"����� ���� � �������", "1"},
	{"����� �������� ����������� ������ � ������ ��������", "3"},
	{"����� ����� ����������� ����� � ������� ��� �����", "4"},
	{"������� ���� � �����", "1"},
	{"�� ������ ������ ���������� �����", "1"},
	{"����� ������� � ����� ��������� ������� ����� �������", "1"},
	{"����� ������ �������� ����� ��������� � ����", "3"},
	{"� ����� ������ ���� ��������� ������ ����������� ����", "3"},
	{"����� ����� ������� �������� �� �����", "4"},
	{"������� ���� ������������ ������� �� ����", "3"},
	{"������� ����� ����� �� ����� ���", "4"},
	{"����� �������� ����� ������� �� �������� Porsche", "4"},
	{"� ����� ������ ����� ������� ���������� ����", "3"},
	{"������� ������� � ����������� �������", "2"},
	{"� ����� ��� ������, ������� ������ �� ������ � ����� �������", "4"},
	{"����� ����� ��������� ������� � ����� ��������� �������", "4"}
}

-- =================================================================================

local cmd_status = {[true] = "{32CD32}��������", [false] = "{FF0000}���������"}

-- =================================================================================

-- local stream_players = {}
-- for i = 1, 1000 do
	-- stream_players[i] = false
-- end

-- =================================================================================

local flags = {
	auto_victorina		= false,
	show_news			= false,
	show_victorina		= false
}

-- =================================================================================

function main()
	repeat wait(100) until isSampAvailable()

	autoupdate("https://raw.githubusercontent.com/msssssx/Luxwen-RP/main/version.json", '['..string.upper(thisScript().name)..']: ', "https://github.com/msssssx/Luxwen-RP/blob/main/Luxwen-RP.lua")

	while true do
		wait(0)
		-- local resX, resY = getScreenResolution()
	end

	wait(-1)
end



-- =================================================================================
-- ================================= �������� RPC ==================================
-- =================================================================================

function sampev.onPlayerStreamIn(playerId, team, model, position, rotation, color, fightingStyle)
	-- stream_players[playerId + 1] = true
	return {playerId, team, model, position, rotation, color, fightingStyle}
end

-- =================================================================================

function sampev.onPlayerStreamOut(playerId)
	-- stream_players[playerId + 1] = false
	return {playerId, team, model, position, rotation, color, fightingStyle}
end

-- =================================================================================

function sampev.onSendClickPlayer(playerId, source)
	sampSendChat("/re " .. playerId)
	return false
end

-- =================================================================================

function sampev.onSendCommand(cmd)
	if cmd:find("^/victorina") then
		flags.auto_victorina = not flags.auto_victorina
		sampAddChatMessage("�� " .. cmd_status[flags.auto_victorina] .. " {FFFFFF}���������� �� ���������.", 0xFFFFFFFF)
		return false
	elseif cmd:find("^/show_victorina") then
		flags.show_victorina = not flags.show_victorina
		sampAddChatMessage("�� " .. cmd_status[flags.show_victorina] .. " {FFFFFF}����������� ���������.", 0xFFFFFFFF)
		return false
	-- elseif cmd:find("^/test") then
		-- for k in pairs(stream_players) do
			-- if stream_players[k] then
				-- sampAddChatMessage(k - 1, -1)
			-- end
		-- end
		-- return false
	elseif cmd:find("^/show_news") then
		flags.show_news = not flags.show_news
		sampAddChatMessage("�� " .. cmd_status[flags.show_news] .. " {FFFFFF}����������� ��������.", 0xFFFFFFFF)
		return false
	end
	return {cmd}
end



-- =================================================================================
-- ============================== �������� ��������� ===============================
-- =================================================================================

function sampev.onServerMessage(color, text)
	-- sampAddChatMessage(color, -1)
	for k in pairs(filter) do
		if text:find(filter[k]) then
			return false
		end
	end


	if text:find("^{FFCC00}����������� ������ �������%.$") then
		sampSendChat("/rub")


	elseif not flags.show_news and text:find("^{FA8D20}.+ | �������: ") or text:find("^  {D16E0B}���������� ���������������") or text:find("^��� | ") or text:find("^  ���������� ��������") then
		return false


	elseif text:find("^{FFFF00}������������� .+ ����������� ��������") then
		local id = text:match("{FFFF00}.+(%d+)")
		sampSendChat("/g" .. id)


	elseif text:find("^%[A%] : %(.+%) .+%[%d+%]: .*") then -- /a
		local color, arank, name, id, message = text:match("^%[A%] : %({(.+)}(.+){FFFFFF}%) (.+)%[(%d+)%]:(.+)")
		sampAddChatMessage("[A] {" .. color .. "}[" .. arank .. "] {ff00ff}" .. name .. "[" .. id .. "]:{ffff00} " .. message, 0xff00ff)
		return false


	elseif text:find("^{00a1fa}���������:") then
		if flags.auto_victorina then
			if text:find("������� �����") then
				local calc_text = text:match("����� (.+)%?")
				lua_thread.create(function()
					wait(6500)
					sampSendChat(calculate(calc_text))
				end)
			else
				for k in pairs(victorina) do
					if text:find(victorina[k][1]) then
						lua_thread.create(function()
							wait(2000)
							sampSendChat(victorina[k][2])
						end)
					end
				end
			end
		end
		if not flags.show_victorina then
			return false
		end


	elseif not flags.show_victorina and (text:find("^{50C878}1%.") or text:find("^{00a1fa}%[����������%] {ffffff}�� ���������") or text:find("^{00a1fa}%[���������%] {F0EAD6}����� .+ ���������")) then
		return false


	elseif text:find("^%[ASMS%]") then
		local to, message, from = text:match("%[ASMS%] �������� � (.+): (.+)%. | �����������: (.+)%.")
		sampAddChatMessage("[A-SMS] {FF7700}" .. from .. " {FFFF00}� {FF7700}" .. to .. "{FFFF00}: " .. message, 0xFFFF00)
		return false


	elseif text:find("^%[A%] ������������� .+ ������� ������") then
		text = text:gsub("������ (.+): ", "������ %1: {FFFFFF}")


	elseif text:find("^%[A%] ����� ��������� .+:.+") then
		text = text:gsub("��������� (.+): ", "��������� %1: {FFFFFF}")


	elseif text:find("^%[A%]") or text:find("^{AFAFAF}%[A%]") then
		if text:find("^%[A%] ��������") then
			color = 0xFF0000FF
		elseif text:find("^{AFAFAF}%[A%] .+ ����� ������ ��") then
			local admin, id = text:match("{AFAFAF}%[A%] (.+) ����� ������ �� .+%[(%d+)%]")
			local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			if tonumber(id) == tonumber(myid) then
				sampAddChatMessage("========================================================", 0xFF0000)
				sampAddChatMessage("[A] ��������! �� ����� ������ ������������� " .. admin .. "!", 0xFF0000)
				sampAddChatMessage("========================================================", 0xFF0000)
			end
		end

		if color == -1347440726 or color == -1347440641 or color == -1007741441 or text:find("%[%d+ HP%]$") then
			color = 0xFFFFFFFF
			if not text:find("^{656565}") and not text:find("^{AFAFAF}") then
				text = "{656565}" .. text
			end
		end
		text = text:gsub("{AFAFAF}", "{656565}")
	end

	return {color, text}
end



-- =================================================================================
-- =================================== ������� =====================================
-- =================================================================================

function calculate(text)
	if text:find('%d+%%%*%d+') then
		local number1, number2 = text:match('(%d+)%%%*(%d+)')
		local number = number1*number2/100
	end
	if text:find('%d+%%%/%d+') then
		local number1, number2 = text:match('(%d+)%%%/(%d+)')
		local number = number2/number1*100
	end
	if text:find('%d+/%d+%%') then
		local number1, number2 = text:match('(%d+)/(%d+)%%')
		local number = number1*100/number2
	end
	local ok, number = pcall(load('return '..text))
	return number
end

-- =================================================================================

function sampGetPlayerIdByNickname(nick)
	nick = tostring(nick)
	local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
	if nick == sampGetPlayerNickname(myid) then
		return myid
	end
	for i = 0, sampGetMaxPlayerId() do
		if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == nick then
			return i
		end
	end
end

-- =================================================================================
-- ================================== ���������� ===================================
-- =================================================================================
-- Author: http://qrlk.me/samp

function autoupdate(json_url, prefix, url)
	local dlstatus = require('moonloader').download_status
	local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
	if doesFileExist(json) then os.remove(json) end
	downloadUrlToFile(json_url, json,
		function(id, status, p1, p2)
			if status == dlstatus.STATUSEX_ENDDOWNLOAD then
				if doesFileExist(json) then
					local f = io.open(json, 'r')
					if f then
						local info = decodeJson(f:read('*a'))
						updatelink = info.updateurl
						updateversion = info.latest
						f:close()
						os.remove(json)
						if updateversion ~= thisScript().version then
							lua_thread.create(function(prefix)
								local dlstatus = require('moonloader').download_status
								local color = -1
								sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion), color)
								wait(250)
								downloadUrlToFile(updatelink, thisScript().path,
									function(id3, status1, p13, p23)
										if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
											print(string.format('��������� %d �� %d.', p13, p23))
										elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
											print('�������� ���������� ���������.')
											sampAddChatMessage((prefix..'���������� ���������!'), color)
											goupdatestatus = true
											lua_thread.create(function() wait(500) thisScript():reload() end)
										end
										if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
											if goupdatestatus == nil then
												sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
												update = false
											end
										end
									end
								)
								end, prefix
							)
						else
							update = false
							print('v'..thisScript().version..': ���������� �� ���������.')
						end
					end
				else
					print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
					update = false
				end
			end
		end
	)
	while update ~= false do wait(100) end
end