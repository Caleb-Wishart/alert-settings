local function get_alert_setting(alert_type)
    local alert_settings = {
        [defines.alert_type.collector_path_blocked] = "alert-visibilty-collector-path-blocked",
        [defines.alert_type.custom] = "alert-visibilty-custom",
        [defines.alert_type.entity_destroyed] = "alert-visibilty-entity-destroyed",
        [defines.alert_type.entity_under_attack] = "alert-visibilty-entity-under-attack",
        [defines.alert_type.no_material_for_construction] = "alert-visibilty-no-material-for-construction",
        [defines.alert_type.no_platform_storage] = "alert-visibilty-no-platform-storage",
        [defines.alert_type.no_roboport_storage] = "alert-visibilty-no-roboport-storage",
        [defines.alert_type.no_storage] = "alert-visibilty-no-storage",
        [defines.alert_type.not_enough_construction_robots] = "alert-visibilty-not-enough-construction-robots",
        [defines.alert_type.not_enough_repair_packs] = "alert-visibilty-not-enough-repair-packs",
        [defines.alert_type.pipeline_overextended] = "alert-visibilty-pipeline-overextended",
        [defines.alert_type.platform_tile_building_blocked] = "alert-visibilty-platform-tile-building-blocked",
        [defines.alert_type.train_no_path] = "alert-visibilty-train-no-path",
        [defines.alert_type.train_out_of_fuel] = "alert-visibilty-train-out-of-fuel",
        [defines.alert_type.turret_fire] = "alert-visibilty-turret-fire",
        [defines.alert_type.turret_out_of_ammo] = "alert-visibilty-turret-out-of-ammo",
        [defines.alert_type.unclaimed_cargo] = "alert-visibilty-unclaimed-cargo",
    }
    return alert_settings[alert_type]
end

local function get_alert_type(setting)
    local alert_types = {
        -- first key is the setting name, second key is the alert type from command
        ["alert-visibilty-collector-path-blocked"] = defines.alert_type.collector_path_blocked,
        ["collector_path_blocked"] = defines.alert_type.collector_path_blocked,
        ["alert-visibilty-custom"] = defines.alert_type.custom,
        ["custom"] = defines.alert_type.custom,
        ["alert-visibilty-entity-destroyed"] = defines.alert_type.entity_destroyed,
        ["entity_destroyed"] = defines.alert_type.entity_destroyed,
        ["alert-visibilty-entity-under-attack"] = defines.alert_type.entity_under_attack,
        ["entity_under_attack"] = defines.alert_type.entity_under_attack,
        ["alert-visibilty-no-material-for-construction"] = defines.alert_type.no_material_for_construction,
        ["no_material_for_construction"] = defines.alert_type.no_material_for_construction,
        ["alert-visibilty-no-platform-storage"] = defines.alert_type.no_platform_storage,
        ["no_platform_storage"] = defines.alert_type.no_platform_storage,
        ["alert-visibilty-no-roboport-storage"] = defines.alert_type.no_roboport_storage,
        ["no_roboport_storage"] = defines.alert_type.no_roboport_storage,
        ["alert-visibilty-no-storage"] = defines.alert_type.no_storage,
        ["no_storage"] = defines.alert_type.no_storage,
        ["alert-visibilty-not-enough-construction-robots"] = defines.alert_type.not_enough_construction_robots,
        ["not_enough_construction_robots"] = defines.alert_type.not_enough_construction_robots,
        ["alert-visibilty-not-enough-repair-packs"] = defines.alert_type.not_enough_repair_packs,
        ["not_enough_repair_packs"] = defines.alert_type.not_enough_repair_packs,
        ["alert-visibilty-pipeline-overextended"] = defines.alert_type.pipeline_overextended,
        ["pipeline_overextended"] = defines.alert_type.pipeline_overextended,
        ["alert-visibilty-platform-tile-building-blocked"] = defines.alert_type.platform_tile_building_blocked,
        ["platform_tile_building_blocked"] = defines.alert_type.platform_tile_building_blocked,
        ["alert-visibilty-train-no-path"] = defines.alert_type.train_no_path,
        ["train_no_path"] = defines.alert_type.train_no_path,
        ["alert-visibilty-train-out-of-fuel"] = defines.alert_type.train_out_of_fuel,
        ["train_out_of_fuel"] = defines.alert_type.train_out_of_fuel,
        ["alert-visibilty-turret-fire"] = defines.alert_type.turret_fire,
        ["turret_fire"] = defines.alert_type.turret_fire,
        ["alert-visibilty-turret-out-of-ammo"] = defines.alert_type.turret_out_of_ammo,
        ["turret_out_of_ammo"] = defines.alert_type.turret_out_of_ammo,
        ["alert-visibilty-unclaimed-cargo"] = defines.alert_type.unclaimed_cargo,
        ["unclaimed_cargo"] = defines.alert_type.unclaimed_cargo,
    }
    return alert_types[setting]
