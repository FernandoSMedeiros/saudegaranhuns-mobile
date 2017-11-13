local widget = require("widget")
local native = require("native")

user = {nome, sus, endereco = {logradouro, numero, bairro}, login, senha}

function definirAnchorXeY (tabela)
  tabela.anchorX = 0
  tabela.anchorY = 0
end

function nomeListener (event)
  if event.phase == "editing" then
    user.nome = event.text
  end
end

function susListerner (event)
  if event.phase == "editing" then
    user.sus = event.text
  end
end

function logradouroListener(event)
  if event.phase == "editing"  then
    user.endereco.logradouro = event.text
  end
end

function numeroListener(event)
  if event.phase == "editing"  then
    user.endereco.numero = event.text
  end
end

function bairroListener(event)
  if event.phase == "editing"  then
    user.endereco.bairro = event.text
  end
end

function  loginListener(event)
  if event.phase == "editing" then
    user.login = event.text
  end
end

function senhaListener(event)
  if event.phase == "editing" then
    user.senha = event.text
  end
end

local function scrollListener( event )
    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end
    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
        local direction = event.direction
        if ( direction == "up" ) then print( "Reached bottom limit" )
        elseif ( direction == "down" ) then print( "Reached top limit" )
        elseif ( direction == "left" ) then print( "Reached right limit" )
        elseif ( direction == "right" ) then print( "Reached left limit" )
        end
    end
    return true
end

local scrollView = widget.newScrollView({
  x = 0,
  y = 0,
  width = display.contentWidth,
  height = display.contentHeight,
  horizontalScrollDisabled = true,
  scrollHeight = 0,
  backgroundColor = { 0.8, 0.8, 0.8 },
  listener = scrollListener
})
definirAnchorXeY(scrollView)

local cor = {0.26, 0.55, 0.79}
local alturaDaTela = display.contentHeight
local larguraDaTela = display.contentWidth

local retanguloMenu = display.newRect( 0, 0, larguraDaTela, 42 )
definirAnchorXeY(retanguloMenu)
retanguloMenu:setFillColor(unpack(cor))
scrollView:insert(retanguloMenu)

local textoMenu = display.newText({
  text = "Cadastro de usuario",
  width = 171,
  height = 18,
  x = 68,
  y = 13,
  fontSize = 14
})
definirAnchorXeY(textoMenu)
scrollView:insert(textoMenu)

local retanguloNome = display.newRect(34, 70, 187, 25)
definirAnchorXeY(retanguloNome)
retanguloNome:setFillColor(unpack(cor))
scrollView:insert(retanguloNome)

local textoNome = display.newText({
  text = "Nome",
  width = 78,
  height = 19,
  x = 46,
  y = 75,
  fontSize = 14
})
definirAnchorXeY(textoNome)
scrollView:insert(textoNome)

local inputNome = native.newTextField(34, 100, 252, 25)
definirAnchorXeY(inputNome)
scrollView:insert(inputNome)

local retanguloSUS = display.newRect(34, 135, 187, 25)
definirAnchorXeY(retanguloSUS)
retanguloSUS:setFillColor(unpack(cor))
scrollView:insert(retanguloSUS)

local textoSUS = display.newText({
  text = "Número do cartão do SUS",
  width = 174,
  height = 19,
  x = 42,
  y = 140,
  fontSize = 14
})
definirAnchorXeY(textoSUS)
scrollView:insert(textoSUS)

local inputSUS = native.newTextField(34, 165, 252, 25)
definirAnchorXeY(inputSUS)
scrollView:insert(inputSUS)

local retanguloEndereco = display.newRect(34, 200, 187, 25)
definirAnchorXeY(retanguloEndereco)
retanguloEndereco:setFillColor(unpack(cor))
scrollView:insert(retanguloEndereco)

