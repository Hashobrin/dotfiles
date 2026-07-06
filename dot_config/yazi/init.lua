function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%m/%d %H:%M", time)
	else
		time = os.date("%Y/%m/%d", time)
	end

	local size = self._file:size()
	if size == nil then
		size = "      "
	else
		size = ya.readable_size(size)
	end

	return string.format("%6s %s", size, time)
end
