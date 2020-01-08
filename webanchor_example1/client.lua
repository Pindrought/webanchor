local wa = nil

function OnPackageStart()
    wa = ImportPackage('webanchor')
    gui1 = wa.GenerateWebUI("TOPLEFT", 200, 100, nil, "TOPLEFT", 20, 20)
    gui2 = wa.GenerateWebUI("TOPLEFT", 100, 100, gui1, "BOTTOMLEFT")
    gui3 = wa.GenerateWebUI("TOPLEFT", 100, 100, gui2, "TOPRIGHT")
    
    LoadWebFile(gui1.id, "http://asset/" .. GetPackageName() .. "/color.html") --color.html is an html that generates a random color for the body
    SetWebVisibility(gui1.id, WEB_VISIBLE)
    LoadWebFile(gui2.id, "http://asset/" .. GetPackageName() .. "/color.html")
    SetWebVisibility(gui2.id, WEB_VISIBLE) 
    LoadWebFile(gui3.id, "http://asset/" .. GetPackageName() .. "/color.html")
    SetWebVisibility(gui3.id, WEB_VISIBLE)
end
AddEvent("OnPackageStart", OnPackageStart)