local validation = require("validation")

local CONFIGURATION = nil
local configSchema = validation.is_table{
    api_key = validation.is_string(),
    model = validation.optional(validation.is_string()),
    base_url = validation.optional(validation.is_string()),
    features = validation.optional(validation.is_table{
        translate_to = validation.optional(validation.is_string())
    }),
    additional_parameters = validation.optional(validation.is_table{})
}

-- Attempt to load the configuration module
local success, result = pcall(function() return require("configuration") end)
if success then
  CONFIGURATION = result
else
  print("configuration.lua not found, skipping...")
end

function validateConfiguration(config)
    config = config or CONFIGURATION
    if config == nil then
        return false, "Configuration not found"
    end

    return configSchema(config)
end

function getConfiguration()
    return CONFIGURATION
end

return {
    validateConfiguration = validateConfiguration,
    getConfiguration = getConfiguration
}
