script_name("Luxwen-RP Extended")
script_version("05.17.04.23")
script_author("msssssx")

-- =================================================================================
-- ================================== ���������� ===================================
-- =================================================================================

local sampev	= require 'lib.samp.events'
local keys		= require 'lib.vkeys'
local inicfg	= require 'inicfg'
local font_flag = require('moonloader').font_flag

-- =================================================================================
-- ==================================== ������ =====================================
-- =================================================================================

local filter = {
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
	"^{FFAF00}SMS: {FFF700}������, ����, ������� �������� ����� ����� ��� ������ �� ���������%? {FFAF00}| {FFF700}�����������: Cavallaro$",
	"^{FFAF00}SMS: {FFF700}�� ���� ������� �������������� �� ������! {FFAF00}| {FFF700}�����������: Cavallaro$",
	"^{FFAF00}SMS: {FFF700}�� � ���������� /gps %- 5 %- \"��������� ����������\"%. {FFAF00}| {FFF700}�����������: Cavallaro$",
	"^{FFAF00}SMS: {FFF700}������ �������%. �� �� ������� �������� � ������� � ������� /coins%. {FFAF00}| {FFF700}�����������: Cavallaro$",
	"^������������� .+: ����� ������� ������� ������ � ���! ���������� ���� ����� � /buyadm$",
	"^������������� .+: ��� ���������� ����� ��������� �� ��� ���� %- gta%-lux%.ru, ������ %- �����$",
	"^������������� .+: ��������� �2 ����� ������� 500 ������ 1150 :%)$",
	"^������������� .+: ���� �������� ���� � ������������� ���������������� �� ����� ������� :%)$",
	"^{FFFF00}%[���������%] {ffffff}�� ���������� �� ������ �� ������$",
	"^�� �����!$"
}

-- =================================================================================
-- ================================== ��������� ====================================
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
-- ===================================== ����� =====================================
-- =================================================================================


local flags = {
	auto_victorina		= false,
	show_news			= false,
	show_victorina		= false,
	is_spectator		= false,
	active_check_bot	= false,
	is_player_bot		= false,
	check_report		= false,
	check_admins		= true,
	is_show_dialog		= false
}

-- =================================================================================
-- ================================== ���������� ===================================
-- =================================================================================

local admins = {}		-- = {job, nick, awarn, lvl}
for i = 1, 1000 do
	admins[i] = {"", "", 0, 0}
end
local report		= {nick, id, text}
local font			= renderCreateFont('Arial', 10, font_flag.BOLD + font_flag.SHADOW)
local cmd_status	= {[true] = "{32CD32}��������", [false] = "{FF0000}���������"}
-- local stream_players = {}
-- for i = 1, 1000 do
	-- stream_players[i] = false
-- end

-- =================================================================================
-- ================================ ������� ������� ================================
-- =================================================================================

function main()
	repeat wait(100) until isSampAvailable()

	autoupdate("https://raw.githubusercontent.com/msssssx/Luxwen-RP/main/version.json", '['..string.upper(thisScript().name)..']: ', "https://raw.githubusercontent.com/msssssx/Luxwen-RP/main/Luxwen-RP.lua")

	while true do
		if flags.is_spectator and not sampIsChatInputActive() and wasKeyPressed(keys.VK_SPACE) then -- ����� �� ���������� �������� �������
			sampSendChat("/re off")
		end
		local x = 1000
		local y = 400
		-- for k in pairs(admins) do
			-- renderFontDrawText(font, 'Colors:\n{FF0000}Red\n{00FF00}Green\n{0000FF}Blue\n{80FFFFFF}Transparent white', x, y + 20, 0xFFFFFFFF)
		-- end
		wait(0)
		-- local resX, resY = getScreenResolution()
		-- renderFontDrawText(font, 'Colors:\n{FF0000}Red\n{00FF00}Green\n{0000FF}Blue\n{80FFFFFF}Transparent white', 10, 400, 0xFFFFFFFF)
	end

	wait(-1)
end



-- =================================================================================
-- ================================= �������� RPC ==================================
-- =================================================================================

function sampev.onTogglePlayerSpectating(state)
	flags.is_spectator = state
	return {state}
end

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
	lua_thread.create(function()
		flags.active_check_bot = true
		sampSendChat("/id " .. playerId)
		wait(1000)
		flags.active_check_bot = false
		if flags.is_player_bot then
			sampAddChatMessage("[A] ������� �� ����� {FFFFFF}" .. sampGetPlayerNickname(playerId) .. "[" .. playerId .. "]  {0373fc}����������.", 0x0373FC)
		else
			sampSendChat("/re " .. playerId .. "      ") -- ������� ��� ���� ��������, �� �������
		end
	end)
	return false
end

-- =================================================================================

function sampev.onRemovePlayerFromVehicle()
	return false	-- ����� � ����� ������
end

-- =================================================================================

