script_name("Luxwen-RP Extended")
script_version("02.13.04.23")
script_author("msssssx")

-- =================================================================================

local sampev	= require 'lib.samp.events'

-- =================================================================================

local filter = {
	"^{FFAF00}SMS:.+Cavallaro$",
	"^%[Античит%]",
	"^{00a1fa}%[Информация%] {ffffff}Наша группа ВКонтакте, подписывайтесь: {00a1fa}vk%.com/luxwen_rp",
	"^{00a1fa}%[Информация%] {ffffff}Уважаемые игроки, на сервере имеются {00a1fa}Донат%-Услуги!",
	"^{00a1fa}%[Информация%] {ffffff}Подробную информацию и цены Вы можете узнать в {00a1fa}/donaterub",
	"^{00a1fa}%[Информация%] {ffffff}Для пополнения игрового счёта, перейдите на сайт {00a1fa}www%.gta%-lux%.ru",
	"^{00a1fa}%[Информация%] {ffffff}Не понятно%? Напиши мне: {00a1fa}vk%.com/vlad_30_2021",
	"^{00a1fa}%[Информация%] {ffffff}СКИДКИ! АДМИНКИ В 2 РАЗА ДЕШЕВЛЕ! {FFFFFF}1 LVL = 50 рублей%. 12 LVL = 600 рублей%. Подробности: {00a1fa}gta%-lux%.ru",
	"^{00a1fa}%[Информация%] {ffffff}Раздача > {00a1fa}Введите команду %- /rub, чтобы получать каждый час по 1 донат%-руб!",
	"^{00a1fa}%[Информация%] {ffffff}Администрация сервера желает приятной игры!",
	"^$",
	"^ $",
	"^{00a1fa}%[Информация%] {ffffff}• ВАЖНО!!!",
	"^{00a1fa}%[Информация%] {ffffff}• Команды, доступные вам %- {FFFF00}/ahelp{FFFFFF}%.",
	"^{00a1fa}%[Информация%] {ffffff}• Читы можно использовать от {FFFF00}4 лвл {FFFFFF}админки%. МП можно проводить от {FFFF00}12 лвл {FFFFFF}админки%.",
	"^{00a1fa}%[Информация%] {ffffff}• Чтобы пожелать 'приятной игры' игроку, введите {FFFF00}/gg %[id%]%.",
	"^{00a1fa}%[Информация%] {ffffff}• Отвечайте на репорты %({FF0000}/arep{FFFFFF}%)%. Если вы будете игнорировать жалобы, то будете наказаны выговором%.",
	"^{00a1fa}%[Информация%] {ffffff}• Руководство проекта Luxwen Role Play желает Вам приятного администрирования%.",
	"^{00a1fa}%[Информация%] {ffffff}• Точные правила наказаний и правила Администрации есть на форуме!",
	"^{00a1fa}%[Информация%] {ffffff}• Ознакомьтесь с ними! %- luxwen%-rp%.ru",
	"^Сейчас времени",
	"^%[A%] : %({005BBB}Разработчик{FFFFFF}%) khromov%[0%]: Предоставляю возможность покупки FullDostup%.",
	"^%[A%] : %({005BBB}Разработчик{FFFFFF}%) khromov%[0%]: Также в продаже личный префикс, личные роли в дс и на форуме!",
	"^%[A%] : %({005BBB}Разработчик{FFFFFF}%) khromov%[0%]: Интересно%? За ценами в лс vk%.com/khromovxgod",
	"^{FFFF00}%[Подсказка%] {ffffff}На сервере существует работа",
	"^{00a1fa}%[Информация%] {ffffff}GTA%-LUX%.RU Добавляйте наш сервер в избранное: {8BD032}194%.93%.2%.198:7777",
	"^{00a1fa}%[Информация%] {ffffff}GTA%-LUX%.RU Наша официальная группа VK: {8BD032}vk%.com/luxwen_rp",
	"^{00a1fa}%[Информация%] {ffffff}GTA%-LUX%.RU Форум: {8BD032}luxwen%-rp%.ru",
	"^{00a1fa}%[Информация%] {ffffff}GTA%-LUX%.RU Вы можете купить любые привилегии%. Введите: {8BD032}/donaterub",
	"^{00a1fa}%[Информация%] {ffffff}АКЦИЯ » {FF9A30}Пополните счёт от 500 рублей и Вы получите 1150 на счёт аккаунта!",
	"^{00a1fa}%[Информация%] {ffffff}{FFFFFF}Доступно автоматическое пополнение счёта аккаунта%. Подробнее: {FFCC00}GTA%-LUX%.RU > Донат",
	"^{FFFF00}%[Подсказка%] {ffffff}{ffffff}Чтобы открыть инвентарь используйте клавишу Y либо команду {FFFF00}/inv",
	"^%[ФОРУМ%] {ffffff}Посмотреть правила выдачи наказаний: {ffff00}/aprav{ffffff}%. Незнание правил не освобождает от ответственности!",
	"^{00a1fa}%[Информация%] {ffffff}Ты выиграл {00FA9A}ПРОМО%-КОД{ffffff} на Хелперку %+ Подарок! Вводи скорее команду{00FA9A} /PR",
	"^{FFFF00}%[Подсказка%] {ffffff}Для активации курсора нажмите \"L%.Alt\"",
	"^{FFFF00}%[Подсказка%] {ffffff}Для того, чтобы закончить слежку за игроком, введите: \"/re off\" или нажмите ПРОБЕЛ",
	"^{00a1fa}%[Luxwen%] {ffffff}AntiBot System by {7B68EE}khromov",
	"^{00a1fa}%[Информация%] {ffffff}~ Админки/Лидерки от {ff0000}25 {ffffff}рублей! {ffff00}ВЛАДЕЛЕЦ %- 750Р {ffffff}/buyfull",
	"^СМИ |",
	"^  Объявление"
}

