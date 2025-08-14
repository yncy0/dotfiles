-- Retrieves configuration at "/nvim/lua/config" directory
-- @param {string} get the path directory via config.* 
--
-- @example 
-- if you have "nvim/lua/config/keymaps"
-- require("config.keymaps") -- where the directory is in "/config/keymaps"

require("config.lazy")
require("config.keymaps")