-- function sampev.onCreatePickup(id, model, pickupType, position)
	-- sampAddChatMessage("������ ����� {FFFFFF}[id: " .. tostring(id) .. ", model: " .. tostring(model) .. ", pickupType: " .. tostring(pickupType) .. ", position: " .. tostring(position) .. "]", 0x00FF00)
	-- return {id, model, pickupType, position}
-- end

-- =================================================================================

-- function sampev.onSetRaceCheckpoint(type, position, nextPosition, size)
	-- sampAddChatMessage("������ �������� {FFFFFF}[type: " .. tostring(type) .. ", position: " .. position.x .. "|" .. position.y .. "|" .. position.z .. ", nextPosition: " .. tostring(nextPosition) .. ", size: " .. tostring(size) .. "]", 0x00FF00)
	-- return {type, position, nextPosition, size}
-- end

-- =================================================================================

function sampev.onSendChat(message)
	return {message}
end

-- =================================================================================

function sampev.onShowDialog(dialogId, style, title, button1, button2, text)  -- (5752 - /arep) (5753 - ����� �������)
	-- sampAddChatMessage("dialogId: " .. dialogId ..  ", style: " .. style .. ", title: " .. title .. ", button1 :" .. button1 .. ", button2: " .. button2, -1)
	print(dialogId)
	print(text)

	-- if flags.check_admins and dialogId == 143 then -- ADMINS CHECKER
		-- for line in text:gmatch("[^\n\r]+") do
			-- local job, nick, id, awarn, lvl = line:match("(.+)%s+(.+)%[(%d+)%]%s+%((%d+)/3%)%s+(%d+)")
			-- admins[id] = {job, nick, awarn, lvl}
		-- end
		-- return false

	if flags.check_report and dialogId == 5752 then
		local number_line = 0
		for line in text:gmatch("[^\n\r]+") do
			if line:find(report.nick) then
				sampSendDialogResponse(5752, 1, number_line, report.nick)
				break
			end
			number_line = number_line + 1
		end
		return false

	elseif flags.check_report and dialogId == 5753 then
		local number_line = 0
		for line in text:gmatch("[^\n\r]+") do
			if number_line == 3 then
				report.text = line:gsub("{808080}", "{FFFFFF}")
				sampSendDialogResponse(5753, 0, 65535, "")
				sampAddChatMessage("[A] ������ �� " .. report.nick .. "[" .. report.id .. "]: " .. report.text, 0xff9945)
				break
			end
			number_line = number_line + 1
		end
		flags.check_report = false
		return false
	end

	return {dialogId, style, title, button1, button2, text}
end

-- =================================================================================

function sampev.onSendDialogResponse(dialogId, button, listboxId, input)
	-- sampAddChatMessage("ID dialog: " .. dialogId .. ", button: " .. button .. ", listboxID: " .. listboxId .. ", input: " .. input, -1)
	return {dialogId, button, listboxId, input}
end

-- =================================================================================

