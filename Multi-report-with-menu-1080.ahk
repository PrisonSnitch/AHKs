#SingleInstance, Force
SendMode, Input
#Persistent

; Define log file path
logFile := A_Temp "\Reportlogfile1080.txt"
flagFile := A_Temp "\Reportlogfile1080.txt"

; Initialize log file with script start time
FileAppend, %A_Now% - Script started.`n, %logFile%

; Define the script version
ScriptVersion := "2.0.0"

; Read saved Numpad4 and Numpad6 text from file
Numpad4TextFile := A_Temp "\Numpad4Text.txt"
Numpad6TextFile := A_Temp "\Numpad6Text.txt"

if (FileExist(Numpad4TextFile))
{
    FileRead, Numpad4Text, %Numpad4TextFile%
} else {
    Numpad4Text := "Nice Cheats!"
}

if (FileExist(Numpad6TextFile))
{
    FileRead, Numpad6Text, %Numpad6TextFile%
} else {
    Numpad6Text := "Reported!"
}

; Create a GUI window
Gui, Add, ListBox, vMyListBox w377 h155, Pressing Numpad0 will send report for "Cheating"
|Pressing Numpad1 will send report for "ALL"
|Pressing Numpad2 will send report for "Exploiting"
|Pressing Numpad3 will send report for "Text Chat-Spam"
|Pressing Numpad4 types "%Numpad4Text%" in chat
|Pressing Numpad5 will send report for "Text Chat-Offensive"
|Pressing Numpad6 types "%Numpad6Text%" in chat
|Pressing Numpad7 will send report for "Voice Chat-Offensive"
|Pressing Numpad8 will send report for "UserName-Offensive"
|Pressing Numpad9 will send report for "ClanTag-Offensive"
|Pressing Numpad+ will buy the first person back on list.

Gui, Add, Edit, vNumpad4Input w377 h25, %Numpad4Text%
Gui, Add, Edit, vNumpad6Input w377 h25, %Numpad6Text%

Gui, Add, Button, gSaveChanges x9 y220 w120 h35, Save Changes
Gui, Add, Button, gCloseGUI x268 y220 w120 h35, Close GUI
Gui, Add, Button, gCancelScript x138 y220 w120 h35, Cancel Script
Gui, Show, w400 h265, Report Actions

; Define Numpad hotkeys
Numpad0:: 
    FileAppend, %A_Now% - Numpad0 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 420  ; Reports for "Cheating"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad1:: 
    FileAppend, %A_Now% - Numpad1 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 420 ; Reports for "Cheating"
    Sleep, 300
    Click, 870, 480 ; Reports for "Exploiting"
    Sleep, 300
    Click, 870, 540 ; Reports for "Text Chat-Spam"
    Sleep, 300
    Click, 870, 600 ; Reports for "Text Chat-Offensive"
    Sleep, 300
    Click, 870, 660 ; Reports for "Voice chat-Offensive"
    Sleep, 300
    Click, 870, 722 ; Reports for "UserName-Offensive"
    Sleep, 300
    Click, 870, 785 ; Reports for "Clan Tag-Offensive"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad2:: 
    FileAppend, %A_Now% - Numpad2 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 480 ; Reports for "Exploiting"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad3:: 
    FileAppend, %A_Now% - Numpad3 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 530 ; Reports for "Text Chat-Spam"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad4:: 
    FileAppend, %A_Now% - Numpad4 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad4Text%
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad5:: 
    FileAppend, %A_Now% - Numpad5 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 606 ; Reports for "Text Chat-Spam"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad6:: 
    FileAppend, %A_Now% - Numpad6 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad6Text%
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad7:: 
    FileAppend, %A_Now% - Numpad7 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 660 ; Reports for "Voice Chat-Offensive"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad8:: 
    FileAppend, %A_Now% - Numpad8 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 722 ; Reports for "UserName-Offensive"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

Numpad9:: 
    FileAppend, %A_Now% - Numpad9 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 785 ; Reports for "ClanTag-Offensive"
    Sleep, 300
    Click, 963, 900 ; Clicks "Send report"
return

; Button actions for the GUI (Close and Cancel Script)
CloseGUI:
    Gui, Destroy
    ExitApp
return

CancelScript:
    ExitApp
return

SaveChanges:
    ; Save the edited text from the GUI
    Gui, Submit, NoHide

    ; Save to the text files
    FileAppend, %A_Now% - Numpad4 text saved: %Numpad4Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad6 text saved: %Numpad6Input%`n, %logFile%
    
    ; Save to the text files
    FileDelete, %Numpad4TextFile%
    FileDelete, %Numpad6TextFile%
    FileAppend, %Numpad4Input%, %Numpad4TextFile%
    FileAppend, %Numpad6Input%, %Numpad6TextFile%

    ; Create a custom Gui for the popup message
    Gui, +AlwaysOnTop
    Gui, Add, Text, w300 h50 Center, Changes have been saved!`nNumpad4Input: %Numpad4Input%`nNumpad6Input: %Numpad6Input%
    Gui, Show, w400 h265, Changes Saved

    ; Wait for 500ms before closing the Gui and reloading
    Sleep, 500

    ; Close the custom Gui
    Gui, Destroy

    ; Reload the script
    Reload

return

