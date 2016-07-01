

hour = {}
time= 0
osTime = 0
width = 150
function love.load()
	love.window.setMode(width, 120)
end

function love.update(dt)
	date = os.date("*t", os.time())

	hour = {0, 0, 0, 0, 0}
	for x = 1, date.hour do
		add(hour)
	end

	min = {0, 0, 0, 0, 0, 0, 0}
	for x = 1, date.min do
		add(min)
	end

	sec = {0, 0, 0, 0, 0, 0, 0}
	for x = 1, date.sec do
		add(sec)
	end

	day = {0, 0, 0, 0, 0}
	for x = 1, date.day do
		add(day)
	end

	month = {0, 0, 0, 0}
	for x = 1, date.month do
		add(month)
	end


end

function love.draw()
	for k, v in pairs(hour) do
		love.graphics.rectangle("line", width - k * 20, math.floor((k + 1)/40)*20 + 10, 15, 15)
		if v == 1 then
			love.graphics.rectangle("fill", width - k * 20, math.floor((k + 1)/40)*20 + 10, 15, 15)
		end
	end
	for k, v in pairs(min) do
		love.graphics.rectangle("line", width - k * 20, math.floor((k + 1)/40)*20 + 30, 15, 15)
		if v == 1 then
			love.graphics.rectangle("fill", width - k * 20, math.floor((k + 1)/40)*20 + 30, 15, 15)
		end
	end
	for k, v in pairs(sec) do
		love.graphics.rectangle("line", width - k * 20, math.floor((k + 1)/40)*20 + 50, 15, 15)
		if v == 1 then
			love.graphics.rectangle("fill", width - k * 20, math.floor((k + 1)/40)*20 + 50, 15, 15)
		end
	end
	for k, v in pairs(day) do
		love.graphics.rectangle("line", width - k * 20, math.floor((k + 1)/40)*20 + 80, 15, 15)
		if v == 1 then
			love.graphics.rectangle("fill", width - k * 20, math.floor((k + 1)/40)*20 + 80, 15, 15)
		end
	end
	for k, v in pairs(month) do
		love.graphics.rectangle("line", width - k * 20, math.floor((k + 1)/40)*20 + 100, 15, 15)
		if v == 1 then
			love.graphics.rectangle("fill", width - k * 20, math.floor((k + 1)/40)*20 + 100, 15, 15)
		end
	end
end

function love.keypressed(key)

	if key == "a" then
		table.insert(bits, 0)
	end

	if key == "1" then
		add(hour)
	end

end

function add(t)
	carry = 1
	for k, v in pairs(t) do
		if carry > 0 then
			if v == 0 then
				t[k] = 1
				carry = carry - 1
			else
				t[k] = 0
			end
		end
	end
	while carry > 0 do
		table.insert(t, 1)
		carry = carry - 1
	end
end