function sampev.onSendCommand(cmd)
	if cmd:find(string.lower("^/spawn$")) then
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		sampSendChat(cmd .. " " .. myid)
		return false

	elseif not flags.show_news and cmd:find(string.lower("^/aedit")) then
		sampAddChatMessage("[A] ������� �������� ����������� �������� (/show_news).", 0xfc8403)
		return false

	elseif cmd:find(string.lower("^/re %d+$")) then
		local id = cmd:match("/re (%d+)")
		lua_thread.create(function()
			if not flags.active_check_bot then
				flags.active_check_bot = true
				sampSendChat("/id " .. id)
				wait(1000)
				flags.active_check_bot = false
			end
			if flags.is_player_bot then
				sampAddChatMessage("[A-RECON] ������� �� ����� {FFFFFF}" .. sampGetPlayerNickname(id) .. "[" .. id .. "]  {fc8403}����������.", 0xfc8403)
			else
				sampSendChat("/re " .. id .. "      ") -- ������� ��� ���� ��������, �� �������
			end
		end)
		return false

	elseif cmd:find(string.lower("^/spcar$")) then
		local car = storeCarCharIsInNoSave(PLAYER_PED)
		local _, vehicleId = sampGetVehicleIdByCarHandle(car)
		sampSendChat(cmd .. " " .. vehicleId)
		return false

	elseif cmd:find(string.lower("^/object$")) then
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		sampSendChat(cmd .. " " .. myid)
		return false

	elseif cmd:find(string.lower("^/victorina$")) then
		flags.auto_victorina = not flags.auto_victorina
		sampAddChatMessage("�� " .. cmd_status[flags.auto_victorina] .. " {FFFFFF}���������� �� ���������.", 0xFFFFFFFF)
		return false

	elseif cmd:find(string.lower("^/show_victorina")) then
		flags.show_victorina = not flags.show_victorina
		sampAddChatMessage("�� " .. cmd_status[flags.show_victorina] .. " {FFFFFF}����������� ���������.", 0xFFFFFFFF)
		return false

	-- elseif cmd:find(string.lower("^/tt")) then
			-- onSendPlayerSync
		-- return false

	-- elseif cmd:find(string.lower("^/test")) then
		-- for k in pairs(stream_players) do
			-- if stream_players[k] then
				-- sampAddChatMessage(k - 1, -1)
			-- end
		-- end
		-- return false

	elseif cmd:find(string.lower("^/show_news")) then
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

	if text:find("^{ffa500}%[A%] : .*{ffa500}��������� ������") then
		report.nick, report.id = text:match("{ffa500}%[A%] : .*{ffa500}��������� ������ �� (.+)%[(%d+)%]")
		flags.check_report = true
		sampSendChat("/arep")
	

	elseif flags.check_report and text:find("^������� �� �������%.$") then
		return false
	
	
	elseif flags.active_check_bot then
		if text:find("^.+ %[%d+%] {318CE7}%[Luxwen Launcher%]$") then
			flags.is_player_bot = true
			return false
		elseif text:find("^.+ %[%d+%] .*{DC143C}%[SA%-MP Mobile%]$") or text:find(".+ %[%d+%] .*{318CE7}%[PC%]") then
			local nick, id, color, client = text:match("(.+) %[(%d+)%] .*{(.+)}%[(.+)%]")
			sampAddChatMessage("[A] �� ������ ���������� �� {FFFFFF}" .. nick .. "[" .. id .. "] {fc8403}(������: {" .. color .. "}" .. client .. "{fc8403})", 0xfc8403)
			flags.is_player_bot = false
			return false
		elseif text:find("^������ ������:$") then
			return false
		end

	elseif text:find("^{FFAF00}SMS:") then
		if text:find("�����������: .+%[%d+%]$") then
			local message, from = text:match("{FFAF00}SMS: {FFF700}(.+) {FFAF00}| {FFF700}�����������: (.+)")
			sampAddChatMessage("SMS �� {FF7700}" .. from .. "{FFFF00}: " .. message, 0xFFFF00)
		else
			local message, to = text:match("{FFAF00}SMS: {FFF700}(.+) {FFAF00}| {FFF700}����������: (.+)")
			sampAddChatMessage("SMS � {FF7700}" .. to .. "{FFFF00}: " .. message, 0xFFFF00)
		end
		return false

	elseif text:find("^�� ���������������� ���") then
		lua_thread.create(function()
			sampSendChat("/rub")
			wait(1000)
			sampSendChat("/agm")
			wait(1000)
			sampSendChat("/chatsms")
			wait(1000)
			-- while true do
				-- if not flags.check_report then
					-- sampSendChat("/admins")
				-- end
				-- wait(1000)
			-- end
		end)

	elseif not flags.show_news and (text:find("^{FA8D20}.+ | �������: ") or text:find("^  {D16E0B}���������� ���������������") or text:find("^��� | ") or text:find("^  ���������� ��������") or text:find("^%[���%] ������ ����� ����������! | ��������: /aedit$")) then
		return false

	elseif text:find("^{FFFF00}������������� .+ ����������� ��������") then
		local id = text:match("{FFFF00}.+(%d+)")
		sampSendChat("/g" .. id)

	elseif text:find("^%[A%] : %(.+%) .+%[%d+%]: .*") then -- /a
		local color, arank, name, id, message = text:match("^%[A%] : %({(.+)}(.+){FFFFFF}%) (.+)%[(%d+)%]:(.+)")
		sampAddChatMessage("[A] {" .. color .. "}[" .. arank .. "] {ff00ff}" .. name .. "[" .. id .. "]:{00ff00} " .. message, 0xff00ff)
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

	elseif text:find("^%[A%]") or text:find("^{AFAFAF}%[A%]") and not text:find("%[A%] �����: .+ � ������� ���!$") then
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
		if color == -1347440726 or color == -1347440641 or color == -1007741441 or color == -1263159297 or color == -6750038 or text:find("%[%d+ HP%]$") or text:find("��������� ������ .+ �� ������$") then
			color = 0xFFFFFFFF
			if not text:find("^{656565}") and not text:find("^{AFAFAF}") then
				text = "{656565}" .. text
			end
		end
		text = text:gsub("{AFAFAF}", "{656565}")
	end

	return {color, text}
end

sampRegisterChatCommand('azh', function(id)
	lua_thread.create(function()
		if id ~= '' then
			if id:find('%d+') then
				sampSendChat('/az')
				wait(100)
				sampSendChat('/gethere '..id)
			else
				sampAddChatMessage('{FF0000}[������] {FF8C00}�� ������� ������������ [ID]', stColor)
			end
		else
			sampAddChatMessage('{FF0000}[������] {FF8C00}�� �� ����� [ID]', stColor)
		end
	end)
end)
-- =================================================================================
-- =================================== ������� =====================================
-- =================================================================================

function calculate(text) -- �����������
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