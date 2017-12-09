local composer = require("composer")
local widget = require("widget")
local posto = require("controller.PacienteRestController")

display.setStatusBar(display.HiddenStatusBar)

local posto = posto:criar()


composer.gotoScene("scenes.Login")