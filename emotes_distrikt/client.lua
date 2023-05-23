
_isanimplayyy = false

RegisterNetEvent('bur_nui_anim:open')
AddEventHandler('bur_nui_anim:open', function()
    SendNUIMessage({showUI = true})
    SetNuiFocus(true,true)
	inmenuopen = true
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if inmenuopen then
			DisableControlAction(0, 140, true)
			DisableControlAction(0, 141, true)
			DisableControlAction(0, 142, true)
			DisableControlAction(0, 24, true)
			DisableControlAction(0, 257, true)
			DisableControlAction(0, 263, true)
			DisableControlAction(0, 264, true)
			DisableControlAction(0, 142, true)
		end
	end
end)



RegisterNUICallback('bur_exit_anim', function(data)
    TriggerEvent('bur_nui_anim:close')
    FreezeEntityPosition(PlayerPedId(), false)
end)

RegisterNetEvent('bur_nui_anim:close')
AddEventHandler('bur_nui_anim:close', function()
	inmenuopen = false
    SendNUIMessage({showUI = false; })
	inmenuopen = false
    SetNuiFocus(false,false)
	--SetNuiFocusKeepInput(false)
	EnableAllControlActions(0)
end)

Citizen.CreateThread(function()
	Citizen.Wait(10000)
	SetPedCanLosePropsOnDamage(PlayerPedId(),false,0)
end)

RegisterCommand('bur_anim_menu_open', function()
    TriggerEvent('bur_nui_anim:open')
end)
RegisterKeyMapping('bur_anim_menu_open', 'Emote Menu', 'keyboard', 'F3')


local handesindhoch = false

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(50)
		if IsEntityPlayingAnim(PlayerPedId(), "random@mugging3", "handsup_standing_base", 3) then
			SetCurrentPedWeapon(PlayerPedId(), 0xA2719263, true)
			handesindhoch = true
		else
			handesindhoch = false
			Citizen.Wait(1000)
		end
	end
end)

RegisterKeyMapping('+handsUp', 'Hände hoch~', 'keyboard', "X")

RegisterCommand('+handsUp', function()
	local playerPed = PlayerPedId()

	if _isanimplayyy or handesindhoch then 
		ExecuteCommand("+c")
	else
		if not IsControlPressed(0, 21) and not IsDisabledControlPressed(0, 21) and IsPedOnFoot(playerPed) and not IsPedSwimming(playerPed) and not IsPedDeadOrDying(playerPed) then
			if IsEntityPlayingAnim(PlayerPedId(), 'random@mugging3', 'handsup_standing_base', 49) then
				ExecuteCommand("+c")
			else
				ESX.Streaming.RequestAnimDict('random@mugging3')
				TaskPlayAnim(playerPed, "random@mugging3", "handsup_standing_base", 1.0, 2.0, -1, 49, 0, 0, 0, 0)
				SetCurrentPedWeapon(playerPed, 0xA2719263, true)
			end
		end
	end
end, false)










RegisterCommand('bur_anim_but_1', function()
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	SendNUIMessage({showUI = false, but = '1'})
    SetNuiFocus(false,false)
	inmenuopen = false
end)
RegisterKeyMapping('bur_anim_but_1', 'Emote Slot 1', 'keyboard', '1')

RegisterCommand('bur_anim_but_2', function()
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	SendNUIMessage({showUI = false, but = '2'})
    SetNuiFocus(false,false)
	inmenuopen = false
end)
RegisterKeyMapping('bur_anim_but_2', 'Emote Slot 2', 'keyboard', '2')

RegisterCommand('bur_anim_but_3', function()
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	SendNUIMessage({showUI = false, but = '3'})
    SetNuiFocus(false,false)
	inmenuopen = false
end)
RegisterKeyMapping('bur_anim_but_3', 'Emote Slot 3', 'keyboard', '3')

RegisterCommand('bur_anim_but_4', function()
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	SendNUIMessage({showUI = false, but = '4'})
    SetNuiFocus(false,false)
	inmenuopen = false
end)
RegisterKeyMapping('bur_anim_but_4', 'Emote Slot 4', 'keyboard', '4')

RegisterCommand('bur_anim_but_5', function()
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	SendNUIMessage({showUI = false, but = '5'})
    SetNuiFocus(false,false)
	inmenuopen = false
end)
RegisterKeyMapping('bur_anim_but_5', 'Emote Slot 5', 'keyboard', '5')

RegisterCommand('bur_anim_but_6', function()
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	SendNUIMessage({showUI = false, but = '6'})
    SetNuiFocus(false,false)
	inmenuopen = false
end)
RegisterKeyMapping('bur_anim_but_6', 'Emote Slot 6', 'keyboard', '6')

RegisterNUICallback("bur_nui_anim_start", function(data)
	if exports["knast_distrikt"]:istimadminjail() then return end
	if IsPedInAnyVehicle(PlayerPedId(),false) then return end
	_isanimplayyy = true
	ClearPedTasks(GetPlayerPed(-1))
	DeleteEntity(tonumber(propname))
	DetachEntity(propObj, true, false)
	DeleteEntity(propObj)

	ad = data.ad
	an = data.an
	wl = data.wl
	useprop = data.useprop
	propname = data.propname
	propbones = data.propbones
	propoffsetX = data.propoffsetX
	propoffsetY = data.propoffsetY
	propoffsetZ = data.propoffsetZ
	proprotX = data.proprotX
	proprotY = data.proprotY
	proprotZ = data.proprotZ

	Citizen.CreateThread(function()
		RequestAnimDict(ad)
		while not HasAnimDictLoaded(ad) do
			Citizen.Wait(100)
		end

		if useprop == true then
			DeleteEntity(tonumber(propname))
			
			RequestModel(propname)

            while not HasModelLoaded(propname) do
                Citizen.Wait(150)
            end

            propObj = CreateObject(propname, 0.0, 0.0, 0.0, true, true, false)
            propBoneIndex = GetPedBoneIndex(GetPlayerPed(-1), propbones)

            SetCurrentPedWeapon(GetPlayerPed(-1), 'weapon_unarmed', true)
            AttachEntityToEntity(propObj, GetPlayerPed(-1), propBoneIndex, propoffsetX, propoffsetY, propoffsetZ, proprotX, proprotY, proprotZ, true, false, false, false, 2, true)
            SetModelAsNoLongerNeeded(propname)
		end
		if useprop == false or useprop == nil then
			DeleteEntity(tonumber(propname))
			DetachEntity(propObj, true, false)
			DeleteEntity(propObj)
		end

		if wl == true then
			TaskPlayAnim(GetPlayerPed(-1), ad, an, 8.0, -8.0, -1, 48, 1, false, false, false )
			TaskPlayAnim(GetPlayerPed(-1), ad, an, 8.0, -1, -1, 49, 0, false, false, false )
		end
		if wl == false or wl == nil then
			TaskPlayAnim(GetPlayerPed(-1), ad, an, 8.0, -8.0, -1, 1, 1, false, false, false )
			TaskPlayAnim(GetPlayerPed(-1), ad, an, 8.0, -1, -1, 32, 0, false, false, false )
		end
	end)

end)

RegisterNUICallback("bur_nui_walk_start", function(data)
	ResetPedMovementClipset(GetPlayerPed(-1))

	style = data.style

	Citizen.CreateThread(function()
		RequestAnimSet(style)
		while not HasAnimSetLoaded(style) do
			Citizen.Wait(100)
		end
		SetPedMovementClipset(GetPlayerPed(-1), style, 1.0)
	end)
end)

-------------------------------------------------------------------------------------------------------------------------------------------------------------