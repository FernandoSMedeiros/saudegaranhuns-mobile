local composer = require("composer")
local widget = require("widget")

display.setStatusBar(display.HiddenStatusBar)

composer.gotoScene("SolicitarConsulta")


-- local function button()
-- 	composer.removeScene("DetalhesConsulta")
-- 	composer.gotoScene("CadastroConsulta")
-- end

-- widget.newButton({
-- 	label = "buytton",
-- 	onPress = button,
-- 	left = 50,
-- 	top = display.contentHeight
-- })

-- put navbar on bottom. this is to stay on top of other widgets.
-- supported widget types are : "RRectButton", "RectButton", "IconButton", "Slider", "TextField"