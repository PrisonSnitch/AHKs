#SingleInstance, Force

; AutoHotkey script to scale screen coordinates with resolution options

; Predefined resolutions (use a pipe `|` to separate items for AHK v1)
resolutionList = 1920x1080|2560x1440|3840x2160|1280x720|1366x768|1600x900|1024x768|1440x900|1920x1200|1280x800

; Add GUI components
Gui, Add, Text,, Select Original Screen Resolution:
Gui, Add, DropDownList, vOriginalResolution w250, %resolutionList%

Gui, Add, Text,, Select Target Screen Resolution:
Gui, Add, DropDownList, vTargetResolution w250, %resolutionList%

Gui, Add, Text,, Enter X Coordinate (Original):
Gui, Add, Edit, vXCoord w250

Gui, Add, Text,, Enter Y Coordinate (Original):
Gui, Add, Edit, vYCoord w250

Gui, Add, Button, gCalculateCoordinates, Calculate

; Show GUI
Gui, Show, w270 h220, Coordinate Scaler
Return

; Function to calculate scaled coordinates
CalculateCoordinates:
    Gui, Submit, NoHide
    ; Parse resolutions
    StringSplit, OriginalParts, OriginalResolution, x
    StringSplit, TargetParts, TargetResolution, x

    original_width := OriginalParts1
    original_height := OriginalParts2
    target_width := TargetParts1
    target_height := TargetParts2

    ; Input coordinates
    x_original := XCoord
    y_original := YCoord

    ; Calculate new coordinates
    x_target := (x_original / original_width) * target_width
    y_target := (y_original / original_height) * target_height

    ; Display the results
    MsgBox, Your old X Coordinate was %x_original%.`nYour new X Coordinate is: %x_target%.`n`nYour old Y Coordinate was %y_original%.`n
