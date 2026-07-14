local label = "?"
local querying = false

local function updateLabel(name)
	name = noctalia.string.trim(name or "")

	noctalia.log("fcitx5 im: " .. name)

	if name == "mozc" then
		label = "あ"
	elseif name:sub(1, 9) == "keyboard-" then
		label = "A"
	elseif name == "" then
		label = "?"
	else
		label = name
	end
end

local function render()
	barWidget.render(ui.label({
		text = label,
		fontWeight = "bold",
		color = "on_surface",
		textAlign = "center",
	}))
end

local function query()
	if querying then
		return
	end

	querying = true

	local started = noctalia.runAsync("fcitx5-remote -n", function(result)
		querying = false

		if result.exitCode == 0 then
			updateLabel(result.stdout)
		else
			updateLabel("")
		end

		render()
	end)

	if not started then
		querying = false
		updateLabel("")
		render()
	end
end

noctalia.setUpdateInterval(250)

render()
query()

function update()
	query()
end