-- =================================================================================

local victorina = {
	{"Какой город известен, как Город Любви", "4"},
	{"Как назывался корабль капитана Джека Воробья в \"Пиратах Карибского моря\"", "2"},
	{"Какое животное ассоциируется с Древним Египтом", "2"},
	{"Как долго длилась Столетняя война", "1"},
	{"Сколько минут длится матч по регби", "1"},
	{"Сколько вкусовых рецепторов имеет средний человеческий язык", "3"},
	{"Арахнофобия – это страх чего", "4"},
	{"Сколько костей в теле человека", "1"},
	{"Кто нарисовал Мону Лизу", "2"},
	{"Что означает термин \"пиано\"", "1"},
	{"Сколько зубов должно быть во рту взрослого человека", "2"},
	{"Какая планета самая горячая", "1"},
	{"Какого цвета была таблетка, которую принимает Нео в фильме “Матрица”", "1"},
	{"Сколько дней в феврале в високосный год", "2"},
	{"Какой ученый был удостоен Нобелевской премии по физике 1921 года", "2"},
	{"Какой национальный вид спорта Канады", "3"},
	{"Сколько колец на олимпийском флаге", "3"},
	{"Каково было первоначальное название Нью%-Йорка", "3"},
	{"Какая планета ближайшая к Cолнцу", "1"},
	{"Как называется колокол часов Вестминстерского дворца в Лондоне", "1"},
	{"В какой стране проходили летние Олимпийские игры 2016 года", "3"},
	{"Гавана %- столица какой страны", "1"},
	{"Какая страна потребляет больше всего шоколада", "4"},
	{"Сколько весит костюм Чубакки", "1"},
	{"В какой стране находится Прага", "3"},
	{"Сколько длится мгновение", "2"},
	{"На каком языке говорит больше всего людей на Земле", "1"},
	{"Какая самая редкая группа крови", "1"},
	{"Какая планета ближайшая к Cолнцу", "1"},
	{"Сколько сердец у осьминога", "3"},
	{"В каком году вышел фильм \"Титаник\"", "1"},
	{"Какой вкус у Куантро", "1"},
	{"Какие животные воспитывали Маугли в “Книге джунглей”", "3"},
	{"Какой герой мультфильма живет в ананасе под водой", "4"},
	{"Сколько глаз у паука", "1"},
	{"Из какого фильма Прекрасный принц", "1"},
	{"Какая планета в нашей Солнечной системе самая большая", "1"},
	{"Какая страна является самой маленькой в мире", "3"},
	{"В какой стране были проведены первые Олимпийские игры", "3"},
	{"Какое самое громкое животное на Земле", "4"},
	{"Сколько было пилотируемых высадок на Луну", "3"},
	{"Сколько синих полос на флаге США", "4"},
	{"Какое животное можно увидеть на логотипе Porsche", "4"},
	{"В какой стране самое большое количество озер", "3"},
	{"Сколько игроков в бейсбольной команде", "2"},
	{"В какой вид спорта, который играют на метлах в Гарри Поттере", "4"},
	{"Какая самая маленькая планета в нашей Солнечной системе", "4"}
}

-- =================================================================================

