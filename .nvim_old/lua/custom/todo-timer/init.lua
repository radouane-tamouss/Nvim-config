-- ~/.config/nvim/lua/custom/todo-timer/init.lua

local M = {}
local timers = {}
local active_tasks = {}

function M.start_timer(minutes)
  local bufnr = vim.api.nvim_get_current_buf()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local line_content = vim.api.nvim_buf_get_lines(bufnr, current_line - 1, current_line, false)[1]

  -- Check if line is a todo item
  if not line_content:match("^%s*-%s*%[.%]") then
    vim.notify("Not a todo item!", vim.log.levels.WARN)
    return
  end -- Stop existing timer if there is one
  if active_tasks[current_line] then
    if timers[current_line] then
      timers[current_line]:stop()
      timers[current_line]:close()
    end
  end

  -- Create new timer
  local timer = vim.loop.new_timer()
  local seconds_remaining = minutes * 60
  timers[current_line] = timer
  active_tasks[current_line] = true

  -- Update time display
  local function update_display()
    if not active_tasks[current_line] then
      return
    end

    local mins = math.floor(seconds_remaining / 60)
    local secs = seconds_remaining % 60
    local time_text = string.format("(%02d:%02d)", mins, secs)

    -- Get current line content and update it
    local current_content = vim.api.nvim_buf_get_lines(bufnr, current_line - 1, current_line, false)[1]
    local new_content = current_content:gsub("%s*%([%d:]+%)%s*$", "") .. " " .. time_text

    vim.api.nvim_buf_set_lines(bufnr, current_line - 1, current_line, false, { new_content })
  end

  -- Timer callback
  timer:start(
    0,
    1000,
    vim.schedule_wrap(function()
      if seconds_remaining <= 0 then
        timer:stop()
        timer:close()
        active_tasks[current_line] = false
        -- Remove timer display
        local final_content = vim.api.nvim_buf_get_lines(bufnr, current_line - 1, current_line, false)[1]
        final_content = final_content:gsub("%s*%([%d:]+%)%s*$", "")
        vim.api.nvim_buf_set_lines(bufnr, current_line - 1, current_line, false, { final_content })
        -- Notify time's up
        vim.notify("Timer finished!", vim.log.levels.INFO)
        return
      end

      seconds_remaining = seconds_remaining - 1
      update_display()
    end)
  )

  -- Initial display update
  update_display()
end

function M.stop_timer()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  if timers[current_line] then
    timers[current_line]:stop()
    timers[current_line]:close()
    active_tasks[current_line] = false

    -- Remove timer display
    local bufnr = vim.api.nvim_get_current_buf()
    local content = vim.api.nvim_buf_get_lines(bufnr, current_line - 1, current_line, false)[1]
    content = content:gsub("%s*%([%d:]+%)%s*$", "")
    vim.api.nvim_buf_set_lines(bufnr, current_line - 1, current_line, false, { content })

    vim.notify("Timer stopped!", vim.log.levels.INFO)
  end
end

function M.setup()
  -- Commands
  vim.api.nvim_create_user_command("TodoTimer", function(opts)
    local minutes = tonumber(opts.args) or 25 -- Default 25 minutes
    M.start_timer(minutes)
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("TodoTimerStop", function()
    M.stop_timer()
  end, {})

  -- Keymaps
  vim.keymap.set("n", "<leader>tt", ":TodoTimer ", { desc = "Start todo timer" })
  vim.keymap.set("n", "<leader>ts", ":TodoTimerStop<CR>", { desc = "Stop todo timer" })
end

return M
