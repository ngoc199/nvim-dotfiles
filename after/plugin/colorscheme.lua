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
    local time_chunks = {}
    for _, v in pairs(colorscheme_day_time_tbl) do
        table.insert(time_chunks, v)
    end

    -- sort the time chunks by start time
    table.sort(time_chunks, function(a, b)
        return a.start_hour < b.start_hour or (a.start_hour == b.start_hour and a.start_min < b.start_min)
    end)
    for _, tc in ipairs(time_chunks) do
        if current_time.hour > tc.start_hour or (current_time.hour == tc.start_hour and current_time.min > tc.start_min) then
            colorscheme = tc.colorscheme
        end
    end

    -- if colorscheme is nil, then it is the last time chunk of yesterday
    --
    -- @example day `start_time` = 6:00, night `start_time` = 18:00
    -- If `current_time` = 5:00, then it is still the night of yesterday. The `colorscheme` is `night`
    if colorscheme == nil then
        local last_time_chunk = time_chunks[#time_chunks]
        colorscheme = last_time_chunk.colorscheme
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