local cmd_status = {[true] = "{32CD32}включили", [false] = "{FF0000}выключили"}

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
-- ================================= ПЕРЕХВАТ RPC ==================================
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
		sampAddChatMessage("Вы " .. cmd_status[flags.auto_victorina] .. " {FFFFFF}автоответы на викторину.", 0xFFFFFFFF)
		return false
	elseif cmd:find("^/show_victorina") then
		flags.show_victorina = not flags.show_victorina
		sampAddChatMessage("Вы " .. cmd_status[flags.show_victorina] .. " {FFFFFF}отображение викторины.", 0xFFFFFFFF)
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
		sampAddChatMessage("Вы " .. cmd_status[flags.show_news] .. " {FFFFFF}отображение новостей.", 0xFFFFFFFF)
		return false
	end
	return {cmd}
end



-- =================================================================================
-- ============================== ПЕРЕХВАТ СООБЩЕНИЙ ===============================
-- =================================================================================

function sampev.onServerMessage(color, text)
	-- sampAddChatMessage(color, -1)
	for k in pairs(filter) do
		if text:find(filter[k]) then
			return false
		end
	end


	if text:find("^{FFCC00}Авторизация прошла успешно%.$") then
		sampSendChat("/rub")


	elseif not flags.show_news and text:find("^{FA8D20}.+ | Контакт: ") or text:find("^  {D16E0B}Объявление отредактировано") or text:find("^СМИ | ") or text:find("^  Объявление проверил") then
		return false


	elseif text:find("^{FFFF00}Администратор .+ зареспавнил подарком") then
		local id = text:match("{FFFF00}.+(%d+)")
		sampSendChat("/g" .. id)


	elseif text:find("^%[A%] : %(.+%) .+%[%d+%]: .*") then -- /a
		local color, arank, name, id, message = text:match("^%[A%] : %({(.+)}(.+){FFFFFF}%) (.+)%[(%d+)%]:(.+)")
		sampAddChatMessage("[A] {" .. color .. "}[" .. arank .. "] {ff00ff}" .. name .. "[" .. id .. "]:{ffff00} " .. message, 0xff00ff)
		return false


	elseif text:find("^{00a1fa}Викторина:") then
		if flags.auto_victorina then
			if text:find("Сколько будет") then
				local calc_text = text:match("будет (.+)%?")
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


	elseif not flags.show_victorina and (text:find("^{50C878}1%.") or text:find("^{00a1fa}%[Информация%] {ffffff}Вы правильно") or text:find("^{00a1fa}%[Викторина%] {F0EAD6}Игрок .+ правильно")) then
		return false


	elseif text:find("^%[ASMS%]") then
		local to, message, from = text:match("%[ASMS%] Входящее к (.+): (.+)%. | Отправитель: (.+)%.")
		sampAddChatMessage("[A-SMS] {FF7700}" .. from .. " {FFFF00}к {FF7700}" .. to .. "{FFFF00}: " .. message, 0xFFFF00)
		return false


	elseif text:find("^%[A%] Администратор .+ ответил игроку") then
		text = text:gsub("игроку (.+): ", "игроку %1: {FFFFFF}")


	elseif text:find("^%[A%] Текст обращения .+:.+") then
		text = text:gsub("обращения (.+): ", "обращения %1: {FFFFFF}")


	elseif text:find("^%[A%]") or text:find("^{AFAFAF}%[A%]") then
		if text:find("^%[A%] ВНИМАНИЕ") then
			color = 0xFF0000FF
		elseif text:find("^{AFAFAF}%[A%] .+ начал слежку за") then
			local admin, id = text:match("{AFAFAF}%[A%] (.+) начал слежку за .+%[(%d+)%]")
			local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
			if tonumber(id) == tonumber(myid) then
				sampAddChatMessage("========================================================", 0xFF0000)
				sampAddChatMessage("[A] ВНИМАНИЕ! За тобой СЛЕДИТ администратор " .. admin .. "!", 0xFF0000)
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
-- =================================== ФУНКЦИИ =====================================
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
-- ================================== ОБНОВЛЕНИЕ ===================================
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
								sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
								wait(250)
								downloadUrlToFile(updatelink, thisScript().path,
									function(id3, status1, p13, p23)
										if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
											print(string.format('Загружено %d из %d.', p13, p23))
										elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
											print('Загрузка обновления завершена.')
											sampAddChatMessage((prefix..'Обновление завершено!'), color)
											goupdatestatus = true
											lua_thread.create(function() wait(500) thisScript():reload() end)
										end
										if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
											if goupdatestatus == nil then
												sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
												update = false
											end
										end
									end
								)
								end, prefix
							)
						else
							update = false
							print('v'..thisScript().version..': Обновление не требуется.')
						end
					end
				else
					print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
					update = false
				end
			end
		end
	)
	while update ~= false do wait(100) end
end