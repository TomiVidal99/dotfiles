-- Better file navigation, more info: https://github.com/ThePrimeagen/harpoon/tree/harpoon2#-Installation
local status, harpoon = pcall(require, "harpoon")
if not(status) then
  print "ERROR: plugin harpoon could not be found. At harpoon.lua"
end

harpoon:setup()

vim.keymap.set("n", "<localleader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<localleader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<localleader>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<localleader>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<localleader>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<localleader>r", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<localleader>t", function() harpoon:list():select(5) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<localleader>s", function() harpoon:list():prev() end)
vim.keymap.set("n", "<localleader>d", function() harpoon:list():next() end)
