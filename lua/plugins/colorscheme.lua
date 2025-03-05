-- Change colorscheme based on time of day
-- function set_colorscheme(current_time, colorscheme_time_chunks)
--
--     -- sort the time chunks by start time
--     table.sort(colorscheme_time_chunks, function(a, b)
--         return a.start_hour > b.start_hour or (a.start_hour == b.start_hour and a.start_min > b.start_min)
--     end)
--
--     -- find the current colorscheme
--     local colorscheme = colorscheme_time_chunks[1].colorscheme
--     for _, tc in ipairs(colorscheme_time_chunks) do
--         if current_time.hour > tc.start_hour or (current_time.hour == tc.start_hour and current_time.min > tc.start_min) then
--             colorscheme = tc.colorscheme
--             break
--         end
--     end
--
--     vim.cmd('colorscheme ' .. colorscheme)
-- end
--
-- -- set the colorscheme
-- local day_time = {
--     {
--         colorscheme = 'dayfox',
--         start_hour = 6,
--         start_min = 0,
--     },
--     {
--         colorscheme = 'dawnfox',
--         start_hour = 16,
--         start_min = 0,
--     },
--     {
--         colorscheme = 'nightfox',
--         start_hour = 18,
--         start_min = 0,
--     }
-- }
--
-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter", "CursorHold"}, {
--     callback = function()
--         local current_time = os.date("*t")
--         set_colorscheme(current_time, day_time)
--     end
-- })

return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      hide_nc_statusline = false,
      hide_end_of_buffer = false,
      styles = {
          functions = 'italic',
          comments = 'italic',
          keywords = 'bold',
          types = 'italic,bold',
      }
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dayfox"
    }
  }
}
