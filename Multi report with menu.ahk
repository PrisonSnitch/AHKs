#SingleInstance, Force
SendMode, Input  ; Recommended for faster and more reliable input

; Define log file path
logFile := "C:\Reportlogfile.txt"
flagFile := "C:\Reportflagfile.txt"

; Check if the log file exists, if not, initialize it
if !FileExist(logFile) {
    FileAppend, %A_Now% - Log file created.`n, %logFile%
}

; Initialize log file with script start time
FileAppend, %A_Now% - Script started.`n, %logFile%

; Check if the flag file exists
if !FileExist(flagFile) {
    ; Show the initial message box
    MsgBox, 4,, You can leave the "Next window" open but if you close it, you can press the "ESC" key to close the script. Do you want to continue?
    IfMsgBox, No
        ExitApp

    ; Create the flag file to indicate the script has run
    FileAppend,, %flagFile%
}

; Create a GUI window
Gui, Add, ListBox, vMyListBox w310 h145, Pressing Numpad0 will send report for "ALL"|Pressing Numpad1 will send report for "Cheating"|Pressing Numpad2 will send report for "Exploiting"|Pressing Numpad3 will send report for "Text Chat-Spam"|Pressing Numpad4 types "Nice Cheats!" in chat|Pressing Numpad5 will send report for "Text Chat-Offensive"|Pressing Numpad6 types "Where did you get them?" in chat|Pressing Numpad7 will send report for "Voice Chat-Offensive"|Pressing Numpad8 will send report for "UserName-Offensive"|Pressing Numpad9 will send report for "ClanTag-Offensive"
Gui, Add, Button, gCloseGUI x10 y145 w120 h30, Close GUI
Gui, Add, Button, gCancelScript x200 y145 w120 h30, Cancel Script
Gui, Show, w330 h185, Report Actions

; Define Numpad hotkeys
Numpad0::
    FileAppend, %A_Now% - Numpad0 pressed.`n, %logFile%
    SendInput, x
    Sleep, 154
    Click, 848, 384
    Sleep, 128
    Click, 848, 460
    Sleep, 124
    Click, 848, 530
    Sleep, 123
    Click, 848, 606
    Sleep, 129
    Click, 848, 680
    Sleep, 123
    Click, 848, 753
    Sleep, 125
    Click, 848, 825
    Sleep, 99
    Click, 848, 460
    SendInput, {Enter}
return

Numpad1::
    FileAppend, %A_Now% - Numpad1 pressed.`n, %logFile%
    SendInput, x
    Sleep, 155
    Click, 848, 384
    Sleep, 199
    Click, 940, 923
    SendInput, {Enter}
return

Numpad2::
    FileAppend, %A_Now% - Numpad2 pressed.`n, %logFile%
    SendInput, x
    Sleep, 153
    Click, 848, 460
    Sleep, 199
    Click, 940, 923
    SendInput, {Enter}
return

Numpad3::
    FileAppend, %A_Now% - Numpad3 pressed.`n, %logFile%
    SendInput, x
    Sleep, 154
    Click, 848, 530
    Sleep, 199
    Click, 940, 923
    SendInput, {Enter}
return

Numpad4::
    FileAppend, %A_Now% - Numpad4 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 151
    SendInput, Nice Cheats!
    SendInput, {Enter}
return

Numpad5::
    FileAppend, %A_Now% - Numpad5 pressed.`n, %logFile%
    SendInput, x
    Sleep, 154
    Click, 848, 606
    Sleep, 199
    Click, 940, 923
    SendInput, {Enter}
return

Numpad6::
    FileAppend, %A_Now% - Numpad6 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 156
    SendInput, Where did you get them?
    SendInput, {Enter}
return

Numpad7::
    FileAppend, %A_Now% - Numpad7 pressed.`n, %logFile%
    SendInput, x
    Sleep, 157
    Click, 848, 680
    Sleep, 99
    Click, 940, 923
    SendInput, {Enter}
return

Numpad8::
    FileAppend, %A_Now% - Numpad8 pressed.`n, %logFile%
    SendInput, x
    Sleep, 152
    Click, 848, 753
    Sleep, 199
    Click, 940, 923
    SendInput, {Enter}
return

Numpad9::
    FileAppend, %A_Now% - Numpad9 pressed.`n, %logFile%
    SendInput, x
    Sleep, 150
    Click, 848, 825
    Sleep, 199
    Click, 940, 923
    SendInput, {Enter}
return

; Define hotkey to open the log file
^l:: ; Ctrl + L to open the log file
    Run, %logFile%
return

; Define the action to close the GUI without exiting the script
CloseGUI:
    FileAppend, %A_Now% - GUI closed.`n, %logFile%
    Gui, Hide  ; Hide the GUI window
return

; Define the action to exit the script
CancelScript:
    FileAppend, %A_Now% - Script cancelled by user.`n, %logFile%
    ExitApp  ; Exit the entire script
return

; Exit the script with the Ctrl + Escape key
~^Esc::
    FileAppend, %A_Now% - Script exited with Ctrl + ESC key.`n, %logFile%
    ExitApp
return

; Ensure the script keeps running to handle hotkeys
#Persistent

; This part ensures that the script remains active even after running the GUI code
GuiClose:
    Gui, Hide
    return