local textoEndereco = display.newText({
  text = "Endereço",
  width = 78,
  height = 19,
  x = 46,
  y = 205,
  fontSize = 14
})
definirAnchorXeY(textoEndereco)
scrollView:insert(textoEndereco)

local inputLogradouro = native.newTextField(34, 230, 252, 25)
definirAnchorXeY(inputLogradouro)
inputLogradouro.placeholder = "Logradouro"
scrollView:insert(inputLogradouro)

local inputNumero = native.newTextField(34, 260, 252, 25)
definirAnchorXeY(inputNumero)
inputNumero.placeholder = "Número"
scrollView:insert(inputNumero)

local inputBairro = native.newTextField(34, 290, 252, 25)
definirAnchorXeY(inputBairro)
inputBairro.placeholder = "Bairro"
scrollView:insert(inputBairro)

local retanguloNascimento = display.newRect(34,325,187,25)
definirAnchorXeY(retanguloNascimento)
retanguloNascimento:setFillColor(unpack(cor))
scrollView:insert(retanguloNascimento)

local textoNascimento = display.newText({
  text = "Data de nascimento",
  x = 46,
  y = 328,
  width = 145,
  height = 19
})
definirAnchorXeY(textoNascimento)
scrollView:insert(textoNascimento)

local inputNascimento = native.newTextField(34, 355, 252, 25)
definirAnchorXeY(inputNascimento)
inputNascimento.placeholder = "DD/MM/YYYY"
scrollView:insert(inputNascimento)

local retanguloLogin = display.newRect(34,390,187,25)
definirAnchorXeY(retanguloLogin)
retanguloLogin:setFillColor(unpack(cor))
scrollView:insert(retanguloLogin)

local textoLogin = display.newText({
  text = "Login",
  x = 42,
  y = 393,
  width = 145,
  height = 19
})
definirAnchorXeY(textoLogin)
scrollView:insert(textoLogin)

local inputLogin = native.newTextField(34, 420, 252, 25)
definirAnchorXeY(inputLogin)
scrollView:insert(inputLogin)

local retanguloSenha = display.newRect(34,455,187,25)
definirAnchorXeY(retanguloSenha)
retanguloSenha:setFillColor(unpack(cor))
scrollView:insert(retanguloSenha)

local textoSenha = display.newText({
  text = "Senha",
  x = 42,
  y = 458,
  width = 145,
  height = 19
})
definirAnchorXeY(textoSenha)
scrollView:insert(textoSenha)

local inputSenha = native.newTextField(34, 485, 252, 25)
definirAnchorXeY(inputSenha)
inputSenha.isSecure = true
scrollView:insert(inputSenha)

local retanguloConfirmeSenha = display.newRect(34,520,187,25)
definirAnchorXeY(retanguloConfirmeSenha)
retanguloConfirmeSenha:setFillColor(unpack(cor))
scrollView:insert(retanguloConfirmeSenha)

local textoConfirmeSenha = display.newText({
  text = "Confirme a senha",
  x = 42,
  y = 523,
  width = 145,
  height = 19
})
definirAnchorXeY(textoConfirmeSenha)
scrollView:insert(textoConfirmeSenha)

local inputConfirmeSenha = native.newTextField(34, 550, 252, 25)
definirAnchorXeY(inputConfirmeSenha)
inputConfirmeSenha.isSecure = true
scrollView:insert(inputConfirmeSenha)

local botaoCadastrar = widget.newButton({
  label = "Cadastrar",
  x = display.contentCenterX,
  y = 605,
  width = 110,
  height = 25,
  labelColor = {default = {0,0,0}, over = {0.1,0.1,0.1}},
  fillColor = {default = {1,1,1}, over = {0.9,0.9,0.9}},
  strokeColor = {default = {0.26, 0.55, 0.79}, over = {0.26, 0.55, 0.79}},
  strokeWidth = 4,
  shape = "roundedRect",
  cornerRadius = 8,
  font = native.systemFontBold
})
scrollView:insert(botaoCadastrar)
