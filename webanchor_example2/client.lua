local wa = nil

function OnPackageStart()
    wa = ImportPackage('webanchor')
    gui1 = wa.GenerateWebUI("CENTER", 400, 300)
    gui2 = wa.GenerateWebUI("BOTTOMLEFT", 400, 100, gui1, "TOPLEFT", 0, -10)
    gui3 = wa.GenerateWebUI("TOPRIGHT", 100, 300, gui1, "TOPLEFT")
    gui4 = wa.GenerateWebUI("TOPLEFT", 100, 300, gui1, "TOPRIGHT")
    gui5 = wa.GenerateWebUI("TOPLEFT", 400, 75, gui1, "BOTTOMLEFT")
    
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