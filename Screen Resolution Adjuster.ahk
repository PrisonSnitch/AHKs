#SingleInstance, Force

; AutoHotkey script to scale screen coordinates with a wider GUI

Gui, Add, Text,, Enter Original Screen Width:
Gui, Add, Edit, vOriginalWidth w250 ; Increased width of input fields
Gui, Add, Text,, Enter Original Screen Height:
Gui, Add, Edit, vOriginalHeight w250
Gui, Add, Text,, Enter Target Screen Width:
Gui, Add, Edit, vTargetWidth w250
Gui, Add, Text,, Enter Target Screen Height:
Gui, Add, Edit, vTargetHeight w250
Gui, Add, Text,, Enter X Coordinate (Original):
Gui, Add, Edit, vXCoord w250
Gui, Add, Text,, Enter Y Coordinate (Original):
Gui, Add, Edit, vYCoord w250
Gui, Add, Button, gCalculateCoordinates, Calculate

Gui, Show, w270 h315, Coordinate Scaler ; Adjusted window size
Return

; Calculate scaled coordinates based on resolution
CalculateCoordinates:
    ; Retrieve input values from GUI
    Gui, Submit, NoHide
    original_width := OriginalWidth
    original_height := OriginalHeight
    target_width := TargetWidth
    target_height := TargetHeight
    x_original := XCoord
    y_original := YCoord

    ; Calculate the new coordinates
    x_target := (x_original / original_width) * target_width
    y_target := (y_original / original_height) * target_height

; Show the old and new coordinates in a message box
MsgBox, Your old X Coordinate was %x_original%.`nYour new X Coordinate is: %x_target%.`nYour old Y Coordinatey was %y_original%.`nYour new Y Coordinatey is: %y_target%.
Return

GuiClose:
    ExitApp
