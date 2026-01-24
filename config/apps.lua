-- This is used later as the default terminal and editor to run.
local apps = {}
apps.terminal   = 'wezterm'
apps.editor     = os.getenv('nvim') or 'nvim'
apps.editor_cmd = apps.terminal .. ' -e ' .. apps.editor
apps.browser = "firefox"
apps.files = "nemo"
apps.launcher = "rofi -show drun"
-- Set the terminal for the menubar.
require('menubar').utils.terminal = apps.terminal

return apps
