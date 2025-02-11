local configuration_parser = require('configuration_parser')
local busted = require('busted')

describe("Configuration Parser", function()
    it("validates configuration with valid config", function()
        -- Mock a valid configuration
        local validConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            features = {
                translate_to = "en"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(validConfig)
        assert.is_true(isValid, err or "")
        assert.is_nil(err, err or "")
    end)

    it("validates configuration with invalid api_key", function()
        -- Mock an invalid configuration with invalid api_key
        local invalidConfig = {
            api_key = 12345,  -- should be a string
            model = "valid_model",
            base_url = "http://valid.url",
            features = {
                translate_to = "en"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validates configuration with invalid model", function()
        -- Mock an invalid configuration with invalid model
        local invalidConfig = {
            api_key = "valid_api_key",
            model = 12345,  -- should be a string
            base_url = "http://valid.url",
            features = {
                translate_to = "en"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validate configuration without model", function()
        -- Mock a valid configuration without model
        local validConfig = {
            api_key = "valid_api_key",
            base_url = "http://valid.url",
            features = {
                translate_to = "en"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(validConfig)
        assert.is_true(isValid, err or "")
        assert.is_nil(err, err or "")
    end)

    it("validates configuration with invalid base_url", function()
        -- Mock an invalid configuration with invalid base_url
        local invalidConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = 12345,  -- should be a string
            features = {
                translate_to = "en"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validates configuration without base_url", function()
        -- Mock a valid configuration without base_url
        local validConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            features = {
                translate_to = "en"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(validConfig)
        assert.is_true(isValid, err or "")
        assert.is_nil(err, err or "")
    end)

    it("validates configuration with invalid features", function()
        -- Mock an invalid configuration with invalid features
        local invalidConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            features = "invalid_features",  -- should be a table
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validates configuration without features", function()
        -- Mock a valid configuration without features
        local validConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(validConfig)
        assert.is_true(isValid, err or "")
        assert.is_nil(err, err or "")
    end)

    it("validate configuration with invalid feature", function()
        -- Mock an invalid configuration with invalid feature
        local invalidConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            features = {
                invalid_feature = "invalid_value"
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validates configuration with invalid translate_to in features", function()
        -- Mock an invalid configuration with invalid translate_to in features
        local invalidConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            features = {
                translate_to = 12345  -- should be a string
            },
            additional_parameters = {}
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validates configuration with invalid additional_parameters", function()
        -- Mock an invalid configuration with invalid additional_parameters
        local invalidConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            features = {
                translate_to = "en"
            },
            additional_parameters = "invalid_parameters"  -- should be a table
        }

        local isValid, err = configuration_parser.validateConfiguration(invalidConfig)
        assert.is_false(isValid, err or "")
        assert.is_not_nil(err, err or "")
    end)

    it("validates configuration without additional_parameters", function()
        -- Mock a valid configuration without additional_parameters
        local validConfig = {
            api_key = "valid_api_key",
            model = "valid_model",
            base_url = "http://valid.url",
            features = {
                translate_to = "en"
            }
        }

        local isValid, err = configuration_parser.validateConfiguration(validConfig)
        assert.is_true(isValid, err or "")
        assert.is_nil(err, err or "")
    end)
end)
