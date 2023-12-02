function string:split(sep)
    local splits = {}

    if sep == nil then
        table.insert(splits, self)
    elseif sep == "" then
        local len = #self
        for i = 1, len do
            table.insert(splits, self:sub(i, i))
        end
    else
        local pattern = "[^" .. sep .. "]+"
        for str in string.gmatch(self, pattern) do
            table.insert(splits, str)
        end
    end

    return splits
end
