#SingleInstance, Force
SendMode, Input
#Persistent

; Define log file path
logFile := A_Temp "\Reportlogfile1440.txt"
flagFile := A_Temp "\Reportlogfile1440.txt"

; Initialize log file with script start time
FileAppend, %A_Now% - Script started.`n, %logFile%

; Define the script version
ScriptVersion := "1.0.5"

; Define the correct URL where the latest version is hosted (raw GitHub link)
VersionUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/refs/heads/main/Version-1440.txt"

; Path to temporarily download the version file
TempVersionFile := A_Temp "\latest_version-1440.txt"

DebugMode := true
if DebugMode
    FileAppend, %A_Now% - Debug: Download successful.`n, %logFile%
    
; Download the latest version number from the web (raw content)
URLDownloadToFile, %VersionUrl%, %TempVersionFile%

; Check if the version file was downloaded successfully
if !FileExist(TempVersionFile) {
    MsgBox, Error: Failed to download the version file.
    ExitApp
}

; Read the version number from the downloaded file
FileRead, LatestVersion, %TempVersionFile%

; Trim any extra whitespace, BOM, or newline characters from the downloaded version
LatestVersion := RegExReplace(LatestVersion, "^\s+|\s+$")  ; Trim leading/trailing spaces
LatestVersion := StrReplace(LatestVersion, "`r`n", "")  ; Remove any carriage return and newline characters

; Check if the version format is correct (should be like x.y.z)
if !RegExMatch(LatestVersion, "^\d+\.\d+\.\d+$") {
    MsgBox, Error: Invalid version format in the downloaded file: %LatestVersion%
    ExitApp
}

; Function to compare versions
IsNewerVersion(CurrentVersion, RemoteVersion) {
    CurrentParts := StrSplit(CurrentVersion, ".")
    RemoteParts := StrSplit(RemoteVersion, ".")

    Loop, 3  ; Compare up to 3 parts (major, minor, patch)
    {
        If (RemoteParts[A_Index] > CurrentParts[A_Index])
            return true
        If (RemoteParts[A_Index] < CurrentParts[A_Index])
            return false
    }
    return false  ; Return false if the versions are the same or the remote version is older
}

; Check if the online version is newer
if IsNewerVersion(ScriptVersion, LatestVersion) {
    MsgBox, 4, Update Available, A newer version (%LatestVersion%) of this script is available.`n`nDo you want to download and update the script now?
    IfMsgBox, Yes
    {
        ; User selected Yes, proceed with downloading and updating
        UpdateScript()
    }
    else
    {
        ; If the user selects No, continue silently
        return
    }
} else {
    MsgBox, You are using the latest version (%ScriptVersion%).
}

; Function to update the script
UpdateScript() {
    ; Define the URL for the updated script (replace this with the actual script URL)
    ScriptDownloadUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/refs/heads/main/Multi-report-with%20menu-1440.ahk"

    ; Path to save the downloaded script
    UpdatedScriptPath := A_Desktop "\Multi-report-with-menu-1440.ahk"

    ; Download the updated script
    URLDownloadToFile, %ScriptDownloadUrl%, %UpdatedScriptPath%

    ; Check if the updated script was downloaded successfully
    if FileExist(UpdatedScriptPath)
    {
        MsgBox, The script was updated successfully.`nRestarting the script...
        ; Run the new version of the script and exit the current instance
        Run, %UpdatedScriptPath%
        ExitApp
    }
    else
    {
        MsgBox, Error: Failed to download the updated script.
    }
}

; Create a GUI window
Gui, Add, ListBox, vMyListBox w310 h155, Pressing Numpad0 will send report for "Cheating"|Pressing Numpad1 will send report for "ALL"|Pressing Numpad2 will send report for "Exploiting"|Pressing Numpad3 will send report for "Text Chat-Spam"|Pressing Numpad4 types "Nice Cheats!" in chat|Pressing Numpad5 will send report for "Text Chat-Offensive"|Pressing Numpad6 types "Reported!" in chat|Pressing Numpad7 will send report for "Voice Chat-Offensive"|Pressing Numpad8 will send report for "UserName-Offensive"|Pressing Numpad9 will send report for "ClanTag-Offensive"|Pressing Numpad+ will buy the first person back on list.
Gui, Add, Button, gCloseGUI x10 y158 w120 h35, Close GUI
Gui, Add, Button, gCancelScript x200 y158 w120 h35, Cancel Script
Gui, Show, w330 h200, Report Actions

; Define Numpad hotkeys
; Reports for cheating
Numpad0::
    FileAppend, %A_Now% - Numpad0 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 510
    Sleep, 300
    Click, 1282, 1228
return

; Reports for "Exploiting"
Numpad1::
    FileAppend, %A_Now% - Numpad1 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 510
    Sleep, 300
    Click, 1130, 612
    Sleep, 300
    Click, 1130, 706
    Sleep, 300
    Click, 1130, 808
    Sleep, 300
    Click, 1130, 904
    Sleep, 300
    Click, 1130, 1004
    Sleep, 300
    Click, 1130, 1106
    Sleep, 300
    Click, 1282, 1228
return

; Reports for "Exploiting"
Numpad2::
    FileAppend, %A_Now% - Numpad2 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 612
    Sleep, 300
    Click, 1282, 1228
return

; Reports for "Text Chat-Spam"
Numpad3::
    FileAppend, %A_Now% - Numpad3 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 706
    Sleep, 300
    Click, 1282, 1228
return

; Types message in chat
Numpad4::
    FileAppend, %A_Now% - Numpad4 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, Nice Cheats!
    Sleep, 300
    Click, 1282, 1228
return

; Reports for "Text Chat-Offensive"
Numpad5::
    FileAppend, %A_Now% - Numpad5 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 808
    Sleep, 300
    Click, 1216, 1230
return

; Types message in chat
Numpad6::
    FileAppend, %A_Now% - Numpad6 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, Reported!
    Sleep, 300
    Click, 1282, 1228
return

; Reports for "Voice chat-Offensive"
Numpad7::
    FileAppend, %A_Now% - Numpad7 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 904
    Sleep, 300
    Click, 1273, 1250
return

; Reports for"UserName-Offensive"
Numpad8::
    FileAppend, %A_Now% - Numpad8 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 1004
    Sleep, 300
    Click, 1253, 1230
return

; Reports for "Clan Tag-Offensive"
Numpad9::
    FileAppend, %A_Now% - Numpad9 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 1130, 1106
    Sleep, 300
    Click, 1253, 1230
return

; Buys someone back in game
NumpadAdd::
     FileAppend, %A_Now% - Bought Someone back.`n, %logFile%
     Click right
     Sleep, 300
     Click, 347, 383
     Sleep, 300
     Send, {Esc}
return

; Hotkey to show the GUI again (Ctrl + S)
^s::
    Gui, Show
return

; Define hotkey to open the log file
^l:: ; Ctrl + L to open the log file
    FileAppend, %A_Now% - Logfile accessed.`n, %logFile%
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

GuiClose:
    Gui, Hide
return
