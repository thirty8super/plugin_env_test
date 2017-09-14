local os = require('os')
local io = require('io')
local json = require('json')
local timer = require('timer')

--
-- Read and parse the plugin file.
--
--
plugin_file = io.open('plugin.json', 'r')
plugin_json = plugin_file:read("*all")
plugin_info = json.parse(plugin_json)
plugin_file:close()

print ("_bevent:"..plugin_info.name.." version " .. plugin_info.version .. " Started|t:info")

--os.getenv("HOME")

-- print ("Home = " .. os.getenv("HOME"))

file = io.open("local.env", "w")

foo_var = os.getenv("TSP_PLUGIN_PARAMS")
if (foo_var == nil) then
	foo_var = "NOT_SET"
end

file:write("Home : " .. os.getenv("HOME") .. "\n")
file:write("Plugin params : " .. foo_var .. "\n")
file:close()

--Dummy function to be called after every polling interval.
--
function dummy()
	--Do Nothing.
end

timer.setInterval(300000, dummy)
