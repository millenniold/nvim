require("config.options")
require("core.lazy")
require("core.lsp")
require("config.keymaps")
require("config.autocmds")
require("mykeymaps")

-- Turn off q: command history, so flippin annoying
vim.api.nvim_create_autocmd("CmdwinEnter", {
  callback = function()
    vim.cmd("q")  -- Quit the command-line window
    print("Command-line window disabled.")
  end
})

-- CREATE AN INFO SCREEN FOR MY CONFIG
function scott(leaveOpen)
  -- Create a scratch buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set the text content
  local lines = { 
    "",
    "  SCOTT's NEOVIM CONFIG" ,
    "  ",
    "  <leader>=space      - (normal)",
    "  <leader>e           - (normal)        File explorer",
    "  <leader>w           - (normal)        Toggle whitespace characters",
    "  <C-down>            - (normal/insert) Column select down",
    "  <C-up>              - (normal/insert) Column select down",
    "  <C-u>               - (insert)        Undo",
    "  <C-r>               - (insert)        Redo",
    "",
    "  LINTER",
    "",
    "  <leader>m           - (normal)        Toggle Linter inline messages ",
    "",
    "  PLUGINS",
    "",
    "  <leader>h           - (normal)        Spectre, search and replace",
    "  <leader>u           - (normal)        Toggle Undo/Redo Tree",
    "  <leader>f           - (normal)        Telescope find files dialog",
    "  <leader>t           - (normal)        Telescope live grep dialog",
    "  <leader>b           - (normal)        Telescope view current buffers  ",
    "  <leader>c           - (normal)        Telescope view colorschems",
    "",
    "  GIT",
    "",
    "  <leader>gc          - (normal)        Telescope Git see commits",
    "  <leader>gb          - (normal)        Telescope Git see branches",
    "  <leader>gs          - (normal)        Telescope Git see status",
    "  <leader>gl          - (normal)        View Git logs for file",
    "",
    "  HARPOON",
    "",
    "  <C-e>               - (normal)        Toggle Harpoon menu",
    "  <C-i>               - (normal)        Insert buffer into Harpoon",
    "  <leader>1           - (normal)        Select buffer1 ",
    "  <leader>2           - (normal)        Select buffer2 ",
    "  <leader>3           - (normal)        Select buffer3 ",
    "  <leader>4           - (normal)        Select buffer4 ",
    "",
    "  press Escape to close...",
    "",

  }
  
  -- Calculate content dimensions
  local desired_width = 0
  for _, line in ipairs(lines) do
    desired_width = math.max(desired_width, #line)
  end
  local desired_height = #lines

  -- Get editor dimensions
  local max_width = vim.o.columns
  local max_height = vim.o.lines

  -- Clamp dimensions
  local win_width = math.min(desired_width, max_width - 4)
  local win_height = math.min(desired_height, max_height - 4)

  -- Center the window
  local row = math.floor((max_height - win_height) / 2)
  local col = math.floor((max_width - win_width) / 2)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  -- Create the floating window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
    focusable = true,
  })

  -- Map <Esc> to close the window (normal mode)
  vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "", {
    noremap = true,
    silent = true,
    callback = function()
      vim.api.nvim_win_close(win, true)
    end,
  })

  -- Optional: also close on <Esc> in insert mode
  vim.api.nvim_buf_set_keymap(buf, "i", "<Esc>", "", {
    noremap = true,
    silent = true,
    callback = function()
      vim.api.nvim_win_close(win, true)
    end,
  })

  -- Give focus to the popup
  vim.api.nvim_set_current_win(win)

  -- Auto-close after 5 seconds
  if leaveOpen then

  else
    local timer = vim.loop.new_timer()
    timer:start(10000, 0, vim.schedule_wrap(function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      timer:stop()
      timer:close()
    end))
  end

end

vim.api.nvim_create_user_command("Scott", function()
  scott(true)
end, {})
