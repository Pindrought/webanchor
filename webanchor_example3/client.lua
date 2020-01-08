local wa = nil

function OnPackageStart()
    wa = ImportPackage('webanchor')
    local screenWidth, screenHeight = GetScreenSize()
    gui1 = wa.GenerateWebUI("TOPLEFT", 264, 264)
    gui2 = wa.GenerateWebUI("BOTTOMLEFT", 264, 264)
    gui3 = wa.GenerateWebUI("TOPRIGHT", 264, 264)
    gui4 = wa.GenerateWebUI("BOTTOMRIGHT", 264, 264)
    gui5 = wa.GenerateWebUI("TOPLEFT", screenWidth, 75, gui1, "BOTTOMLEFT", 0, 10)
    
    LoadWebFile(gui1.id, "http://asset/" .. GetPackageName() .. "/color.html") --color.html is an html that generates a random color for the body
    SetWebVisibility(gui1.id, WEB_VISIBLE)
    LoadWebFile(gui2.id, "http://asset/" .. GetPackageName() .. "/color.html")
    SetWebVisibility(gui2.id, WEB_VISIBLE) 
    LoadWebFile(gui3.id, "http://asset/" .. GetPackageName() .. "/color.html")
    SetWebVisibility(gui3.id, WEB_VISIBLE)
    LoadWebFile(gui4.id, "http://asset/" .. GetPackageName() .. "/color.html")
    SetWebVisibility(gui4.id, WEB_VISIBLE)
    LoadWebFile(gui5.id, "http://asset/" .. GetPackageName() .. "/color.html")
    SetWebVisibility(gui5.id, WEB_VISIBLE)
end
AddEvent("OnPackageStart", OnPackageStart)