require('nightfox').setup({
    options = {
        hide_nc_statusline = false,
        hide_end_of_buffer = false,
        styles = {
            functions = 'italic',
            comments = 'italic',
            keywords = 'bold',
            types = 'italic,bold',
        }
    }
})

-- Change colorscheme based on time of day
function set_colorscheme(current_time, colorscheme_day_time_tbl)
    local colorscheme = nil
    local last_colorscheme = nil
    local last_time_chunk = { start_hour = -1, start_min = -1 }
    for k, v in pairs(colorscheme_day_time_tbl) do
        -- find the colorscheme of the current time chunk
        if current_time.hour > v.start_hour or (current_time.hour == v.start_hour and current_time.min > v.start_min) then
            colorscheme = v.colorscheme
        end
        
        -- find the last time chunk
        if last_time_chunk.start_hour < v.start_hour or (last_time_chunk.start_hour == v.start_hour and last_time_chunk.start_min < v.start_min) then
            last_colorscheme = v.colorscheme
            last_time_chunk = v
        end
    end

    -- if colorscheme is nil, then it is the last time chunk of yesterday
    --
    -- @example day `start_time` = 6:00, night `start_time` = 18:00
    -- If `current_time` = 5:00, then it is still the night of yesterday. The `colorscheme` is `night`
    if colorscheme == nil then
        colorscheme = last_colorscheme
    end
    vim.cmd('colorscheme ' .. colorscheme)
end

-- set the colorscheme
local day_time = {
    day = {
        colorscheme = 'dayfox',
        start_hour = 6,
        start_min = 0,
    },
    dawn = {
        colorscheme = 'dawnfox',
        start_hour = 16,
        start_min = 0,
    },
    night = {
        colorscheme = 'nightfox',
        start_hour = 18,
        start_min = 0,
    }
}
local current_time = os.date("*t")
set_colorscheme(current_time, day_time)
