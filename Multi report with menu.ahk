#SingleInstance, Force
SendMode, Input  ; Recommended for faster and more reliable input
#Persistent

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

; Define the script version
ScriptVersion := "1.0.1"

; Display the current script version
;MsgBox, This is script version %ScriptVersion%.

; Define the URL where the latest version is hosted
VersionUrl := "https://github.com/PrisonSnitch/AHKs/blob/main/version.txt"

; Path to temporarily download the version file
TempVersionFile := A_Temp "\latest_version.txt"

; Download the latest version number from the web
URLDownloadToFile, %VersionUrl%, %TempVersionFile%

; Read the version number from the downloaded file
FileRead, LatestVersion, %TempVersionFile%

; Trim any extra whitespace from the downloaded version
LatestVersion := Trim(LatestVersion)

; Function to compare versions
IsVersionGreaterOrEqual(Version1, Version2) {
    Loop, Parse, Version1, .
        Part1%A_Index% := A_LoopField
    Loop, Parse, Version2, .
        Part2%A_Index% := A_LoopField
    
    Loop, 3
    {
        if (Part1%A_Index% > Part2%A_Index%)
            return true
        if (Part1%A_Index% < Part2%A_Index%)
            return false
    }
    return true ; Versions are equal
}

; Check if the current script version meets the online version
if !IsVersionGreaterOrEqual(ScriptVersion, LatestVersion) {
    MsgBox, Error: A newer version (%LatestVersion%) of this script is available. You are using version %ScriptVersion%.
    ExitApp
} else {
;    MsgBox, You are using the latest script version %ScriptVersion%.
}

; Create a GUI window
Gui, Add, ListBox, vMyListBox w310 h155, Pressing Numpad0 will send report for "Cheating"|Pressing Numpad1 will send report for "ALL"|Pressing Numpad2 will send report for "Exploiting"|Pressing Numpad3 will send report for "Text Chat-Spam"|Pressing Numpad4 types "Nice Cheats!" in chat|Pressing Numpad5 will send report for "Text Chat-Offensive"|Pressing Numpad6 types "Reported!" in chat|Pressing Numpad7 will send report for "Voice Chat-Offensive"|Pressing Numpad8 will send report for "UserName-Offensive"|Pressing Numpad9 will send report for "ClanTag-Offensive"|Pressing Numbpad+ will buy the first person back on list.
Gui, Add, Button, gCloseGUI x10 y158 w120 h35, Close GUI
Gui, Add, Button, gCancelScript x200 y158 w120 h35, Cancel Script
Gui, Show, w330 h200, Report Actions

; Define Numpad hotkeys
Numpad1::
    FileAppend, %A_Now% - Numpad1 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    ; Actions...
return

Numpad0::
    FileAppend, %A_Now% - Numpad0 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    ; Actions...
return

; Additional hotkeys (Numpad2 to Numpad9 and NumpadAdd) follow similar pattern...

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

; This part ensures that the script remains active even after running the GUI code
GuiClose:
    Gui, Hide
return
