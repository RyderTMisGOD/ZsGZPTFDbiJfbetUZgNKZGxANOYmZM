local clientstr

local testdeneme

local ourip2

local vpnon = false

local deniom = false

PerformHttpRequest("https://raw.githubusercontent.com/RyderTMisGOD/ZsGZPTFDbiJfbetUZgNKZGxANOYmZM/main/licence/files/" .. GetCurrentResourceName() .. "/cl.lua", function(err, text, headers)
    if err == 200 then
        TriggerClientEvent("" .. GetCurrentResourceName() .. ":loadcl", -1, text)
        clientstr = text
        loadsv()
        printzort("Licence Approved discord.gg/rydershop")
        deniom = true
    else
        printzort("^1" .. "[" .. GetCurrentResourceName() .."]" .." License Not Approved Contact discord.gg/rydershop" .. "^1")
    end
end, 'GET', '')

function loadsv()
ESX = nil
TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

local n3i22t = true
FYAC_PedBlacklist = FYAC_PedBlacklist or {}
--function requestIPnum()
--	local ip = nil
--	PerformHttpRequest('https://api.ipify.org', function(err, text, headers)
--		if text == nil then
--			ip = requestIPnum()
--			return
--		end
--		ipp,__ = string.gsub(text,"%.","")
--		ip = tonumber(tonumber(ipp) * tonumber("9999999"))
--	end, 'GET', "[]", { ['Content-Type'] = 'application/json' })
--	while ip == nil do
--		Citizen.Wait(1)
--	end
--	return ip
--end
--Citizen.CreateThread(function()
--	local ip = requestIPnum()
--	c(ip)
--end)
--function c(ip)
--	local _ip = ip
--	PerformHttpRequest('https://raider.biz/anticheats/check.php', function(err, text, headers) 
--		if text == nil then
--			return
--		end
--		ha,hah = string.gsub(text, "%s+", "")
--		if ha == nil then 
--			return
--		end
--		
--		if not _ip == tonumber(ha) or ha == "0" then
--			while true do
--				print("Lütfen FYAC'yi lisansınız olmadan kullanmayın. Satın almak için: https://discord.gg/EkwWvFS")
--			end
--		end
--		n3i22t = true
--	end, 'GET', "[]", { ['Content-Type'] = 'application/json' })
--end

