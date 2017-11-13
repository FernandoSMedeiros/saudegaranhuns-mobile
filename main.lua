local composer = require("composer")
local widget = require("widget")

display.setStatusBar(display.HiddenStatusBar)

composer.gotoScene("DetalhesConsulta")


local function button()
	composer.removeScene("DetalhesConsulta")
	composer.gotoScene("CadastroConsulta")
end

widget.newButton({
	label = "buytton",
	onPress = button,
	left = 50,
	top = display.contentHeight
})



--[[
local widget = require( "widget" )
 
-- Handle press events for the buttons
local function onSwitchPress( event )
    local switch = event.target
    print( "Switch with ID '"..switch.id.."' is on: "..tostring(switch.isOn) )
end
 
-- Create a group for the radio button set
local radioGroup = display.newGroup()
 
-- Create two associated radio buttons (inserted into the same display group)
local radioButton1 = widget.newSwitch(
    {
        left = 150,
        top = 200,
        style = "radio",
        id = "RadioButton1",
        initialSwitchState = true,
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton1 )
 
local radioButton2 = widget.newSwitch(
    {
        left = 250,
        top = 200,
        style = "radio",
        id = "RadioButton2",
        onPress = onSwitchPress
    }
)
radioGroup:insert( radioButton2 )]]

--[[local function onRowRender( event )
 
    -- Get reference to the row group
    local row = event.row
 
    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth
 
    local rowTitle = display.newText( row, "Consulta " .. row.index, 0, 0, nil, 14 )
    rowTitle:setFillColor( 0 )
 
    -- Align the label left and vertically centered
    rowTitle.anchorX = 0
    rowTitle.x = 0
    rowTitle.y = rowHeight * 0.5
end

local function onRowTouch( event )
    for i,v in pairs(event.row) do
        print(i,v)
    end
end

local widget = require( "widget" )
 
-- The "onRowRender" function may go here (see example under "Inserting Rows", above)
 
-- Create the widget
local tableView = widget.newTableView(
    {
        left = 0,
        top = 0,
        height = 330,
        width = 300,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = scrollListener
    }
)
 
-- Insert 40 rows
for i = 1, 40 do
    -- Insert a row into the tableView
    tableView:insertRow{}
end]]