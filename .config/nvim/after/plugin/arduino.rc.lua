-- Setup vim-arduino, more: https://github.com/stevearc/vim-arduino

local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true} -- TODO: add more opts

function normal(key, command)
  keymap("n", key, command, opts)
end

-- TODO: check if the file it's of type .ino
-- and only run these keymaps if so.

-- Maps
normal("<leader>aa", "<cmd>ArduinoAttach<CR>")
normal("<leader>am", "<cmd>ArduinoVerify<CR>")
normal("<leader>au", "<cmd>ArduinoUpload<CR>")
normal("<leader>ad", "<cmd>ArduinoUploadAndSerial<CR>")
normal("<leader>ab", "<cmd>ArduinoChooseBoard<CR>")
normal("<leader>ap", "<cmd>ArduinoChooseProgrammer<CR>")

-- TODO: Setup arduino board status line
-- my_file.ino [arduino:avr:uno] [arduino:usbtinyisp] (/dev/ttyACM0:9600)
--  function! ArduinoStatusLine()
--    let port = arduino#GetPort()
--    let line = '[' . g:arduino_board . '] [' . g:arduino_programmer . ']'
--    if !empty(port)
--      let line = line . ' (' . port . ':' . g:arduino_serial_baud . ')'
--    endif
--    return line
--  endfunction
--  augroup ArduinoStatusLine
--    autocmd! * <buffer>
--    autocmd BufWinEnter <buffer> setlocal stl=%f\ %h%w%m%r\ %{ArduinoStatusLine()}\ %=\ %(%l,%c%V\ %=\ %P%)
--  augroup END
--
--  Other way - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
--
--  local function arduino_status()
--    local ft = vim.api.nvim_buf_get_option(0, "ft")
--    if ft ~= "arduino" then
--      return ""
--    end
--    local port = vim.fn["arduino#GetPort"]()
--    local line = string.format("[%s]", vim.g.arduino_board)
--    if vim.g.arduino_programmer ~= "" then
--      line = line .. string.format(" [%s]", vim.g.arduino_programmer)
--    end
--    if port ~= 0 then
--      line = line .. string.format(" (%s:%s)", port, vim.g.arduino_serial_baud)
--    end
--    return line
--  end