end

local function set_player_settings(player)
    storage.settings[player.index] = {}
    local player_settings = settings.get_player_settings(player.index)
    for _, alert_type in pairs(defines.alert_type) do
        local s = get_alert_setting(alert_type)
        if player_settings[s] == nil then
            player.print("Alert settings not found for " .. s .. ". Please report this to the mod author.")
        end
        if player.is_alert_enabled(alert_type) then
            if player.is_alert_muted(alert_type) then
                storage.settings[player.index][alert_type] = "Muted"
                player_settings[s] = { value = "Muted" }
            else
                storage.settings[player.index][alert_type] = "Enabled"
                player_settings[s] = { value = "Enabled" }
            end
        else
            storage.settings[player.index][alert_type] = "Disabled"
            player_settings[s] = { value = "Disabled" }
            player.mute_alert(alert_type)
        end
    end
end

local function update_settings_storage()
    storage.settings = {}
    for _, player in pairs(game.players) do
        set_player_settings(player)
    end
end

script.on_init(update_settings_storage)

script.on_load(update_settings_storage)

script.on_event(defines.events.on_player_created, function(event)
    local player = game.get_player(event.player_index)
    if player == nil then
        return
    end
    set_player_settings(player)
end)

local function set_alert_state(player, setting_name, state)
    local alert_type = get_alert_type(setting_name)
    if state == "Enabled" then
        player.enable_alert(alert_type)
        player.unmute_alert(alert_type)
    elseif state == "Disabled" then
        player.disable_alert(alert_type)
        player.mute_alert(alert_type)
    elseif state == "Muted" then
        player.enable_alert(alert_type)
        player.mute_alert(alert_type)
    end
    storage.settings[player.index][alert_type] = state
end

-- Update global settings storage on settings change
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    if event.setting_type ~= "runtime-per-user" then
        return
    end
    local setting_name = event.setting
    -- only update if it's an alert setting
    if setting_name:find("^alert%-visibilty") == nil then
        return
    end
    local player = game.get_player(event.player_index)
    if player == nil then
        return
    end
    local state = settings.get_player_settings(event.player_index)[setting_name].value
    set_alert_state(player, setting_name, state)
end)

-- Function to handle console commands
local function on_console_command(event)
    local player_index = event.player_index
    if player_index == nil then
        return
    end
    local player = game.get_player(player_index)
    if player == nil then
        return
    end
    local command = event.command
    local parameters = event.parameters
    if command == "alerts" then
        local action, setting, extra = parameters:match("(%a+) ([%a_]+)(.*)")
        if extra ~= "" and extra ~= nil then
            -- invalid parameters
            return
        end
        local type = get_alert_type(setting)
        if type == nil then
            -- invalid setting
            return
        end
        local s = get_alert_setting(type)
        if s == nil then
            -- invalid setting
            return
        end
        local player_settings = settings.get_player_settings(player.index)
        if player_settings[s] == nil then
            player.print("Alert settings not found for " .. s .. ". Please report this to the mod author.")
            return
        end
        if action == "enable" or action == "unmute" then
            -- we make the assumption that if the player is unmuting, they want the alert enabled
            player_settings[s] = { value = "Enabled" }
            set_alert_state(player, s, "Enabled")
        elseif action == "disable" then
            player_settings[s] = { value = "Disabled" }
            set_alert_state(player, s, "Disabled")
        elseif action == "mute" then
            player_settings[s] = { value = "Muted" }
            set_alert_state(player, s, "Muted")
        end
    end
end

script.on_event(defines.events.on_console_command, on_console_command)
