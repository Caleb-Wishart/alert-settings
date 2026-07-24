-- Yes, visibility is spelled wrong. I know. Can't be bothered to add a migration now.
data:extend({
    {
        type = "string-setting",
        name = "alert-visibilty-collector-path-blocked",
        order = "aa",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-custom",
        order = "ab",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-entity-destroyed",
        order = "ac",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-entity-under-attack",
        order = "ad",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-fluid-mixing",
        order = "ae",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-no-material-for-construction",
        order = "af",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-no-platform-storage",
        order = "ag",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-no-roboport-storage",
        order = "ah",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-no-storage",
        order = "ai",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-not-enough-construction-robots",
        order = "aj",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-not-enough-repair-packs",
        order = "ak",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-pipeline-overextended",
        order = "al",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-platform-tile-building-blocked",
        order = "am",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-train-no-path",
        order = "an",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-train-out-of-fuel",
        order = "ao",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-turret-fire",
        order = "ap",
        setting_type = "runtime-per-user",
        default_value = "Disabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-turret-out-of-ammo",
        order = "aq",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    },
    {
        type = "string-setting",
        name = "alert-visibilty-unclaimed-cargo",
        order = "ar",
        setting_type = "runtime-per-user",
        default_value = "Enabled",
        allowed_values = { "Enabled", "Muted", "Disabled" }
    }
})
