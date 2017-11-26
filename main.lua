local composer = require("composer")
local widget = require("widget")

display.setStatusBar(display.HiddenStatusBar)

local user = require("model.Usuario")

usuario = user:criar(0)
usuario.nome = "Fernando"
--usuario.cartao = 50
print(usuario.cartao --[[.. "  " .. usuario.cartao--]])

composer.gotoScene("scenes.Login")