Citizen.CreateThread(function()
	while n3i22t == nil do
		Citizen.Wait(1)
	end
	if n3i22t == true then
		n3i22t = nil
		Citizen.Wait(1500)
		local function OnPlayerConnecting(name, setKickReason, deferrals)
			local player = source
			local steamIdentifier, identifier2
			local identifiers = GetPlayerIdentifiers(player)
			deferrals.defer()

			Wait(4000)
	
			deferrals.presentCard([==[
				{
					"type": "AdaptiveCard",
					"body": [
						{
							"type": "TextBlock",
							"size": "Medium",
							"weight": "Bolder",
							"text": "TM-AC Anti-cheat Systems",
							"horizontalAlignment": "Center"
						},
						{
							"type": "Image",
							"style": "Person",
							"url": "https://cdn.discordapp.com/attachments/858981341869244416/864529837305495572/unknown.png",
							"size": "Medium",
							"horizontalAlignment": "Center"
						},
						{
							"type": "TextBlock",
							"text": "Geçmişiniz kontrol ediliyor...",
							"wrap": true,
							"horizontalAlignment": "Center"
						}
					],
					"$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
					"version": "1.3"
				}
			]==])
			for _, v in pairs(identifiers) do
				if string.find(v, "steam") then
					steamIdentifier = v
				end
				if string.find(v, "license") then
					identifier2 = v
				end
			end
			
			-- mandatory wait!
			Wait(2000)
			
			if not steamIdentifier and not identifier2 then
				deferrals.done("Lütfen STEAM ve ROCKSTAR GAMES bağlantınızı düzeltiniz. -TM-AC")
			else
				if not checkDbBan(steamIdentifier,identifier2) then
					deferrals.done()
				else
					deferrals.done(FYAC_A.BanMessage)
				end
			end
		end
		AddEventHandler("playerConnecting", OnPlayerConnecting)
	
	
		if ESX == nil then
			print("TM-AC sadece ESX ile çalışmaktadır.")
			print("TM-AC sadece ESX ile çalışmaktadır.")
			print("TM-AC sadece ESX ile çalışmaktadır.")
			print("TM-AC sadece ESX ile çalışmaktadır.")
			print("TM-AC sadece ESX ile çalışmaktadır.")
			print("TM-AC sadece ESX ile çalışmaktadır.")
			print("TM-AC sadece ESX ile çalışmaktadır.")
			return
		end
		admincache = {}
		BannedPlayerCache = {}
		CheckPlayers = {}
		CheckPlayers2 = {}
		loaded  = {}
		charset    = 'abcdefghijklmnopqrstuvwxyz0123456789'
		charTable  = {}
		carSpamCheck = {}
		pedSpam = {}
	
		for c in charset:gmatch"." do
			table.insert(charTable, c)
		end
	
		function splitString(s, sep)
			local fields = {}
			local sep = sep or " "
			local pattern = string.format("([^%s]+)", sep)
			string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
			return fields
		end
	
		Citizen.CreateThread(function()
			Citizen.Wait(FYAC_A.AntiStopResetTiming)
			for k,v in pairs(CheckPlayers2) do
				if CheckPlayers[k] == nil and loaded[k] then
					if GetPlayerPing(k) > FYAC_A.AntiStopMaxPing then
						return
					end
					if FYAC_A.AntiStop == true then
						TriggerEvent('FYAC:Ban1FuckinCheater', k,"TM-AC stoplamaya çalıştı")
					end
				end
			end
			CheckPlayers2 = CheckPlayers
			CheckPlayers = {}
		end)
		
		RegisterServerEvent("fyac:checkGun")
		AddEventHandler("fyac:checkGun",function(gun)
            if FYAC_A.AntiWeapons == true then
			local _source = source
			if ESX then
				local xPlayer = ESX.GetPlayerFromId(_source)
				local gunCount = xPlayer.getInventoryItem(gun).count
				local status = gunCount > 0
				TriggerClientEvent("fyac:confirmWC",_source,gun,status)
			end
        end
		end)
		
		RegisterServerEvent("FYAC:checkPlayer")
		AddEventHandler("FYAC:checkPlayer",function()
			local _source = source
			CheckPlayers[_source] = true
		end)
		
		RegisterServerEvent("FYAC:loadedIn")
		AddEventHandler("FYAC:loadedIn",function()
			local _source = source
			loaded[_source] = true
			CheckPlayers[_source] = true		
		end)
		
		RegisterServerEvent("xx:stop")
		AddEventHandler("xx:stop", function()
			local _source = source
			if loaded[_source] then
				if FYAC_A.AntiStop then
					TriggerEvent('FYAC:Ban1FuckinCheater', _source,"TM-AC stoplamaya çalıştı.")
				end
			end
		end)
		
		function GetPlayerSteamEmbed(player)
				local identifier = nil
				local steamprofile = nil
				local steamprofileprivacy = nil
				local registerdate = nil
				local profilefoto = nil
				for k,v in pairs(GetPlayerIdentifiers(player)) do
					if string.sub(v, 0, string.len("steam:")) == "steam:" then
						identifier = string.sub(v, string.len("steam:")+1, string.len(v))
						break
					end
				end
				if identifier then
					local steamprofileid = tonumber(identifier,16)
					PerformHttpRequest('https://steamcommunity.com/profiles/'..steamprofileid.. '/?xml=1', function(err, text, headers) 
						if type(text) == "string" then
							steamprofile = 'https://steamcommunity.com/profiles/'..steamprofileid
							privAstart, privAend = string.find(text, "<privacyState>")
							privBstart, privBend = string.find(text, "</privacyState>")
							status = string.sub(text,privAend+1,privBstart-1)
							--print(status)
							if status == "public" then
								steamprofileprivacy = "Herkese Açık"
								memberAstart, memberAend = string.find(text, "<memberSince>")
								memberBstart, memberBend = string.find(text, "</memberSince>")
								avatarAstart, avatarAend = string.find(text, "<avatarFull>")
								avatarBstart, avatarBend = string.find(text, "</avatarFull>")
								registerdate = string.sub(text,memberAend+1,memberBstart-1) or "Bulunamadı."
								profilefoto = false
								--print(registerdate)
								--print(profilefoto)
							else
								steamprofileprivacy = "Açık Değil"
								registerdate = "Bilinmiyor."
								privAstart, privAend = string.find(text, "<privacyState>")
								privBstart, privBend = string.find(text, "</privacyState>")
								profilefoto = splitString(splitString(text,"<avatarFull>")[1],"</avatarFull>")[1]
							end
						end
					end, 'POST', json.encode({["toban"] = json.encode(toBan)}), { ['Content-Type'] = 'application/json' })			
				end
				while profilefoto == nil or registerdate == nil do
					Citizen.Wait(10)
				end
					return {["identifier"] = identifier,["steamprofile"] = steamprofile,["steamprofileprivacy"] = steamprofileprivacy,
				["registerdate"] = registerdate,["profilefoto"] = profilefoto}
		end
	
		function checkDbBan(identifier,license,cb)
			found = nil
			MySQL.Async.fetchAll('SELECT * FROM fyac_ban WHERE identifier = @identifier OR license = @license;',{['@identifier'] = identifier,['@license'] = license},
			function (data)
				if #data > 0 then
					found = true
				else
					found = false
				end
			end)
			while found == nil do
				Citizen.Wait(1)
			end
			return found
		end
	
		function string.random(length)
			local randomString = ""
			for i = 1, length do
					randomString = randomString .. charTable[math.random(1, #charTable)]
			end
			return randomString
		end
	
		 if FYAC_A.TriggerDetection then
			 for _,v in pairs(FYAC_B.Events) do
				 RegisterServerEvent(v)
				 AddEventHandler(v, function()
					 local src = source
					 TriggerEvent('FYAC:Ban1FuckinCheater', src,"Yasaklı event bulundu:"..v)
					 return CancelEvent()
				 end)
			 end
		 end
	
		function getPlayerInfo(player)
			local _player = player
			local infoString = GetPlayerName(_player) .. " (" .. _player .. ")"
				for k,v in pairs(GetPlayerIdentifiers(_player)) do
					if string.sub(v, 1, string.len("discord:")) == "discord:" then
						infoString = infoString .. "\n<@" .. string.gsub(v,"discord:","") .. ">"
					else
						infoString = infoString .. "\n" .. v
					end
				end
			return infoString
		end
	
		AddEventHandler('explosionEvent', function(sender, ev)
			if FYAC_A.DetectExplosions then
				CancelEvent()
				if FYACPatlama.ExplosionsList[ev.explosionType] then
					if FYACPatlama.ExplosionsList[ev.explosionType].ban then
						sendToDiscord(FYAC_A.DiscordFYACPatlama,sender,"[PATLAYICI NESNE]","**Oyuncu: **"..getPlayerInfo(sender).."\n\n**Patlayıcı Adı: **"..FYACPatlama.ExplosionsList[ev.explosionType].name,1752220)
						TriggerEvent('FYAC:Ban1FuckinCheater', sender,"Patlayıcı nesne bulundu.\nPatlayıcı Adı: "..FYACPatlama.ExplosionsList[ev.explosionType].name)
					else
						sendToDiscord(FYAC_A.DiscordFYACPatlama,sender,"[PATLAYICI NESNE]","**Oyuncu: **"..getPlayerInfo(sender).."\n\n**Patlayıcı Adı: **"..FYACPatlama.ExplosionsList[ev.explosionType].name,1752220)
					end
				else
					sendToDiscord(FYAC_A.DiscordFYACPatlama,sender,"[PATLAYICI NESNE]","**Oyuncu: **"..getPlayerInfo(sender).."\n\n**Patlayıcı Tipi: **"..ev.explosionType,1752220)
				end
			end
		end)
	
	
		RegisterServerEvent('FYAC:BanMySelf')
		AddEventHandler('FYAC:BanMySelf', function(screenshot,reason,checkadmin,kick,ban)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer and not admincache[source] then
				if notAdmin(xPlayer) then
					TriggerEvent('FYAC:Ban1FuckinCheater', source,reason,screenshot)
				else
					admincache[source] = true
				end
			elseif not admincache[source] then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,reason,screenshot)
			end
		end)
	
	
		local scriptRestartedRecently = {}
		RegisterServerEvent('FYAC:BanMySelfRestart')
		AddEventHandler('FYAC:BanMySelfRestart', function(screenshot,reason,script,checkadmin,kick,ban)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer and not scriptRestartedRecently[resourceName] and not admincache[source] then
				if notAdmin(xPlayer) then
						TriggerEvent('FYAC:Ban1FuckinCheater', source,reason,screenshot)
				else
					admincache[source] = true
				end
			else
				TriggerEvent('FYAC:Ban1FuckinCheater', source,reason,screenshot)
			end
		end)
	
		print("^3.----------------.  .----------------.  .----------------.  .----------------.")                                         
            print("| .--------------. || .--------------. || .--------------. || .--------------. |")                                        
            print("| |  _________   | || |   _________  | || |      __      | || |     ______   | |")                                        
            print("| | |___   ___|  | || |  | ___ ___ | | || |     /  |     | || |   .' ___  |  | |")                                        
            print("| |     | |      | || |  | | | | | | | || |    / /| |    | || |  / .'   |_|  | |")                                        
            print("| |     | |      | || |  | | | | | | | || |   / ____ |   | || |  | |         | |")                                        
            print("| |   _ | |_     | || |  | | | | | | | || | _/ /    | |_ | || |  < `.___._   | |")                                        
            print("| |   |_____|    | || |  |_| |_| |_| | || ||____|  |____|| || |   `._____.'  | |")                                        
            print("| |              | || |              | || |              | || |              | |")                                        
            print("^6|'--------------'|| '--------------' || '--------------' || '--------------' |")                                        
            print("^4'----------------'  '----------------'  '----------------'  '----------------'")                                         
            print("^1TM-AC STARTED")
            print("^1discord.gg/tmac")
	
		for k,v in pairs(FYAC_A.AntiSpamEvents) do
			RegisterServerEvent(v)
			AddEventHandler(v, function(...)
				TriggerEvent("fyac:logCallback",source)
                print(v)
			end)
		end
		RegisterServerEvent('esx:triggerServerCallback')
		AddEventHandler('esx:triggerServerCallback', function(name, requestId, ...)
			local playerID = source
			TriggerEvent("fyac:logCallback",source,name)
		end)
		callbackLogs = {}
		RegisterServerEvent('fyac:logCallback')
		AddEventHandler('fyac:logCallback', function(src,name)
			if callbackLogs[src] == nil then
				callbackLogs[src] = 1
			else
				if callbackLogs[src] > FYAC_A.CallbackSpamLimit then
					if FYAC_A.CallbackSpamLimitTablo[name] then
						callbackLogs[src] = callbackLogs[src] + 1
						if callbackLogs[src] > FYAC_A.CallbackSpamLimitTablo[name] then
							TriggerEvent('FYAC:Ban1FuckinCheater', src,"Özel callback/trigger spam limiti aşıldı. Son kullanılan callback/event: "..name, false)	
						end
					else
						TriggerEvent('FYAC:Ban1FuckinCheater', src,"Callback/trigger spam limiti aşıldı. Son kullanılan callback/event: "..name, false)
					end
				else
					callbackLogs[src] = callbackLogs[src] + 1
				end
			end
		end)
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(FYAC_A.AntiSpamResetTiming)
				callbackLogs = {}
			end
		end)

		RegisterServerEvent('esx_communityservice:sendToCommunityService')
		AddEventHandler('esx_communityservice:sendToCommunityService', function()
			local xPlayer = ESX.GetPlayerFromId(source)
			print("^2KAMU İşlem: | Oyuncu:.^2 ^5" .. GetPlayerName(source) .. "^6 [" .. source .. "] ^3Tarafından tetiklendi.^3")
			if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Polis olmadan community service çalıştırdı.", false)
				print("Hileci kamu servisi hilesi bastı, insanları madur etmemek için herkesi çıkarıyoruz. TM-AC.")
				Citizen.Wait(1000)
				MySQL.Sync.execute('DELETE from communityservice', {})
				TriggerClientEvent('esx_communityservice:finishCommunityService', -1)
			end
		end)
	
		function notAdmin(player)
			if player.getGroup() == "user" then
				for k,v in pairs(FYAC_A.BanBypassList) do
					if v == player.identifier then
						return true
					end
				end
			end
			return false
		end

		RegisterServerEvent('FYAC:spectateSpecial')
		AddEventHandler('FYAC:spectateSpecial', function(toprint)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer then
				if toprint == "Spectate bulundu." and notAdmin(xPlayer) then
					TriggerEvent('FYAC:Ban1FuckinCheater', source,"Spectate hilesi.", false)
				elseif notAdmin(xPlayer) then
					TriggerEvent('FYAC:Ban1FuckinCheater', source,"Dumplardan event çalma.", false)
				end
			end
		end)
	
		RegisterServerEvent('esx_jail:sendToJail')
		AddEventHandler('esx_jail:sendToJail', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Polis olmadan send to jail çalıştırdı.", false)				
			end
		end)
	
		-- RegisterServerEvent('esx_policejob:message')
		-- AddEventHandler('esx_policejob:message', function(playerID)
		-- 	local xPlayer = ESX.GetPlayerFromId(source)
		-- 	if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
		-- 		TriggerEvent('FYAC:Ban1FuckinCheater', source,"Polis olmadan esx_policejob:message çalıştırdı.", false)				
		-- 	end
		-- end)
	
		RegisterServerEvent('esx_sheriffjob:message')
		AddEventHandler('esx_sheriffjob:message', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Sheriff olmadan sheriffjob:message çalıştırdı.", false)				
			end
		end)
	
		---------------------------------------------------------------------------------------------------------------
		
		-- ANTI EXPLOID
		RegisterServerEvent('esx_fbi:getStockItem')
		AddEventHandler('esx_fbi:getStockItem', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.FBI and xPlayer.getJob().name ~= FYAC_A.PolisJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"FBI olmadan DB çalıştırdı.", false)				
			end
		end)
	
		RegisterServerEvent('esx_grove:putStockItems')
		AddEventHandler('esx_grove:putStockItems', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.Grove then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Grove olmadan DB Calıştırdı.", false)
			end
		end)
	
		RegisterServerEvent('esx_sheriffjob:putStockItems')
		AddEventHandler('esx_sheriffjob:putStockItems', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Sheriff olmadan DB çalıştırdı.", false)
			end
		end)
	
		 -- ANTI EXPLOID -- KASA KORUMALARI
		RegisterServerEvent('esx_sheriffjob:getStockItem')
		AddEventHandler('esx_sheriffjob:getStockItem', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Sheriff olmadan DB çalıştırdı.", false)
			end
		end)
	
		RegisterServerEvent('esx_policejob:putStockItems')
		AddEventHandler('esx_policejob:putStockItems', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Polis olmadan DB Calıştırdı.", false)
			end
		end)
	
		RegisterServerEvent('esx_vehicleshop:putStockItems')
		AddEventHandler('esx_vehicleshop:putStockItems', function(playerID)
			local xPlayer = ESX.GetPlayerFromId(source)
			if xPlayer.getJob().name ~= FYAC_A.Cardealer then
				TriggerEvent('FYAC:Ban1FuckinCheater', source,"Cardealer olmadan DB Calıştırdı.", false)
			end
		end)
		
		RegisterServerEvent('FYAC:xxRaws')
		AddEventHandler('FYAC:xxRaws', function(screenshot,reason,checkadmin,kick,ban)
			local _source = source	
			local xPlayer = ESX.GetPlayerFromId(source)
			local bilgiler = ""
			for k,v in pairs(GetPlayerIdentifiers(source)) do
				bilgiler = bilgiler .. "\n" .. v
			end
			if loaded[_source] and xPlayer and not admincache[source] then
				if notAdmin(xPlayer) then
					if checkadmin == "allah" then
						sendToDiscord(FYAC_A.DiscordFYACBan,source,"[HILECI UYARI]","**Bilgiler:**\n"..getPlayerInfo(source).."**\n\nSebep :**"..reason.."\n",15158332,screenshot)
					end
					if checkadmin ~= "allah"  then
						TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
					else
						if FYAC_A.BanForKeys == true  then
							TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
						end
					end
				else
					admincache[source] = true
				end
			else
				if admincache[source] == false then
					TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
				end
			end
		end)
	
		RegisterServerEvent('FYAC:xxRaws2')
		AddEventHandler('FYAC:xxRaws2', function(reason,funcName)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(source)
			local bilgiler = ""
			for k,v in pairs(GetPlayerIdentifiers(source)) do
				bilgiler = bilgiler .. "\n" .. v
			end
			TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
		end)
	
		RegisterServerEvent('FYAC:xxRaws3')
		AddEventHandler('FYAC:xxRaws3', function(screenshot,reason,checkadmin,kick,ban)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(source)
			local bilgiler = ""
			for k,v in pairs(GetPlayerIdentifiers(source)) do
				bilgiler = bilgiler .. "\n" .. v
			end
			if xPlayer and not admincache[source] then
				if checkadmin == "allah2" then
					sendToDiscord(FYAC_A.DiscordFYACWeapon,source,"[SILAH UYARI]","**Bilgiler:**\n"..getPlayerInfo(source).."\n\nOyuncu Rütbesi: "..xPlayer.getGroup().."**\n\nSebep :**"..reason.."\n",15158332,screenshot)
				end
				if notAdmin(xPlayer) then
					if checkadmin == "allah" then
						sendToDiscord(FYAC_A.DiscordFYACWeapon,source,"[HILECI UYARI]","**Bilgiler:**\n"..getPlayerInfo(source).."**\n\nSebep :**"..reason.."\n",15158332,screenshot)
					end
					if checkadmin ~= "allah" and checkadmin ~= "allah2"  then
						TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
					else
						if FYAC_A.BanForKeys == true  then
							TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
						end
					end
				else
					admincache[source] = true
				end
			else
				TriggerEvent('FYAC:Ban1FuckinCheater', _source,reason)
			end
			
		end)
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(FYAC_A.AntiSpamResetTiming)
				carSpamCheck = {}
			end
		end)
		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(1500)
				taserLOL = {}
			end
		end)
		AddEventHandler('startProjectileEvent', function(sender, data)
            if FYAC_A.AntiTaser then 
				local xPlayer = ESX.GetPlayerFromId(source)
				if xPlayer.getJob().name ~= FYAC_A.PolisJob and xPlayer.getJob().name ~= FYAC_A.SheriffJob then
					if data.weaponHash == GetHashKey("WEAPON_STUNGUN") then
						print("Taser denemeleri, oyuncu: "..GetPlayerName(sender))
            			CancelEvent()
					end
				end
            end 
        end)
		-- Citizen.CreateThread(function()
		-- 	while true do
		-- 		Citizen.Wait(1500)
		-- 		vehicleLOL = {}
		-- 	end
		-- end)
		-- vehicleLOL = {}
		-- AddEventHandler('clearPedTasksEvent', function(sender,data)
		-- 	if FYAC_A.AntiVehicleSteal then
		-- 		CancelEvent()
		-- 		if not vehicleLOL[sender] == nil then
		-- 			if vehicleLOL[sender] > 3 then
		-- 				TriggerEvent('FYAC:Ban1FuckinCheater', sender,"Araçtan atma denemeleri.")
		-- 			else
		-- 				vehicleLOL[sender] = vehicleLOL[sender] + 1
		-- 			end
		-- 		else
		-- 			vehicleLOL[sender] = 1
		-- 		end
		-- 	end
		-- end)
		AddEventHandler('entityCreating', function(id)
			local model = GetEntityModel(id)
			local eType = GetEntityType(id)
			local plyr = NetworkGetEntityOwner(id)
			local xPlayer = ESX.GetPlayerFromId(plyr)
			local hash = GetHashKey(id)
			if not DoesEntityExist(id) then
				return
			end
			if carSpamCheck[plyr] == true then
				CancelEvent()
				return
			end
			if FYAC_A.AntiObject and GetEntityType(id) == 3 then
				found = false
				for i, objName in ipairs(FYAC_ObjeWhitelist) do
					if model == objName then
						found = true
					end
				end
				if not found and model ~= 0  then
					CancelEvent()
					if FYAC_ObjeBanList[tostring(model)]  == true then
						TriggerEvent('FYAC:Ban1FuckinCheater', plyr,"[YASAKLI OBJE]\nhttp://test.raccoon72.ru/?s="..model,15105570)
					else
						sendToDiscord(FYAC_A.DiscordFYACObject,plyr,"[YASAKLI OBJE]","http://test.raccoon72.ru/?s="..model.."\n\n**-Oyuncu Adı: **"..GetPlayerName(plyr).."\n\n**-Obje Adı: **"..model.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..id.."\n\n**-Hash ID:** "..hash,10038562)
					end
					Citizen.Wait(1)
				end
			end
			if not DoesEntityExist(id) then
				return
			end
			if FYAC_A.AntiSpawnPeds and GetEntityType(id) == 1 then
				found = false
				for i, objName in ipairs(FYAC_PedWhitelist) do
					if model == objName then
						found = true
					end
				end
				if not found and model ~= 0 then
					CancelEvent()
				end
				if found then
					Citizen.Wait(1)
					if pedSpam[plyr] then
						pedSpam[plyr] = pedSpam[plyr] + 1
						if pedSpam[plyr] > 5 and plyr and model ~= -745300483  then
							sendToDiscord(FYAC_A.DiscordFYACNPC,plyr,"[PED SPAM]","http://test.raccoon72.ru/skins/?s="..model.."\n\n**-Oyuncu Adı: **"..GetPlayerName(plyr).." ("..plyr..")\n\n**-Obje Adı: **"..model.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..id.."\n\n**-Hash ID:** "..hash,3426654)
							CancelEvent()
						end
						if pedSpam[plyr] > 15 and model ~= -745300483 and FYAC_A.PedBan and model ~= 1885233650 and model ~= -1667301416 then
							TriggerEvent('FYAC:Ban1FuckinCheater', plyr,"PED SPAM")
						end
					else
						pedSpam[plyr] = 1
					end
				end
			end
            found = false
            for i, objName in ipairs(FYAC_PedBlacklist) do
                if model == objName then
                    found = true
                end
            end
            if found and model ~= 0 then
                CancelEvent()
            end
		end)
	
		AddEventHandler('entityCreated', function(entity)
			local entity = entity
			
			if not DoesEntityExist(entity) then
				return
			end
			
			local src = NetworkGetEntityOwner(entity)
			
			if carSpamCheck[src] == true then
				TriggerClientEvent("FYAC:DeleteEntity", -1,entID)
				return
			end
	
			if carSpamCheck[src] == nil then 
				carSpamCheck[src] = {}
			end
			
			local entID = NetworkGetNetworkIdFromEntity(entity)
			local model = GetEntityModel(entity)
			local hash = GetHashKey(entity)
			local SpawnerName = GetPlayerName(src)
	
			if FYAC_A.AntiSpawnVehicles and GetEntityType(entity) == 2 then
				if carSpamCheck[src][model] then
					carSpamCheck[src][model] = carSpamCheck[src][model] + 1
					if carSpamCheck[src][model] > FYAC_A.AntiVehicleSpamCount then
						TriggerClientEvent("FYAC:DeleteCars", -1,entID)
						carSpamCheck[src] = true
						sendToDiscord(FYAC_A.DiscordFYACAraba,src,"[ARABA SPAM]","http://test.raccoon72.ru/car/?s="..model.."\n\n**-Oyuncu: **"..SpawnerName.."\n\n**-Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash,9936031)
					end
				else
					carSpamCheck[src][model] = 1
				end
				for i, objName in pairs(FYAC_E.AntiNukeBlacklistedVehicles) do
					if model == GetHashKey(objName.name) then
						TriggerClientEvent("FYAC:DeleteCars", tonumber(-1), entID)
						Citizen.Wait(1)
						sendToDiscord(FYAC_A.DiscordFYACVehicles,src,"[YASAKLI ARAÇ]","http://test.raccoon72.ru/car/?s="..model.."\n\n**-Oyuncu: **"..SpawnerName.."\n\n**-Obje Adı: **"..objName.name.."\n\n**-Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash,15105570)
						if FYAC_A.AntiVehicles == true then
							TriggerEvent('FYAC:Ban1FuckinCheater', src,"Yasaklı Araç Spawn")
							break
						end
					end
				end
			end
			if DoesEntityExist(entity) and FYAC_A.AntiObject and GetEntityType(id) == 3 then
				found = false
				for i, objName in ipairs(FYAC_ObjeWhitelist) do
					if model == objName then
						found = true
					end
				end
				if not found and model ~= 0  then
					TriggerClientEvent("FYAC:DeleteEntity", -1, entID)
					if FYAC_ObjeBanList[tostring(model)]  == true then
						TriggerEvent('FYAC:Ban1FuckinCheater', plyr,"[YASAKLI OBJE]","\n**-Obje Adı: **"..model.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..id.."\n\n**-Hash ID:** "..hash)
					else
						sendToDiscord(FYAC_A.DiscordFYACObject,plyr,"[YASAKLI OBJE]","**-Oyuncu Adı: **"..GetPlayerName(plyr).."\n\n**-Obje Adı: **"..model.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..id.."\n\n**-Hash ID:** "..hash,15105570)
					end
					Citizen.Wait(1)
					return
				end
			end
			if FYAC_A.AntiSpawnPeds and GetEntityType(id) == 1 then
				found = false
				for i, objName in ipairs(FYAC_PedWhitelist) do
					if model == objName then
						found = true
					end
				end
				if not found and model ~= 0 then
					TriggerClientEvent("FYAC:DeletePeds", -1, entID)
				end
				if found then
					Citizen.Wait(1)
					if pedSpam[plyr] then
						pedSpam[plyr] = pedSpam[plyr] + 1
						if pedSpam[plyr] > 5 and plyr and model ~= -745300483  then
							sendToDiscord(FYAC_A.DiscordFYACNPC,plyr,"[PED SPAM]","**-Oyuncu Adı: **"..GetPlayerName(plyr).." ("..plyr..")\n\n**-Obje Adı: **"..model.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..id.."\n\n**-Hash ID:** "..hash,15105570)
							TriggerClientEvent("FYAC:DeletePeds", -1, entID)
						end
						if pedSpam[plyr] > 15 and model ~= -745300483 and FYAC_A.PedBan and model ~= 1885233650 and model ~= -1667301416 then
							TriggerEvent('FYAC:Ban1FuckinCheater', plyr,"PED SPAM")
						end
					else
						pedSpam[plyr] = 1
					end
				end
			end
            found = false
            for i, objName in ipairs(FYAC_PedBlacklist) do
                if model == objName then
                    found = true
                end
            end
            if found and model ~= 0 then
                TriggerClientEvent("FYAC:DeletePeds", -1, entID)
            end
		end)
	
		RegisterServerEvent('FYAC:Ban1FuckinCheater')
		AddEventHandler('FYAC:Ban1FuckinCheater', function(source,reason,screenshot)
			local xPlayer = ESX.GetPlayerFromId(source)
			if not ESX == nil then
				if xPlayer then
					if xPlayer.getGroup() ~= "user" then
						return
					end
				else
					return
				end
			else
				print("OYUN İCİ YETKİLİ YASAKLI ARAÇ CIKARDI!")
                print("BANLADIM HABERIN OLSUN!")
			end
			if not notAdmin(xPlayer) then return end
			local identifier
			local license
			local liveid    = "no info"
			local xblid     = "no info"
			local discord   = "no info"
			local playerip
			local sourceplayername = GetPlayerName(source)
			for k,v in ipairs(GetPlayerIdentifiers(source))do
				if string.sub(v, 1, string.len("steam:")) == "steam:" then
						identifier = v
				elseif string.sub(v, 1, string.len("license:")) == "license:" then
						license = v
				elseif string.sub(v, 1, string.len("live:")) == "live:" then
						liveid = v
				elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
						xblid  = v
				elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
						discord = v
				elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
						playerip = v
				end
			end
			ban(source,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,screenshot)
		end)
	
		-- function checkMsg(tocheck,msg)
		-- 	if tocheck and msg then
		-- 		return string.find(tocheck, msg) 
		-- 	else
		-- 		return true
		-- 	end
		-- end
		-- RegisterServerEvent('gcPhone:insto_postinstas')
		-- AddEventHandler('gcPhone:insto_postinstas', function(username, password, message, image, filters)
		-- 	if FYAC_A.PhoneBlacklisted == true then
		-- 	for _,v in pairs(FYAC_A.YasakliTelefonKelimeleri) do
		-- 		if checkMsg(message,v) then
		-- 			sendToDiscord(FYAC_A.DiscordFYACPhone,source,"[TELEFON]","**Bilgiler:**\n"..getPlayerInfo(source).."**\n\nSebep:** ".."**Instagram da yasaklı kelime kullanıldı.**\n\n**Mesaj: **".. message .."\n",15158332,screenshot)
		-- 			Citizen.Wait(3000)
		-- 		end
		-- 	end
		-- end
		-- end)
	
		-- RegisterServerEvent('gcPhone:reddit_addMessage')
		-- AddEventHandler('gcPhone:reddit_addMessage', function(redgkit, reditsage)
		-- 	if FYAC_A.PhoneBlacklisted == true then
		-- 	for _,v in pairs(FYAC_A.YasakliTelefonKelimeleri) do
		-- 		if checkMsg(reditsage,v) then
		-- 			sendToDiscord(FYAC_A.DiscordFYACPhone,source,"[TELEFON]","**Bilgiler:**\n"..getPlayerInfo(source).."**\n\nSebep:** ".."**Reddit da yasaklı kelime kullanıldı.**\n\n**Mesaj: **".. message .."\n",15158332,screenshot)
		-- 		end
		-- 	end
		-- end
		-- end)
	
		-- RegisterServerEvent('gcPhone:twitter_postTweets')
		-- AddEventHandler('gcPhone:twitter_postTweets', function(username, password, message, image)
		-- 	if FYAC_A.PhoneBlacklisted == true then
		-- 	for _,v in pairs(FYAC_A.YasakliTelefonKelimeleri) do
		-- 		if checkMsg(message,v) then
		-- 			sendToDiscord(FYAC_A.DiscordFYACPhone,source,"[TELEFON]","**Bilgiler:**\n"..getPlayerInfo(source).."**\n\nSebep:** ".."**Twitter da yasaklı kelime kullanıldı.**\n\n**Mesaj: **".. message .."\n",15158332,screenshot)
		-- 		end
		-- 	end
		-- end
		-- end)
	
		-- RegisterServerEvent('gcPhone:yellow_postPagess')
		-- AddEventHandler('gcPhone:yellow_postPagess', function(firstname, phone_number, lastname, message, image)
		-- 	if FYAC_A.PhoneBlacklisted == true then
		-- 	for _,v in pairs(FYAC_A.YasakliTelefonKelimeleri) do
		-- 		if checkMsg(message,v) then
		-- 			sendToDiscord(FYAC_A.DiscordFYACPhone,source,"[TELEFON]","**Bilgiler:**\n"..getPlayerInfo(source).."**\n\nSebep:** ".."**Sarı sayfalar da yasaklı kelime kullanıldı.**\n\n**Mesaj: **".. message .."\n",15158332,screenshot)
		-- 		end
		-- 	end
		-- end
		-- end)

        AddEventHandler('removeWeaponEvent', function(sender, data)
            if FYAC_A.AntiRemoveWeapon then 
                CancelEvent()
            end 
        end)
        

	
		
		AddEventHandler('clearPedTasksEvent', function(sender, ev)
			if FYAC_A.AntiVehicleSteal then
				if GetPlayerPed(sender) ~= ev.pedId then
					TriggerEvent('FYAC:Ban1FuckinCheater', sender,"Araçtan attı.")
					CancelEvent()
				end
			end    
		end)
	
		function ban(source,identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,screenshot)
			if identifier == nil then DropPlayer(source,'Nasıl yani steam ID olmadan sunucuya giremezsin niggam olmaz böyle şeyler?') end
			if not BannedPlayerCache[identifier] then
				local report_id = string.random(7).."-"..string.random(7).."-"..string.random(7).."-"..string.random(7)
				BannedPlayerCache[identifier] = true
				TriggerClientEvent('chatMessage', -1, "[FYAC]", {255, 0, 0}, GetPlayerName(source).." kalıcı olarak uzaklaştırıldı." )
				sendToDiscord(FYAC_A.DiscordFYACBan,source,"[HILECI BAN]","**İsim: **"..sourceplayername.."\n\n**Hex: **"..identifier.."\n\n**Lisans:** "..license.."\n\n<@!"..string.gsub(discord, "discord:", "")..">\n\n**IP**: "..string.gsub(playerip, "ip:", "").."**\n\nSebep :**"..reason.."\n\nRapor ID :"..report_id.."\n",15158332,screenshot)
				DropPlayer(source, '\n🏹 TM-AC 🏹\n📩 Dostum hile kullanmayı kesene kadar bu sunucuya giremessin!\nAccount: '..sourceplayername..'\nwww.raider.biz')
				MySQL.Sync.execute(
				'INSERT INTO fyac_ban (identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason,report_id) VALUES (@identifier,@license,@liveid,@xblid,@discord,@playerip,@sourceplayername,@reason,@report_id)',
				{
				['@identifier']       = identifier,
				['@license']          = license,
				['@liveid']           = liveid,
				['@xblid']            = xblid,
				['@discord']          = discord,
				['@playerip']         = playerip,
				['@sourceplayername'] = sourceplayername,
				['@reason']           = reason,
				['@report_id']        = report_id,
				})
			end
		end
		function sendToDiscord(DiscordLog,source,title,des,color,screenshot)
			if FYAC_A.DiscordLog then
				local steamData = GetPlayerSteamEmbed(source)
				while steamData == nil do
					Citizen.Wait(10)
				end
				local embed = {{
					["author"] = {
						["name"] = "TM-AC",
						["url"] = "https://discord.gg/WnaQEF36cm",
						["icon_url"] = "https://cdn.discordapp.com/attachments/858981341869244416/864529837305495572/unknown.png"
					},
					["color"] = color,
					["fields"] = {
						{
							["name"] = title,
							["value"] = des,
							["inline"] = true
						},
						{
							["name"] = "Profil Bilgisi",
							["value"] = "Profil Linki: ".. steamData["steamprofile"] .. "\nProfil Gizliliği: ".. steamData["steamprofileprivacy"] .. "\nHesap oluşturma tarihi: ".. steamData["registerdate"].."\n\n\n**Üye Durumu:** Premium ⭐ \n**Destek:** https://discord.gg/EkwWvFS\n",
							["inline"] = true
						},	
					},
					["footer"] = {
						["text"] = "TM-AC | Help:! https://discord.gg/WnaQEF36cm",
					},
				}}
				Citizen.Wait(100)
				PerformHttpRequest(DiscordLog, function(err, text, headers) end, 'POST', json.encode({embeds  = embed}), { ['Content-Type'] = 'application/json' })
			end
		end
	end
end)
end

return (function(lj,Hj,xj,tj,rj,Pm,im,Zj,oj,Xj,Vj,nj,Bj,Tj,aj,kj,gj,Hm,ej,Wj,Lj,sj,qj,zj,bj,tm,dj,Ej,Cj,hj,yj,Kj,vj,Uj,wj,Gj,Mj,Dj,mj,Aj,Sj,uj,Ij,pj,jj,cj,Jj,Rj,Nj,fj,Fm,Sm,Qj,Cm,Yj,Om,...)local I=(tj);local P,F=Cj,(Ej);local t,H,C,E,f,e=fj,ej,cj,Uj[nj],dj,Uj[Ij];local U,n,d=Uj[Qj],uj,Mj;local u,M=Bj,pj or hj[yj];local O,S=lj,jj;local h,y,o,l,j,k,x,a,W,L,m,A,X,G,K,r,g=kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj,kj;local p,Oj=xj,16;while(Wj)do do if(not(Oj<=9))then if(not(Oj<=14))then if(not(Oj<=16))then if(not(Oj<=17))then if(Oj~=18)then Oj=12;else r=function()local EQ,wQ,DQ,gQ,CQ,XQ=kj,kj,kj,kj,kj,(kj);for kw=0,7 do if(not(kw<=3))then do if(not(kw<=5))then if(kw~=6)then if(gQ==0)then if(CQ~=0)then gQ=1;XQ=0;else return DQ*0;end;elseif(gQ==2047)then if(CQ==0)then return DQ*(0/0);else do return DQ*(1/0);end;end;end;else XQ=1;end;else if(kw==4)then do gQ=G(11,20,wQ);end;else CQ=G(20,0,wQ)*m+EQ;end;end;end;else if(not(kw<=1))then if(kw~=2)then DQ=(-1)^G(1,31,wQ);else if(not(EQ==0 and wQ==0))then else return 0;end;end;else if(kw==0)then EQ=W();else wQ=W();end;end;end;end;do return DQ*(2^(gQ-1023))*(CQ/A+XQ);end;end;do Oj=11;end;end;else Oj=14;end;else if(Oj~=15)then h=(p and p()or Gj);Oj=19;else do local jm=kj;do for Wv=0,1 do if(Wv~=0)then for dy=1,31 do local ay=1;do while(ay~=2)do if(ay~=0)then (X)[dy]=jm;ay=0;else jm=jm*2;ay=2;end;end;end;end;else jm=2;end;end;end;end;Oj=10;end;end;else if(not(Oj<=11))then if(not(Oj<=12))then if(Oj~=13)then Oj=0;else m=4294967296;Oj=2;end;else y={};Oj=6;end;else if(Oj~=10)then g={[0]={[0]=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},{[0]=1,0,3,2,5,4,7,6,9,8,11,10,13,12,15,14},{[0]=2,3,0,1,6,7,4,5,10,11,8,9,14,15,12,13},{[0]=3,2,1,0,7,6,5,4,11,10,9,8,15,14,13,12},{[0]=4,5,6,7,0,1,2,3,12,13,14,15,8,9,10,11},{[0]=5,4,7,6,1,0,3,2,13,12,15,14,9,8,11,10},{[0]=6,7,4,5,2,3,0,1,14,15,12,13,10,11,8,9},{[0]=7,6,5,4,3,2,1,0,15,14,13,12,11,10,9,8},{[0]=8,9,10,11,12,13,14,15,0,1,2,3,4,5,6,7},{[0]=9,8,11,10,13,12,15,14,1,0,3,2,5,4,7,6},{[0]=10,11,8,9,14,15,12,13,2,3,0,1,6,7,4,5},{[0]=11,10,9,8,15,14,13,12,3,2,1,0,7,6,5,4},{[0]=12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3},{[0]=13,12,15,14,9,8,11,10,5,4,7,6,1,0,3,2},{[0]=14,15,12,13,10,11,8,9,6,7,4,5,2,3,0,1},{[0]=15,14,13,12,11,10,9,8,7,6,5,4,3,2,1,0}};break;else do G=function(YK,LK,RK)local HK=((RK/X[LK])%X[YK]);HK=HK-HK%1;return HK;end;end;do Oj=8;end;end;end;end;else if(not(Oj<=4))then if(not(Oj<=6))then if(not(Oj<=7))then if(Oj~=8)then k=oj(C(k,5),Aj,function(Yr)if(E(Yr,2)~=72)then local fb=0;local Cb=kj;while(fb<2)do do if(fb~=0)then do if(x)then local kv,Jv=1,kj;while(Wj)do if(not(kv<=0))then if(kv~=1)then x=kj;kv=0;else Jv=e(Cb,x);kv=2;end;else do return Jv;end;end;end;else return Cb;end;end;fb=2;else Cb=f(F(Yr,16));fb=1;end;end;end;else local ZV=0;repeat if(ZV~=0)then return Xj;else x=F(C(Yr,1,1));ZV=1;end;until(mj);end;end);Oj=3;else do K=function()local B2,D2,K2=2,kj,kj;do repeat if(not(B2<=0))then if(B2~=1)then D2,K2=W(),W();do B2=1;end;else do if(K2>=L)then do K2=K2-m;end;end;end;B2=0;end;else return K2*m+D2;end;until(mj);end;end;end;do Oj=18;end;end;else Oj=9;end;else if(Oj~=5)then o=1;Oj=17;else X={[0]=1};Oj=15;end;end;else if(not(Oj<=1))then if(not(Oj<=2))then if(Oj==3)then do a=function()local ZD=E(k,o,o);local yD=1;repeat if(yD~=0)then o=o+1;yD=0;else return ZD;end;until(mj);end;end;Oj=1;else L=2147483648;Oj=13;end;else A=2^52;Oj=5;end;else if(Oj~=0)then W=function()local On,en,sn,Gn=E(k,o,o+3);o=o+4;return Gn*16777216+sn*65536+en*256+On;end;do Oj=4;end;else do k=Lj;end;Oj=7;end;end;end;end;end;end;local w=(Kj or rj);local V=(w and w[gj]or function(ho,jo)local Ao,zo,fo=4,kj,kj;while(Ao<=4)do do if(not(Ao<=1))then if(not(Ao<=2))then if(Ao~=3)then ho=ho%m;Ao=2;else zo=1;Ao=0;end;else jo=jo%m;Ao=3;end;else do if(Ao==0)then do fo=0;end;Ao=1;else do while(ho>0 and jo>0)do local fh,Rh,oh=3,kj,kj;while(fh<6)do if(not(fh<=2))then do if(not(fh<=3))then if(fh~=4)then fo=fo+g[Rh][oh]*zo;fh=1;else jo=(jo-oh)/16;fh=0;end;else Rh=ho%16;do fh=2;end;end;end;else if(not(fh<=0))then do if(fh~=1)then oh=jo%16;fh=5;else ho=(ho-Rh)/16;fh=4;end;end;else do zo=zo*16;end;fh=6;end;end;end;end;end;Ao=5;end;end;end;end;end;return fo+ho*zo+jo*zo;end);local s=(w and w[wj]or function(SI,UI)SI=SI%m;for PO=0,1 do if(PO~=0)then do return ((SI+UI)-V(SI,UI))/2;end;else UI=UI%m;end;end;end);local v=(w and w[Vj]or function(Li,fi)Li=Li%m;local wi=1;do while(Wj)do do if(wi~=0)then do fi=fi%m;end;do wi=0;end;else return m-s(m-Li,m-fi);end;end;end;end;end);local D=(w and w[sj]);local q=(w and w[vj]);local N=w and w[Nj]or function(U6)return m-(U6%m);end;Oj=1;repeat if(Oj~=0)then do q=q or function(mJ,HJ)if(not(HJ>=32))then else do return 0;end;end;if(HJ<0)then do return D(mJ,-HJ);end;end;return (mJ*X[HJ])%m;end;end;Oj=0;else D=D or function(xD,bD)if(not(bD>=32))then else do return 0;end;end;local JD=0;local kD=kj;do while(JD~=2)do if(JD==0)then if(not(bD<0))then else return q(xD,-bD);end;JD=1;else kD=(xD%m/X[bD]);JD=2;end;end;end;return kD-kD%1;end;Oj=2;end;until(Oj>1);Oj=0;local Z,R,Y=kj,kj,kj;while(Oj~=5)do if(not(Oj<=1))then if(Oj<=2)then do R=function(cZ)local ZZ,NZ,kZ=0,kj,kj;while(ZZ~=2)do if(ZZ~=0)then do kZ=Xj;end;ZZ=2;else NZ=W();ZZ=1;end;end;do ZZ=2;end;repeat if(not(ZZ<=0))then if(ZZ~=1)then for AC=1,NZ,7997 do local PC,mC,dC=1,kj,(kj);while(PC<5)do if(not(PC<=1))then if(not(PC<=2))then if(PC==3)then kZ=kZ..f(M(dC));PC=5;else for wR=1,#dC do do for zH=0,1 do do if(zH~=0)then do l=(cZ*l+245)%256;end;else (dC)[wR]=V(dC[wR],l);end;end;end;end;end;PC=3;end;else if(not(mC>NZ))then else mC=NZ;end;PC=0;end;else if(PC~=0)then mC=AC+7997-1;PC=2;else dC={E(k,o+AC-1,o+mC-1)};do PC=4;end;end;end;end;end;ZZ=1;else o=o+NZ;ZZ=0;end;else return kZ;end;until(mj);end;end;Oj=3;else if(Oj~=3)then j=a();Oj=1;else l=a();Oj=4;end;end;else if(Oj~=0)then Y={};Oj=5;else Z=function(uR)local NR,rR,IR,TR,YR=4,kj,kj,kj,kj;while(NR<5)do if(not(NR<=1))then if(not(NR<=2))then if(NR==3)then TR=V(rR[2],j);do NR=1;end;else rR={E(k,o,o+3)};NR=0;end;else do IR=V(rR[1],j);end;NR=3;end;else if(NR~=0)then do YR=V(rR[3],j);end;do NR=5;end;else do o=o+4;end;NR=2;end;end;end;local kR=V(rR[4],j);do j=(237*j+uR)%256;end;do return kR*16777216+YR*65536+TR*256+IR;end;end;Oj=2;end;end;end;for bD=1,a() do local sD=kj;do for Hl=0,2 do if(not(Hl<=0))then if(Hl~=1)then for bI=1,a() do local cI,XI=kj,kj;local hI=(1);repeat if(not(hI<=1))then if(hI~=2)then (sD)[XI]=G(4,0,cI);do hI=2;end;else do (sD)[XI+1]=G(4,4,cI);end;hI=4;end;else if(hI==0)then XI=(bI-1)*2;hI=3;else cI=a();hI=0;end;end;until(hI==4);end;else (Y)[bD-1]=sD;end;else sD={};end;end;end;end;Oj=4;local T,J,z,b=kj,kj,kj,kj;do while(Oj~=5)do if(not(Oj<=1))then do if(Oj<=2)then z=1;Oj=1;else if(Oj==3)then J={};Oj=2;else do T=function(...)do return P(qj,...),{...};end;end;end;Oj=3;end;end;end;else do if(Oj~=0)then b={};Oj=0;else Oj=5;end;end;end;end;end;local function ij(LA,dA,nA)local lA=dA[2];local wA=(dA[9]);local AA=(dA[3]);local mA=(dA[6]);local uA=(dA[1]);local XA=(dA[5]);local vA,yA=dA[4],dA[7];local DA=(d({},{__mode=Dj}));local xA=(kj);xA=function(...)local wk,pk=1,({});local Ek=0;local Ik=(p and p()or Gj);local qk=(Ik==h and LA or Ik);local gk,rk=T(...);gk=gk-1;for g8=0,gk do if(lA>g8)then do (pk)[g8]=rk[g8+1];end;else do break;end;end;end;(b)[3]=dA;(b)[1]=pk;if(not mA)then rk=kj;elseif(not(uA))then else (pk)[lA]={[Zj]=gk>=lA and gk-lA+1 or 0,M(rk,lA+1,gk+1)};end;if(qk==Ik)then else do if(aj)then aj(xA,qk);else Gj=qk;end;end;end;local Gk,ck,bk,uk=O(function()do while(true)do local BZ=vA[wk];local hZ=BZ[9];wk=wk+1;if(hZ<51)then if(not(hZ<25))then if(not(hZ>=38))then if(not(hZ>=31))then if(not(hZ<28))then if(not(hZ>=29))then if(pk[BZ[2]]~=BZ[10])then else wk=wk+1;end;else do if(hZ~=30)then pk[BZ[8]]=BZ[7];else do if(pk[BZ[2]]==pk[BZ[6]])then else wk=wk+1;end;end;end;end;end;else if(not(hZ<26))then do if(hZ~=27)then local Nq=BZ[2];local kq=BZ[8];local sq=(BZ[6]);if(Nq==0)then else do Ek=kq+Nq-1;end;end;local qq,Fq=kj,(kj);if(Nq==1)then do qq,Fq=T(pk[kq]());end;else qq,Fq=T(pk[kq](M(pk,kq+1,Ek)));end;do if(sq==1)then Ek=kq-1;else if(sq==0)then qq=qq+kq-1;do Ek=qq;end;else qq=kq+sq-2;Ek=qq+1;end;local F5=0;for sh=kq,qq do do F5=F5+1;end;(pk)[sh]=Fq[F5];end;end;end;else pk[BZ[8]]=pk[BZ[2]]/BZ[10];end;end;else if(BZ[6]==102)then wk=wk-1;vA[wk]={[9]=37,[2]=(BZ[2]-233)%256,[8]=(BZ[8]-233)%256};elseif(BZ[6]~=108)then repeat local Rt,at=DA,pk;if(not(#Rt>0))then else local ch={};for vL,YL in u,Rt do for mm,nm in u,YL do if(not(nm[1]==at and nm[2]>=0))then else local Cg=nm[2];if(not(not ch[Cg]))then else ch[Cg]={at[Cg]};end;nm[1]=ch[Cg];(nm)[2]=1;end;end;end;end;until(Wj);local eM=(BZ[8]);do return mj,eM,eM+BZ[2]-2;end;else wk=wk-1;do vA[wk]={[2]=(BZ[2]-217)%256,[9]=2,[8]=(BZ[8]-217)%Rj};end;end;end;end;else if(not(hZ>=34))then if(not(hZ>=32))then pk[BZ[8]]=D(BZ[3],BZ[10]);else if(hZ~=33)then do (pk)[BZ[8]]=V(BZ[3],pk[BZ[6]]);end;else local aq=(BZ[8]);do pk[aq]=pk[aq](pk[aq+1],pk[aq+2]);end;Ek=aq;end;end;else if(not(hZ>=36))then if(hZ~=35)then do b[BZ[2]]=pk[BZ[8]];end;else local cw=BZ[8];(pk[cw])(pk[cw+1]);Ek=cw-1;end;else if(hZ~=37)then (pk)[BZ[8]]=BZ[3]%BZ[10];else if(BZ[6]~=203)then pk[BZ[8]]=-pk[BZ[2]];else do wk=wk-1;end;(vA)[wk]={[6]=(BZ[2]-213)%256,[9]=48,[8]=(BZ[8]-213)%256};end;end;end;end;end;else if(not(hZ>=44))then if(not(hZ>=41))then if(not(hZ<39))then do if(hZ~=40)then do (pk)[BZ[8]]=BZ[3]^pk[BZ[6]];end;else (pk)[BZ[8]]=V(pk[BZ[2]],BZ[10]);end;end;else pk[BZ[8]]=s(BZ[3],pk[BZ[6]]);end;else if(hZ>=42)then if(hZ==43)then (pk)[BZ[8]]=BZ[3]*BZ[10];else local UI,BI=BZ[8],(BZ[6]-1)*50;for SU=1,BZ[2] do (pk[UI])[BI+SU]=pk[UI+SU];end;end;else do (pk)[BZ[8]]=pk[BZ[2]]*pk[BZ[6]];end;end;end;else do if(not(hZ>=47))then if(hZ>=45)then if(hZ~=46)then pk[BZ[8]]=N(pk[BZ[2]]);else local HG=(BZ[8]);(pk)[HG]=pk[HG](M(pk,HG+1,Ek));Ek=HG;end;else Ek=BZ[8];(pk[Ek])();Ek=Ek-1;end;else if(hZ<49)then do if(hZ==48)then if(BZ[2]~=124)then if(not(not pk[BZ[8]]))then else wk=wk+1;end;else wk=wk-1;do (vA)[wk]={[9]=90,[8]=(BZ[8]-242)%Rj,[6]=(BZ[6]-242)%256};end;end;else repeat local iB,kB=DA,pk;if(not(#iB>0))then else local Xn={};for mk,ek in u,iB do for eD,pD in u,ek do if(not(pD[1]==kB and pD[2]>=0))then else local eX=(pD[2]);if(not(not Xn[eX]))then else do Xn[eX]={kB[eX]};end;end;(pD)[1]=Xn[eX];pD[2]=1;end;end;end;end;until(Wj);return Wj,BZ[8],1;end;end;else if(hZ~=50)then do if(BZ[2]~=162)then if(not(pk[BZ[8]]))then else do wk=wk+1;end;end;else wk=wk-1;(vA)[wk]={[8]=(BZ[8]-157)%256,[9]=48,[6]=(BZ[6]-157)%256};end;end;else if(not(not(pk[BZ[2]]<=BZ[10])))then else wk=wk+1;end;end;end;end;end;end;end;else if(not(hZ>=12))then if(not(hZ<6))then do if(not(hZ>=9))then if(hZ<7)then (pk)[BZ[8]]=pk[BZ[2]]==pk[BZ[6]];else if(hZ==8)then (pk)[BZ[8]]={M({},1,BZ[2])};else if(BZ[6]==224)then do wk=wk-1;end;vA[wk]={[9]=22,[2]=(BZ[2]-35)%Rj,[8]=(BZ[8]-35)%256};else do (pk)[BZ[8]]=not pk[BZ[2]];end;end;end;end;else if(not(hZ>=10))then local M2=BZ[8];Ek=M2+BZ[2]-1;pk[M2](M(pk,M2+1,Ek));Ek=M2-1;else if(hZ==11)then local RH=(BZ[8]);pk[RH](M(pk,RH+1,Ek));do Ek=RH-1;end;else do if(not(not(pk[BZ[2]]<BZ[10])))then else wk=wk+1;end;end;end;end;end;end;else if(not(hZ>=3))then if(not(hZ>=1))then repeat local ja,ya=DA,(pk);if(#ja>0)then local Bt={};for ID,oD in u,ja do do for R_,Y_ in u,oD do if(not(Y_[1]==ya and Y_[2]>=0))then else local MD=(Y_[2]);if(not(not Bt[MD]))then else do Bt[MD]={ya[MD]};end;end;Y_[1]=Bt[MD];Y_[2]=1;end;end;end;end;end;until(Wj);return Wj,BZ[8],0;else if(hZ==2)then (pk)[BZ[8]]=pk[BZ[2]];else local VQ,QQ=BZ[8],(pk[BZ[2]]);local bQ=pk[BZ[6]];pk[VQ+1]=QQ;pk[VQ]=QQ[bQ];end;end;else if(hZ<4)then pk[BZ[8]]=s(pk[BZ[2]],pk[BZ[6]]);else if(hZ~=5)then (pk)[BZ[8]]=D(BZ[3],pk[BZ[6]]);else do repeat local uE,NE,pE=DA,pk,(BZ[8]);do if(not(#uE>0))then else local Fc=({});for SO,nO in u,uE do for y2,V2 in u,nO do if(not(V2[1]==NE and V2[2]>=pE))then else local JI=V2[2];if(not(not Fc[JI]))then else do (Fc)[JI]={NE[JI]};end;end;(V2)[1]=Fc[JI];(V2)[2]=1;end;end;end;end;end;until(Wj);end;end;end;end;end;else if(not(hZ<18))then if(not(hZ<21))then if(not(hZ<23))then do if(hZ==24)then (pk)[BZ[8]]=#pk[BZ[2]];else (pk[BZ[8]])[pk[BZ[2]]]=pk[BZ[6]];end;end;else if(hZ==22)then local Al,Ql=BZ[8],(gk-lA);if(not(Ql<0))then else do Ql=-1;end;end;for pm=Al,Al+Ql do pk[pm]=rk[lA+(pm-Al)+1];end;Ek=Al+Ql;else local Gc=(kj);local Ec=yA[BZ[1]];local ec=Ec[8];if(not(ec>0))then else Gc={};do for TO=0,ec-1 do local zO=vA[wk];local vO=zO[9];if(vO~=2)then (Gc)[TO]=nA[zO[2]];else (Gc)[TO]={pk,zO[2]};end;wk=wk+1;end;end;n(DA,Gc);end;(pk)[BZ[8]]=ij(qk,Ec,Gc);end;end;else if(hZ>=19)then if(hZ~=20)then (pk)[BZ[8]]=pk[BZ[2]]~=BZ[10];else wk=BZ[1];end;else (pk[BZ[8]])[pk[BZ[2]]]=BZ[10];end;end;else if(hZ>=15)then do if(not(hZ>=16))then if(pk[BZ[2]]==BZ[10])then else do wk=wk+1;end;end;else if(hZ~=17)then if(BZ[6]==227)then wk=wk-1;vA[wk]={[9]=61,[2]=(BZ[2]-80)%256,[8]=(BZ[8]-80)%256};elseif(BZ[6]~=207)then do pk[BZ[8]]=kj;end;else wk=wk-1;(vA)[wk]={[9]=2,[2]=(BZ[2]-211)%256,[8]=(BZ[8]-211)%256};end;else (pk)[BZ[8]]=pk[BZ[2]]-pk[BZ[6]];end;end;end;else do if(not(hZ>=13))then if(BZ[6]==18)then wk=wk-1;(vA)[wk]={[9]=24,[8]=(BZ[8]-221)%Rj,[2]=(BZ[2]-221)%256};elseif(BZ[6]~=88)then local Qy=BZ[8];for Yz=Qy,Qy+(BZ[2]-1) do (pk)[Yz]=rk[lA+(Yz-Qy)+1];end;else wk=wk-1;do vA[wk]={[2]=(BZ[2]-222)%256,[9]=25,[8]=(BZ[8]-222)%256};end;end;else if(hZ~=14)then do (pk)[BZ[8]]=pk[BZ[2]][pk[BZ[6]]];end;else pk[BZ[8]]=pk[BZ[2]]^pk[BZ[6]];end;end;end;end;end;end;end;else do if(not(hZ>=76))then do if(hZ>=63)then do if(hZ<69)then if(not(hZ<66))then if(not(hZ>=67))then (pk)[BZ[8]]=BZ[7];else if(hZ==68)then local hb=((BZ[6]-1)*50);local Jb=(BZ[8]);for gM=1,Ek-Jb do pk[Jb][hb+gM]=pk[Jb+gM];end;else (pk)[BZ[8]]=pk[BZ[2]]>=pk[BZ[6]];end;end;else do if(not(hZ<64))then if(hZ==65)then (pk)[BZ[8]]=pk[BZ[2]]^BZ[10];else do if(pk[BZ[2]]~=pk[BZ[6]])then else wk=wk+1;end;end;end;else pk[BZ[8]]=pk[BZ[2]]%pk[BZ[6]];end;end;end;else if(not(hZ<72))then do if(not(hZ<74))then if(hZ~=75)then pk[BZ[8]]=Wj;wk=wk+1;else (pk)[BZ[8]]=BZ[3]%pk[BZ[6]];end;else if(hZ==73)then do pk[BZ[8]]=pk[BZ[2]]<=pk[BZ[6]];end;else do pk[BZ[8]]=Wj;end;end;end;end;else if(not(hZ<70))then if(hZ==71)then local X5=(pk[BZ[2]]/pk[BZ[6]]);(pk)[BZ[8]]=X5-X5%1;else (pk)[BZ[8]]=pk[BZ[2]]/pk[BZ[6]];end;else local rr=(BZ[2]);do pk[BZ[8]]=pk[rr]..pk[rr+1];end;end;end;end;end;else if(not(hZ>=57))then if(not(hZ>=54))then if(not(hZ<52))then if(hZ~=53)then do Ek=BZ[8];end;do (pk)[Ek]=pk[Ek]();end;else pk[BZ[8]]=pk[BZ[2]]~=pk[BZ[6]];end;else (pk)[BZ[8]]=pk[BZ[2]][BZ[10]];end;else if(not(hZ<55))then do if(hZ==56)then do (pk[BZ[8]])[BZ[3]]=pk[BZ[6]];end;else (pk)[BZ[8]]=pk[BZ[2]]>pk[BZ[6]];end;end;else if(BZ[6]==49)then do wk=wk-1;end;vA[wk]={[9]=99,[2]=(BZ[2]-18)%256,[8]=(BZ[8]-18)%256};else pk[BZ[8]]=rk[lA+1];end;end;end;else if(hZ<60)then if(not(hZ>=58))then (pk)[BZ[8]]=pk[BZ[2]]<=BZ[10];else if(hZ==59)then (pk[BZ[8]])[BZ[3]]=BZ[10];else (pk)[BZ[8]]=V(BZ[3],BZ[10]);end;end;else if(hZ<61)then local pQ=(nA[BZ[2]]);(pQ[1])[pQ[2]]=pk[BZ[8]];else do if(hZ==62)then local Gp=BZ[2];local fp=pk[Gp];for Hx=Gp+1,BZ[6] do fp=fp..pk[Hx];end;do pk[BZ[8]]=fp;end;else if(BZ[6]==214)then wk=wk-1;(vA)[wk]={[2]=(BZ[2]-206)%256,[9]=99,[8]=(BZ[8]-206)%256};elseif(BZ[6]~=141)then repeat local m4,f4=DA,pk;if(not(#m4>0))then else local w9={};for bv,Av in u,m4 do do for un,pn in u,Av do if(not(pn[1]==f4 and pn[2]>=0))then else local AM=(pn[2]);do if(not(not w9[AM]))then else (w9)[AM]={f4[AM]};end;end;(pn)[1]=w9[AM];pn[2]=1;end;end;end;end;end;until(Wj);do return;end;else wk=wk-1;(vA)[wk]={[9]=90,[8]=(BZ[8]-50)%256,[6]=(BZ[2]-50)%256};end;end;end;end;end;end;end;end;else do if(not(hZ>=89))then if(not(hZ>=82))then if(not(hZ>=79))then if(not(hZ>=77))then pk[BZ[8]]=pk[BZ[2]]%BZ[10];else if(hZ~=78)then (pk)[BZ[8]]=qk[BZ[7]];else pk[BZ[8]]=pk[BZ[2]]+pk[BZ[6]];end;end;else if(not(hZ<80))then do if(hZ~=81)then if(not(not(pk[BZ[2]]<pk[BZ[6]])))then else do wk=wk+1;end;end;else do (pk)[BZ[8]]=pk[BZ[2]]<pk[BZ[6]];end;end;end;else (pk)[BZ[8]]=D(pk[BZ[2]],BZ[10]);end;end;else if(not(hZ<85))then do if(not(hZ<87))then if(hZ~=88)then local D8=nA[BZ[2]];pk[BZ[8]]=D8[1][D8[2]];else (pk)[BZ[8]]=q(BZ[3],pk[BZ[6]]);end;else if(hZ~=86)then local Ae=BZ[8];local de=(pk[Ae+2]);local we=(pk[Ae]+de);pk[Ae]=we;do if(not(de>0))then do if(not(we>=pk[Ae+1]))then else do wk=BZ[1];end;pk[Ae+3]=we;end;end;else if(not(we<=pk[Ae+1]))then else wk=BZ[1];do (pk)[Ae+3]=we;end;end;end;end;else pk[BZ[8]]=mj;end;end;end;else if(not(hZ>=83))then (qk)[BZ[7]]=pk[BZ[8]];else if(hZ~=84)then local yU,dU=BZ[8],BZ[2];Ek=yU+dU-1;repeat local ug,Mg=DA,pk;do if(not(#ug>0))then else local hT=({});for LP,BP in u,ug do for CH,nH in u,BP do if(not(nH[1]==Mg and nH[2]>=0))then else local yJ=nH[2];if(not(not hT[yJ]))then else (hT)[yJ]={Mg[yJ]};end;(nH)[1]=hT[yJ];(nH)[2]=1;end;end;end;end;end;until(Wj);do return Wj,yU,dU;end;else local am=(BZ[8]);(pk[am])(pk[am+1],pk[am+2]);Ek=am-1;end;end;end;end;else if(not(hZ<95))then if(not(hZ>=98))then if(not(hZ<96))then if(hZ==97)then pk[BZ[8]]=q(pk[BZ[2]],pk[BZ[6]]);else pk[BZ[8]]=v(BZ[3],BZ[10]);end;else local dP=BZ[8];local oP,QP=dP+1,(dP+2);(pk)[dP]=Sj(F(pk[dP]),Yj);pk[oP]=Sj(F(pk[oP]),Tj);(pk)[QP]=Sj(F(pk[QP]),Jj);(pk)[dP]=pk[dP]-pk[QP];wk=BZ[1];end;else if(not(hZ>=100))then if(hZ~=99)then (pk)[BZ[8]]=V(pk[BZ[2]],pk[BZ[6]]);else repeat local PW,KW=DA,(pk);do if(not(#PW>0))then else local m5={};do for Fb,eb in u,PW do for ZP,kP in u,eb do if(not(kP[1]==KW and kP[2]>=0))then else local qn=(kP[2]);do if(not m5[qn])then m5[qn]={KW[qn]};end;end;kP[1]=m5[qn];(kP)[2]=1;end;end;end;end;end;end;until(Wj);do return mj,BZ[8],Ek;end;end;else if(hZ~=101)then do (pk)[BZ[8]]=BZ[3]==BZ[10];end;else if(BZ[3]==pk[BZ[6]])then else do wk=wk+1;end;end;end;end;end;else if(not(hZ>=92))then if(not(hZ>=90))then if(not(BZ[3]<BZ[10]))then wk=wk+1;end;else if(hZ==91)then local w0=BZ[8];(pk)[w0]=pk[w0](pk[w0+1]);Ek=w0;else do if(BZ[2]==218)then do wk=wk-1;end;vA[wk]={[8]=(BZ[8]-117)%256,[2]=(BZ[6]-117)%Rj,[9]=61};elseif(BZ[2]~=208)then local e5=BZ[8];local n5,y5=e5+2,(e5+3);local s5=({pk[e5](pk[e5+1],pk[n5])});for oX=1,BZ[6] do pk[n5+oX]=s5[oX];end;local N5=pk[y5];if(N5~=kj)then pk[n5]=N5;else wk=wk+1;end;else do wk=wk-1;end;do vA[wk]={[9]=61,[8]=(BZ[8]-15)%256,[2]=(BZ[6]-15)%256};end;end;end;end;end;else if(hZ<93)then (pk)[BZ[8]]=b[BZ[2]];else if(hZ~=94)then do pk[BZ[8]]={};end;else do if(BZ[6]~=129)then for Hx=BZ[8],BZ[2] do do pk[Hx]=kj;end;end;else wk=wk-1;(vA)[wk]={[2]=(BZ[2]-33)%Rj,[8]=(BZ[8]-33)%256,[9]=22};end;end;end;end;end;end;end;end;end;end;end;end;end;end);if(not(Gk))then if(S(ck)~=zj)then (H)(ck,0);else if(U(ck,bj))then return im();end;if(not(U(ck,Pm)))then (H)(ck,0);else H(Fm..(wA[wk-1]or Om)..Sm..t(ck),0);end;end;else if(ck)then if(uk==1)then return pk[bk]();else do return pk[bk](M(pk,bk+1,Ek));end;end;elseif(not(bk))then else return M(pk,bk,uk);end;end;end;if(aj)then aj(xA,LA);end;do return xA;end;end;local function Pj()local tU,dU=kj,(kj);local vU,oU={kj,kj,kj,{},kj,kj,{},kj,{}},0;repeat if(oU~=0)then dU={};break;else tU={};oU=1;end;until(mj);local PU,KU=kj,kj;for Es=0,8 do if(Es<=3)then if(not(Es<=1))then if(Es~=2)then (vU)[13]=a();else do vU[8]=a();end;end;else if(Es~=0)then do (vU)[14]=W();end;else PU=1;end;end;else if(not(Es<=5))then if(Es<=6)then for RU=1,KU do local HU=W();local WU=(W());local mU,yU=1,kj;while(mU~=2)do if(mU~=0)then yU=W();do mU=0;end;else for Y0=HU,WU do (vU[9])[Y0]=yU;end;mU=2;end;end;end;else do if(Es~=7)then (vU)[13]=W();else (vU)[5]=a();end;end;end;else do if(Es~=4)then KU=W();else (vU)[2]=a();end;end;end;end;end;local xU=W()-133705;local nU=(a());local iU=a()~=0;local zU,fU=kj,(kj);for tf=0,5 do if(not(tf<=2))then if(not(tf<=3))then do if(tf~=4)then for Z3=1,fU do (vU[7])[Z3-1]=Pj();end;else fU=W();end;end;else (vU)[1]=G(1,2,zU)~=0;end;else if(not(tf<=0))then if(tf~=1)then vU[6]=G(1,1,zU)~=0;else do zU=a();end;end;else do for vO=1,xU do local zO,iO,AO=1,kj,kj;while(Wj)do if(zO~=0)then zO=0;else AO=a();break;end;end;zO=1;while(Wj)do if(not(zO<=0))then do if(zO~=1)then do if(AO==164)then iO=C(R(nU),10);elseif(AO==106)then iO=r();elseif(AO==100)then iO=C(R(nU),W());elseif(AO==120)then iO=Wj;elseif(AO==23)then iO=K();elseif(AO==252)then do iO=W();end;elseif(AO==119)then do iO=mj;end;elseif(AO==44)then iO=K();elseif(AO==45)then iO=W();elseif(AO==254)then iO=C(R(nU),10);elseif(AO==131)then iO=K();elseif(AO~=193)then else iO=C(R(nU),2);end;end;zO=2;else if(AO==164)then do iO=C(R(nU),10);end;elseif(AO==Hm)then iO=r();elseif(AO==100)then iO=C(R(nU),W());elseif(AO==120)then iO=Wj;elseif(AO==23)then do iO=K();end;elseif(AO==252)then iO=W();elseif(AO==119)then iO=mj;elseif(AO==44)then do iO=K();end;elseif(AO==45)then iO=W();elseif(AO==254)then do iO=C(R(nU),10);end;elseif(AO==131)then iO=K();elseif(AO~=Cm)then else iO=C(R(nU),2);end;do break;end;end;end;else if(AO==164)then iO=C(R(nU),10);elseif(AO==106)then iO=r();elseif(AO==100)then iO=C(R(nU),W());elseif(AO==120)then iO=Wj;elseif(AO==23)then iO=K();elseif(AO==tm)then do iO=W();end;elseif(AO==119)then iO=mj;elseif(AO==44)then do iO=K();end;elseif(AO==45)then do iO=W();end;elseif(AO==254)then iO=C(R(nU),10);elseif(AO==131)then do iO=K();end;elseif(AO~=193)then else do iO=C(R(nU),2);end;end;zO=0;end;end;do (tU)[vO-1]=PU;end;local RO=({iO,{}});zO=0;while(zO~=2)do do if(zO~=0)then do PU=PU+1;end;zO=2;else dU[PU]=RO;do zO=1;end;end;end;end;if(not(iU))then else do (J)[z]=RO;end;do z=z+1;end;end;end;end;end;end;end;oU=1;local jU=kj;repeat if(oU==0)then jU=W()-133783;break;else do vU[3]=a();end;oU=0;end;until(mj);local lU=(a());for ha=1,jU do local ca={kj,kj,kj,kj,kj,kj,kj,kj,kj,kj};local xa=Z(lU);local za=(9);while(Wj)do if(not(za<=4))then if(not(za<=6))then do if(not(za<=7))then if(za~=8)then ca[9]=a();za=2;else (ca)[12]=G(5,6,xa);za=4;end;else (ca)[2]=G(9,14,xa);do za=6;end;end;end;else do if(za==5)then ca[14]=G(22,26,xa);do za=1;end;else (ca)[6]=G(9,23,xa);break;end;end;end;else if(not(za<=1))then do if(not(za<=2))then if(za==3)then (ca)[12]=G(1,3,xa);za=8;else do (ca)[8]=G(8,6,xa);end;do za=5;end;end;else ca[14]=G(15,12,xa);za=3;end;end;else do if(za~=0)then ca[1]=G(18,14,xa);za=0;else (ca)[19]=G(23,11,xa);za=7;end;end;end;end;end;(vU[4])[ha]=ca;end;local AU=(Y[vU[5]]);for Ab=0,1 do if(Ab~=0)then (vU)[11]=a();else do for Am=1,jU do local cm=vU[4][Am];local pm=kj;local bm=0;local em=AU[cm[9]];repeat if(not(bm<=0))then if(bm~=1)then do if(em~=8)then else (cm)[1]=Am+(cm[1]-131071)+1;end;end;bm=3;else do if(not((em==3 or pm)and cm[6]>255))then else local dt,Ct,Rt=2,kj,(kj);repeat if(not(dt<=1))then if(dt~=2)then Ct=tU[cm[6]-256];dt=0;else (cm)[4]=Wj;dt=3;end;else if(dt~=0)then if(not(Rt))then else local vT=kj;local UT=(0);while(UT<=2)do do if(not(UT<=0))then if(UT~=1)then vT=Rt[2];UT=1;else vT[#vT+1]={cm,10};UT=3;end;else (cm)[10]=Rt[1];UT=2;end;end;end;end;dt=4;else Rt=dU[Ct];dt=1;end;end;until(dt>=4);end;end;do bm=2;end;end;else do pm=em==6;end;bm=1;end;until(bm>=3);bm=1;repeat if(bm~=0)then if(not((em==4 or pm)and cm[2]>255))then else (cm)[5]=Wj;local xi,ui=kj,kj;do for sD=0,1 do do if(sD~=0)then ui=dU[xi];else xi=tU[cm[2]-256];end;end;end;end;if(not(ui))then else local rK,LK=1,kj;do repeat if(rK<=0)then LK[#LK+1]={cm,3};break;else if(rK==1)then do (cm)[3]=ui[1];end;rK=2;else LK=ui[2];rK=0;end;end;until(mj);end;end;end;bm=0;else if(em==13)then local g8,w8=kj,(kj);local V8=2;while(V8<3)do if(not(V8<=0))then if(V8~=1)then do g8=tU[cm[1]];end;V8=0;else if(not(w8))then else (cm)[7]=w8[1];local l8=w8[2];do l8[#l8+1]={cm,7};end;end;V8=3;end;else w8=dU[g8];V8=1;end;end;end;bm=2;end;until(bm>1);end;end;end;end;do return vU;end;end;local Fj=(Pj());do (b)[2]=J;end;do J=kj;end;return ij(h,Fj,kj)(...);end)(pcall,rawset,getfenv,rawget,bit32,"\94\46\45\58\37\100\43\58\32",coroutine.yield,"\110",string.gsub,"","\98\111\114","\98\121\116\101",next,"\96\102\111\114\96\32\108\105\109\105\116\32\118\97\108\117\101\32\109\117\115\116\32\98\101\32\97\32\110\117\109\98\101\114",setfenv,nil,"\98\120\111\114",106,error,true,"LPH)A1C5013339692H9699963966696698699969D6669699962H662H692H99362H692H669969666D99662H69D62H669D8999662H998966966654A6742100046H0083E4A0274A0A0200ED192CE05C6HFF2H023H003C5D094B007B00133H00013H00083H00013H00093H00093H00019F332A0A3H000A3H0019E382650B3H000B3H0037D6FC430C3H000C3H00F018E30C0D3H000D3H00130C87050E3H000E3H00E8DD074A0F3H000F3H0070FF4C72103H00103H00AA016217113H00203H00013H00213H00213H000A3H00223H00233H00013H00243H00273H000A3H00283H00293H00013H002A3H002B3H000A3H002C3H002D3H00013H002E3H002E3H000B3H002F3H00303H00013H00313H00353H000B4H00E30F7014510A02003D2HC1173H00A152D27138B8CDFF9E9BC3D70E4E4068B916B24BFA203AC10A3H000410FA01DE44B2D77274C10F3H00322F53EA5219F4E1F2733B6001DE01C1063H0031FE0C1B24B2C1413H009BBD67E0D0C954FAF1B08F6D436C5460AD4EAFDA9659D5982E75B69A0657946C634D6AE48C090EFFA32C1F6E427793293706AFEB561047EB6C173657804E9F3E76C1113H00A49679D3AD6FF0D9DEAAE940E11A41A2A8C14H00C1103H00397605579469C49D45BFC0FDD5C344C12H023H007FEC5E7B008301133H00013H00083H00013H00093H00093H00B0FFD83F0A3H000A3H0086B63B650B3H000B3H0006CFA5580C3H000C3H00C290141E0D3H000D3H003BFF625A0E3H000E3H0025A6B61E0F3H000F3H00A7ADA179103H00133H00013H00143H00153H00053H00163H00173H00013H00183H00193H00053H001A3H001A3H00063H001B3H001C3H00013H001D3H001D3H00063H001E3H001F3H00013H00203H00233H00063H00243H00253H00013H00263H00263H00064H001089B0454F0A0200BDCAC1133H006956D82F8175FF7C2DCE1343E8262F485B2C5EC1063H0010A3F73EFBE7C14H00C1173H00A2972DBCB3F5BACAC51EAC2A75D3777DB293ED4671ADED2C017H00C1093H00F991DE1B5D49BCE1115H0005BD0A020009C585C645142H6A69EA142BEB29AB14D8182HD815018100014DF6362HF61D2HC77EB60844C4FF3008FD2CCA9C4D426506B753630D1A2430703A0C9C15F9959FDC0C0E06FFE44DBF4061F0532H1C2H5C4D3H35B5145A9A1B1A4DDB6D2H2D19482H880823313H714D3HA62614F737B6B74D2HF42H741D2HAD2H6D4D32B2F2F3343H1393142H60F2A05E296828291DFEFF2HFE31EF168E0F432H0C8C8E3E65A5A4A51DCACB2HCA024B0B8A0B093H38B8142HA1EDE15E5602C22710CAE443CD1900F500173H00013H00083H00013H00093H00093H007E9E7F610A3H000A3H002H21C47F0B3H000B3H00ADB8AD5E0C3H000C3H000AD9D5360D3H000D3H00E49F41000E3H000F3H00013H00103H00103H000F3H00113H00123H00013H00133H00153H000F3H00163H00173H000E3H00183H001E3H000F3H001F3H00203H000E3H00213H00273H00013H00283H00283H000E3H00293H002A3H00013H002B3H002C3H000E3H002D3H00303H00013H00313H00313H00113H00323H00333H00013H00343H00343H00113H00353H00363H00013H00373H00393H000C4H00ED3D8434550A02002HED77C1063H0082E6E87BD03AC14H00C10A3H009454ED82E4B19518D585C1053H00721B4D7DC8C1143H006BEE8B7D06592928E77B88590D3E2BE71504B86BC1173H0047D95BEEC16394B8F7805A380705E98F409DBB34A31BC3C1083H0042FD89B4BCABAE97C1073H003A3C151E31C72D2C30F86HFFC1073H0091504A8A1700A8C1133H00C4CE3C3795FDB3148106B70B1C1E5330C714FA5H0005D00A02008FA727AB27142A6A26AA142H717DF1142C6C2D2C154B0B4A4B4DFE3EFFFE1DB5F58CC50820E01A5508EF4EA864501238A52547B9824F853BD43A9A5409136EF8445E66266FE614FDBD2HFD3DC809C9C81DB7B62HB7317AAA75D64D2H8101033EFC89C81B105BDB5ADB140E4ECFCE4D4585BA3A14B0307071343F7FC24014A2E263E209C90936B614A4E458DB1463A22H634D36B6C849142H0D2H8D1D2H18E56714C747C5C74D3HCA4A1491D190914D8CCCCDCC4D3H6BEB142HDE9F9E4D5595D7D51D802H40C0233H4FCF143HF2B25E19995B594DF4B4088B1473332H734D2H4607061D5D3H1D3168BBA86F2AD72H57D7233H9A1A1421A11F215E1C5CEA63142H7B797B4D6EAE9111143H65E51C10D0EC6F145FDFA620149104CC0A02005D8202810214B7F7B437142HC8CB481485058485157E3E7C7E4D034302031D2H249C5408B1F18AC608BAC62A6A424FC20AEF08008E44EF129DA946A518F687AFF705DB205DBB0E1C570A36064974F9C60AF2322HF24D3H67E714B8F8BAB84DF5B5B4B51DEE2H6EEE233HB3332H14547E145E4HE115AAEA2HAA52BFFFBEBF4D3H30B014CD8DCFCD4D66A627261DCB3H8B318C865FE353F93H794DE2226263343H179714286895A85E25652HE51D2H1EDE5F3E632HE3632304C405044D3H1191141A5A181A4D2FEF6E6F1DA03H204D3HFD7D1416D694964DBB7B3B3A343HFC7C142H29D0A95E12522HD21D2H8747C63E18D82H982H15D59515540ECDFAC65AE200A1062800E66H002AE29A057A0A02007100C1063H00077C22C7576CC1063H00F5453090C0F8C10B3H00A3B7026CB2AB78186FB5BDC14H00C10B3H00EA609B0D3100CC5FBBC9CB2C017H00C1063H00E11984D3E0D8C1073H000FCB164D22E4912CF57H002C00016H00C1043H00A20519C12C027H002C047H00C1083H0016E70504AAEA4A283DC1073H00FE6139BA152238C1053H0081B9242544C1093H005ADB5B87BB8E4AF830C1093H00174307F319434C6531C1073H0004D7EBDE9A0860C1083H00E79F44F27D85BB8C2C8H00C1063H004FA0E80CEFADC1083H003D85D2C8973385C6C1053H00A5BE66D43CC1093H003E0CC76EDDE9EFA052C1063H00BBED14EE8C1CC10C3H0029517C05B8F63628F094E735C1073H004519CB3690B0942CD57H00C1053H0038CF2B5349C1043H0061A8324CC1053H001565D078ACC1053H00AEA0601C50C1053H00F79254EE5FC10D3H00F0826F2B89FC0AF2AC2C90ABA9C1063H000139A4ADDABE2C477H00C1093H002FC0063D17DA74ACF02CFF7H00C1063H009C8E69A6E5E9C1083H00AAA0DB5070571D95C1063H00923833C062FFC1053H00600A25A32077C1073H00099C623FCE0743C1083H003C13B9045C402BF1C1063H002486E1A377FAC10D3H0032746935CB5E74946E0E96C5EB02063H007B95B96E00BD6H00FD0B156B490A02003500034H0003AC0A02008313531793142H1A1E9A1495559615147434757415E7A72HE74D5EDE2H5E1D894931F90858D8622F08FBD77FA15AA2D4EAFA033D42D2F630FC351A5B04CF9726EB2B66CD9CA617317DDB882B60645A971AA342E04A4F3HAA2A1425E6D1ED5AC43H8416772H33AF3669967D337D0186015H00D87A7D2E4D0A0200F100C1023H00A34B2C017H00C1093H00DD70B62BF4077E3129C1073H00EA4C21953B104C034H000BD50A0200E72HEEE76E143DFD35BD1460E068E014C7072HC71522622H224D612160611DB4740CC4088BCB31FE08568E86E930C5F4D2081B085075C24A4F9E14CD038A07B7685229F424485CDC4EA7C928D35CA40D4A3E29613E154D8D49CD1430702H303D97175FD7552H727BF214F171F1714484447BFB14DB5B2H1B1D263HE631957475A90118D92H184D3H1F9F149ADB2H9A4D39782H791DACED2HEC31A3C8BAA45C4EC706CE5E5D5C5D5C2E3H008014E7A6D9E75E82832HC21D41817AFE5FD43H545DABE223EB5E36F6CC4914253HE56328902HDE19AF6DAFAE21EAE82HEA312H8970F614BC3CBC3C14F3712HF34D9E1CDFDE026DAD901214D0922HD04877752H7731D2472EDD3E11A8A9BD0CE4A524270D2H3BBB384086C670F9142HF5088A14783HB8573H3FBF14FA7A2H3A4D59D92H992FB056E57D5D06A56H001F56EE27500A02000D002C017H006A3H00205FA002422CFF7H00C1063H00ADCEE9BDD72E2C8H00C1063H0087B9EBD256F4C1023H0011D55H0009DA0A0200318CCC800C142HCDC14D14FA3AF17A142HA3A2A31518982H184D2H696B691D66265E16082H9F24E908E425FED752C5F9A5C714D28821041B5B858AB02D305837D85FA1EB6C9C627EBE76FE14973HD7312H3C30BC14BD3DB93D146AB71C115A532H921017C808C9481419182H59573H9616144F8E2H0F4D945515144D3HB5351442432HC24DCBB32HFD192060DD5F1491512CAE55AE6EAF2E143HC747233HEC6C142D6D90AD5E5A9AA02514037637E4107838860714C9092H4902C60638B9143F7F7E7F1D44C4C5C41D253HA531722C8D6B5FFB3B3A3B1DD02HD1D01DC180C0C13C1EDEDFDE3C37772HB73CDC1C2H9C3CDD5D2H9D4D8A4A7CF5144HF3573H28A81439B92H394DB676F7F61DAF3HEF31F456AE962515D52H951D22E2DD5D14AB6BABAA21C08081801D2H312HB11DCE3H0E1DE73H2731CC902E893ACD0D7BF25FBA3A45C514FE63CD581B006A6H001E58E912490A02009900034H0003AC0A0200AB632367E3142H5256D21495559615142H9C9D9C1517572H174DF6762HF61D2H695018082HE0DA9608CBDEE9CD595A160B5F18FD0B402C0EA498CA10017F3A238B07FE9B370E2B919C82444268C670EE3BF3091934393H62E21425F8535E5A2CE5245C07273H67638FBB343A69004C6H004DBDED29490A0200496H0002A70A0200C106460586142H4F4CCF14E424E66414D5152HD515F2B22HF24DCB4B2HCB1DB07008C108B1310BC5085E2DB5FF29C7A2E18B5A3C903640538D2FF4613F0A0BAF7A25C32B184F174812118014E9349F925A9248790E7701CE015H00B97EDF29490A0200B900034H0006B30A0200F12H3632B614EF2FEC6F1434B437B4141555142H1562222H624DAB2B2HAB1D408078300831B10B47084EC4FF243F672322962D4CDFC252588D9B6C990CBA5997DD27238AB60B20D8ACD5CA4BA9E9A929146632F21710DF3H5F00643HE4573H05851412D22H924DDB3H1B02F02HF1F0102120A121307E00DCBC4CD7962H9716BCFC41C314FD49CE963DF832FB0C0200AF2H2A72AA149151C61114EC6CBB6C142BAB292B157EFE7A7E4D551553551D60E05811088F4FB5F808928DE77A4A596F8DFF1AD4E7C8D92D739949233E262256D9379D5DC91D1488B7BD6D252H17289714FABA8C7A14A1ADA539367C3CB42C1E3BFB5BBB144E7173781925AD2HE52F70B82HB0632HDF1C190F2HE2D462142HE9DA6914242C65641D83443FC35F76F1B7B61D6DD3111B1958D8A62714A71A9A4010CA4A804A14B131B83F1C8C0CC80C144BCB68CB149E1B1F1E08F5702H7531806012E63E6F6A2HAF1DB2F42HB248393F7C791DB474B3341453AD6A651946812H8631BD7DFF3D14A868A0281477322H375D9A1A66E51401472H415D9CDA2HDC319B3610EC3B6EE8EDEE1D85032H0531D0DDA7521A7F392HBF1582022H820209C90D0902044400040263E36763022H565256022H4D484D02F838078714474047465D6A6D2H6A315182CAC45E2C2BED21386BEB6BEB143EF9BFBE1595D5929502A06058DF14CF0889593B12152H521599599F99022H54AA2B14F37572731526E6D959145DD85CDD2A884D2H485D97522H57313A141FCF0A61672H615D7C3C8B03147BFB6FFB14CE068E8F5B3H25A514B0B8B3F05E2H9FD7580F22E23CA21429A929A914A49912C310432HBDB519F6760B89146DAD5BED14589B2H983167E78A18140A8A618A1431CFCEC719CC73F2FA198B0B8E0B145E57D74C45350A8B83194080BF3F146F262HEF1D72FB2HF231B947952E07B4BDFDE745135A2H931D46CF2HC6313D4E62AE4668D6558F1077B78808145A2H53C94541890081093H1C9C145B53D89B5EAE13934910050DCD541750D818800DFF3FFE7F142H8241440F4909A13614448441C414E31C9D95191629A8A0198D4D8D0D14787130380287477FF814EAE222BB171151EC6E142C52D10B102HABA92B143EB72HFE1A3HD5551420698AE05ECF078F0F0B3H9212141911ECD95E54DC9C9402F30C8D85192H669A19149D23A07A10080188895B3H971714FAF33D7A5E219F1CC6102HBC40C314BBFBA43B144E06C6CE0265A59A1A14F078B82051DF172H1F31622276E21469297CE91464A0E7D719C3831FBC14362H3C3610ADA72DAD3058BFA9F70DA7272E281C4A8A76CA14713B2H31564C8C0C3A19CB8BEF4B142H9E96151CF535D1751480C08100146F51162H19327232B214F971F9F85B2H34CA4B14931BD4D30206C6F879143DFDD74214686229281DF7BD2HB731DA68A7D9410180C1C80C5C1C5CDC149B112HDB1D6EAE6EEE1445CF84851D10DA2HD031BF65D9FD5F42C84D825F49B736EE10840478FB14E3A92HE348D6DC2HD6310DFCB1A925F870727802C78DCFC7022A6DE3FE172H514BD1142C24A4AC106BE36BEB30FEDE82573F15DD9515543H20A0144F07464F5ED2DA2HD25D19112H1931141B392033B3FB2HF35DE6AE2HA6315DA89DD11F48C02HC8563HD75714BAFAAC3A14615C5686103C41409B10BBB2F2FB100E8EF07114655910C210F02H4E46195F1FA52014226AAAA20269E121B94E246DAC3429030A8A1346363FFE660EEDE464FF3FD8D0100A11A72H5A80104AC2029A06B1792H71312H4CA033140B4B198B141ED8C1A43035F50BB514C080D640142H6F45EF14B27A2H723139B9E4461474B474F41493DB1B13024686B93914BD35F56D492H68961714F777B677149A12D24A372H01FF7E145CDB9D9C1DDB1C2H1B316E464B914A05B97EA22H10D0EF6F143F377E7F1D4282BD3D1409CEDC495F842HCDC4022H236BA314D61F2H16310D4DEA72142HB8BB3814C7CF04160D3H2AAA14511995914DEC25646E333H2BAB147EF77A7E4D159CDDD033E0696360028F4F70F014D22H1B1202D9D059585BD45D9D962H33F3C84C14E666B56614DD1D9DAB190888018814171E2H1731FABAC87A14216126A1143CBCEE43147B723D290D2H4E0ECE14E525ECF540B070B430149F1F77E0146229E2E3213HE96914E4EF71645EC3C8484B62B67649C914ADE6293A0D5812534F452H2725A7148A81C1C34EF1FA3A354C8CC8878C022H4B7ECB149E5F1E2819B5F42H4319C00B0900022H6F10C810B23249CD1439327D71292HB449CB141346DE153D86467FF914BD7D963D1468E020B83537F7EF4814DAD0909A10014BC141305C213C6A245B11515B02EE2E11911405C5FA7A14109A5250023FF5B6BF0242488882100949E37614443A393219632B2H632F56D62HDF1C4DCDF53214F838D67814074262C7556A2AD1151411D63EAE552CEC985314ABA36E6B4D3HBE3E14551D91954D60DD1DC710CF0F30B01492DA52535B59912H9931549454D41473334DF314E62EA62630DD9D3FA21448C847C81497D0AB28553AFA35BA14212464611D3C792H7C31FB9BCF4D190E4B878E1DE56024251D30F52HF0311F538726246267DB5D5F692D2B291DE4A02HA43183BC012B5F76B2F1F61DAD692H6D5D589C2H98312731A6E9600A4F030A1DF1710A8E142HCCCBCC4D3H8B0B145EDE5A5E4D2HB5352533004047404D2HAFEF60333HF27214F939BDB94D74F4F3F44D2H939113148645C2C64D3HFD7D14A86BECE84DF73477F05C3HDA5A14010285814DDC9F9C5D5C9BDF929B1D2EEED651142HC545C033509097904D2H3FFF7233C2C3CEC24D3H49C91444C540444DE362ABA34D165795964D3H8D0D14B8B93C384D47C68C874D3HAA2A14D19015114D6CEE656C4D3HAB2B14FE7CFAFE4D9597D1D54DE0201F9F148F0D2H0F4D3H921214595BDDD94D54169C944DB3734CCC14666560664D1D5DEA621408B535EF10975746E8147A3A2H7A3D6166A6A110BC7C43C3147B3CBB4822CE4E30B11465E56CF21C2H30D94F141F9FC26014A2A52H62156961E96E5DE4EC2HE43183BC23633B363EF73B38AD2DA42D1458D0D8D92E2HA7AF27144A028C453831F135B1148C31B16B108B74F5FD199E1E961E14353DF5F4213H800014EFE75E2F5EF23A2H3231F9B911861434F433B414D39B13DC3806C6F979143D35F4323828E0E32738B7BF73B8381AD2D01538C1C909CE382H5CA72314DB531AD4386E66A461382H8578FA14D0981ADF383FB7FF303802C2028214097435EE10C44C84852163ABEBE3022HD62FA914CD058B5B3BF8064F4E1947CF2HC75DEA2A17951491592H51156C9111CB106B54D5DD193EFEC9411415DDD41A3820A8EA2F384FCFB53014526DECE41959502H191AD45420AB14F373678C14E620A6A75B3H5DDD14880ED8C85E17D352DB17FAFCBEB0293HE16114FC3C268314BBBDFDF24E0E8E0E8E1425D92H9319B00C4B46195F9FA32014E2E424264C699012CE1024A4D95B1443492H034836F6764019ED2D38921498102H1831E7276B98142H8A06F5147131B10E14CC07C7CE333H0B8B145E55DADE4DF57EBEB0333HC04014AFE46B6F4D2HB2CC1510B9F23221177434890B1453191A13024686813914BDB5787D4D3H68E814377FF3F74D9A27E73D10C18901005B3H9C1C14DB131F1B5E6EA62HAE31C545C045141050149014BF37F76F434282DB3D14898303B655C4440ABB146329AAA913561C2H16310DCD8E7214B8381EC714878E0E071DAA232H2A31D118987632EC25ECED216B622D390D3H7EFE1415DC51554D20692H60318FCF8C0F14129212921419A66E6F19942H2B221933B3CF4C14E6A62799145D1A6AE25508889B7714D710DB685F3ABDFBFA1D21E1DE5E147C0307350C3BFBC444140E064F4E1D2HE51B9A14300098FF312H9F9E1F142HE25A9D14A957548E102H6465E41443892H431AB636B23614ED10934A1018D12H58082H27D95814CA8AF5FC192HB1B731140C064C81384BCBB634145ED8980C17F58A4D43192H000680146F26A6AF1D72BB2HB231392F544661F4B4898219135AD253093H860614FD74B9BD5EA85615CF1037F7CB4814DA931A9A0B41C1B73E149CD62HDC5D1B512H5B31EEB8DD0A2A850F85045DD05A2H50313F6D603C6402C8488F388903C804380484FD7B1423EAE3632A16D3DE44170D844C4D02382HC7CE1947C7BE3814EA636F6A4D3HD15114ACA5282C4D6BAB555D197E400BD91095556FEA1460E8A5B10D0F07474D333H52D21459119D994D146B6C621973CDCE1410A6AF2F261D5DD42HDD31C87A621A55971E52460DFAF3B3BF336168E061093H7CFC147BB2667B5E8E078C8E02652C20254D3HF070149F56DBDF4D625C9F45102H29161F19A4AD25A40983033FFC142HB6C1C019ED2H6D5B1958D8A5AE1967A79818140AC08A0A543HF17114CC06E1CC5E8B4B06F4149F02B10A0200AF5E9E5DDE14B535B63514400043C014EF2FEEEF154HF24DB9F92HB91DF474CC850893D329E7084680A84864BD7F200E3BA82BC2CE14B76861591A9A4E0AAD2601A5D9F7659CBB6EA808DB29A39E0DEE86722B0245052H451590D010902C4HFF154HC2524H494D043H445223EB2BE35E4H961A4H8D6300","\114\115\104\105\102\116","\35","\115\116\114\105\110\103","\97\116\116\101\109\112\116\32\116\111\32\121\105\101\108\100\32\97\99\114\111\115\115\32\109\101\116\97\109\101\116\104\111\100\47\67\37\45\99\97\108\108\32\98\111\117\110\100\97\114\121",252,string.char,tonumber,select,table,"\117\110\112\97\99\107",bit,"\108\115\104\105\102\116",string,"\98\97\110\100",_ENV,setmetatable,"\118",false,"\46\46",assert,table.insert,"\114\101\112",unpack,type,string.sub,"\96\102\111\114\96\32\115\116\101\112\32\118\97\108\117\101\32\109\117\115\116\32\98\101\32\97\32\110\117\109\98\101\114",256,"\98\110\111\116",tostring,"\76\117\114\97\112\104\32\83\99\114\105\112\116\58","\58\32","\109\97\116\99\104",193,"\96\102\111\114\96\32\105\110\105\116\105\97\108\32\118\97\108\117\101\32\109\117\115\116\32\98\101\32\97\32\110\117\109\98\101\114","\40\105\110\116\101\114\110\97\108\41",...);
