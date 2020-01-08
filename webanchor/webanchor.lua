-- function OnScriptError(message) --Standard copy&paste code from onset lua script examples for printing out lua errors
--     AddPlayerChat('<span color="#ff0000bb" style="bold" size="10">'..message..'</>')
-- end
-- AddEvent("OnScriptError", OnScriptError)

function PinLog(...) --Logging function that allows for multiple arguments
    local msgs = {...}
    for i = 1, #msgs do
        AddPlayerChat('<span color="#DD3333" style="bold" size="12">[Webanchor]</> - ' .. msgs[i])
    end
end

function GenerateWebUI(childAnchorPoint, width, height, parent, parentAnchorPoint, xOffset, yOffset)
    if (not width) then
        PinLog("Width cannot be nil.")
        return nil
    end

    if (not height) then
        PinLog("Height cannot be nil.")
        return nil
    end

    if (childAnchorPoint ~= "TOPLEFT" and
        childAnchorPoint ~= "TOPRIGHT" and
        childAnchorPoint ~= "BOTTOMLEFT" and
        childAnchorPoint ~= "BOTTOMRIGHT" and
        childAnchorPoint ~= "CENTER") then
            PinLog("No valid child anchor point entered.", "Anchor: " .. childAnchorPoint)
            return nil
    end

    if (not parentAnchorPoint) then
        parentAnchorPoint = childAnchorPoint
    end

    if (parentAnchorPoint ~= "TOPLEFT" and
        parentAnchorPoint ~= "TOPRIGHT" and
        parentAnchorPoint ~= "BOTTOMLEFT" and
        parentAnchorPoint ~= "BOTTOMRIGHT" and
        parentAnchorPoint ~= "CENTER") then
            PinLog("No valid parent anchor point entered.", "Anchor: " .. parentAnchorPoint)
            return nil
    end

    if (not xOffset) then
        xOffset = 0
    end

    if (not yOffset) then
        yOffset = 0
    end

    local ui = {}
    ui.id = CreateWebUI(0, 0, 0, 0)
    ui.width = width;
    ui.height = height;
    ui.childAnchorPoint = childAnchorPoint
    ui.parentAnchorPoint = parentAnchorPoint
    ui.parent = parent
    ui.xOffset = xOffset
    ui.yOffset = yOffset

    local screenWidth, screenHeight = GetScreenSize()
    local parentAnchorX = 0
    local parentAnchorY = 0
    if (parent == nil) then --nil parent = screen is parent
        if (parentAnchorPoint == "TOPLEFT") then
            parentAnchorX = 0
            parentAnchorY = 0
        elseif (parentAnchorPoint == "TOPRIGHT") then
            parentAnchorX = screenWidth
            parentAnchorY = 0
        elseif (parentAnchorPoint == "BOTTOMLEFT") then
            parentAnchorX = 0
            parentAnchorY = screenHeight
        elseif (parentAnchorPoint == "BOTTOMRIGHT") then
            parentAnchorX = screenWidth
            parentAnchorY = screenHeight
        elseif (parentAnchorPoint == "CENTER") then
            parentAnchorX = screenWidth / 2
            parentAnchorY = screenHeight / 2
        end 
    else --If web ui has an actual parent
        if (parentAnchorPoint == "TOPLEFT") then
            parentAnchorX = parent.minX
            parentAnchorY = parent.minY
        elseif (parentAnchorPoint == "TOPRIGHT") then
            parentAnchorX = parent.maxX
            parentAnchorY = parent.minY
        elseif (parentAnchorPoint == "BOTTOMLEFT") then
            parentAnchorX = parent.minX
            parentAnchorY = parent.maxY
        elseif (parentAnchorPoint == "BOTTOMRIGHT") then
            parentAnchorX = parent.maxX
            parentAnchorY = parent.maxY
        elseif (parentAnchorPoint == "CENTER") then
            parentAnchorX = (parent.minX + parent.width) / 2
            parentAnchorY = (parent.minY + parent.height) / 2
        end
    end

    local minX = parentAnchorX
    local minY = parentAnchorY
    if (childAnchorPoint == "TOPLEFT") then
    elseif (childAnchorPoint == "TOPRIGHT") then
        minX = minX - width
    elseif (childAnchorPoint == "BOTTOMLEFT") then
        minY = minY - height
    elseif (childAnchorPoint == "BOTTOMRIGHT") then
        minX = minX - width
        minY = minY - height
    elseif (childAnchorPoint == "CENTER") then
        minX = minX - width / 2
        minY = minY - height / 2
    end 

    minX = minX + xOffset
    minY = minY + yOffset
    local maxX = minX + width
    local maxY = minY + height

    ui.minX = minX
    ui.minY = minY
    ui.maxX = maxX
    ui.maxY = maxY

    --Convert from pixel coords to screen space coords
    minX = minX / screenWidth
    maxX = maxX / screenWidth
    minY = minY / screenHeight
    maxY = maxY / screenHeight

	SetWebAlignment(ui.id, 0, 0)
	SetWebAnchors(ui.id, minX, minY, maxX, maxY) 
    SetWebVisibility(ui.id, WEB_HIDDEN)
    return ui
end
AddFunctionExport('GenerateWebUI', GenerateWebUI)

