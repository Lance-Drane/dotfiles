-- MIT License
--
-- Copyright (c) 2019 Wis
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

-- Original source is at https://github.com/wis/mpvSockets

-- mpvSockets, one socket per instance, removes socket on exit

local utils = require("mp.utils")

local function get_temp_path()
	local directory_seperator = package.config:match("([^\n]*)\n?")
	local example_temp_file_path = os.tmpname()

	-- remove generated temp file
	pcall(os.remove, example_temp_file_path)

	local seperator_idx = example_temp_file_path:reverse():find(directory_seperator)
	local temp_path_length = #example_temp_file_path - seperator_idx

	return example_temp_file_path:sub(1, temp_path_length)
end

tempDir = get_temp_path()

function join_paths(...)
	local arg = { ... }
	path = ""
	for i, v in ipairs(arg) do
		path = utils.join_path(path, tostring(v))
	end
	return path
end

ppid = utils.getpid()
os.execute("mkdir " .. join_paths(tempDir, "mpvSockets") .. " 2>/dev/null")
mp.set_property("options/input-ipc-server", join_paths(tempDir, "mpvSockets", ppid))

function shutdown_handler()
	os.remove(join_paths(tempDir, "mpvSockets", ppid))
end
mp.register_event("shutdown", shutdown_handler)
