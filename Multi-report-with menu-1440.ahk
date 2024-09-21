#SingleInstance, Force
SendMode, Input
#Persistent

; Define log file path
logFile := "C:\Reportlogfile.txt"

; Initialize log file with script start time
FileAppend, %A_Now% - Script started.`n, %logFile%

; Define the script version
ScriptVersion := "1.0.2"

; Define the correct URL where the latest version is hosted (raw GitHub link)
VersionUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/main/version.txt"

; Path to temporarily download the version file
TempVersionFile := A_Temp "\latest_version.txt"

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
    MsgBox, You are already using the latest version (%ScriptVersion%).
}

; Function to update the script
UpdateScript() {
    ; Define the URL for the updated script (replace this with the actual script URL)
    ScriptDownloadUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/main/Multi-report-with-menu.ahk"

    ; Path to save the downloaded script
    UpdatedScriptPath := A_Desktop "\Multi-report-with-menu.ahk"

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
Numpad1::
    FileAppend, %A_Now% - Numpad1 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 512  ; (848 * 1.3333, 384 * 1.3333)
    Sleep, 200
    Click, 1131, 613  ; (848 * 1.3333, 460 * 1.3333)
    Sleep, 200
    Click, 1131, 706  ; (848 * 1.3333, 530 * 1.3333)
    Sleep, 200
    Click, 1131, 808  ; (848 * 1.3333, 606 * 1.3333)
    Sleep, 200
    Click, 1131, 906  ; (848 * 1.3333, 680 * 1.3333)
    Sleep, 200
    Click, 1131, 1004 ; (848 * 1.3333, 753 * 1.3333)
    Sleep, 200
    Click, 1131, 1100 ; (848 * 1.3333, 825 * 1.3333)
    Sleep, 200
    Click, 1131, 613  ; (848 * 1.3333, 460 * 1.3333)
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad0::
    FileAppend, %A_Now% - Numpad0 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 512  ; (848 * 1.3333, 384 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad2::
    FileAppend, %A_Now% - Numpad2 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 613  ; (848 * 1.3333, 460 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad3::
    FileAppend, %A_Now% - Numpad3 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 706  ; (848 * 1.3333, 530 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad4::
    FileAppend, %A_Now% - Numpad4 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 200
    SendInput, Nice Cheats!
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad5::
    FileAppend, %A_Now% - Numpad5 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 808  ; (848 * 1.3333, 606 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad6::
    FileAppend, %A_Now% - Numpad6 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 200
    SendInput, Reported!
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad7::
    FileAppend, %A_Now% - Numpad7 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 906  ; (848 * 1.3333, 680 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad8::
    FileAppend, %A_Now% - Numpad8 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 1004 ; (848 * 1.3333, 753 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

Numpad9::
    FileAppend, %A_Now% - Numpad9 pressed.`n, %logFile%
    SendInput, x
    Sleep, 200
    Click, 1131, 1100 ; (848 * 1.3333, 825 * 1.3333)
    Sleep, 200
    Click, 1253, 1230 ; (940 * 1.3333, 923 * 1.3333)
    Sleep, 200
    Click, 1284, 1222 ; (963 * 1.3333, 917 * 1.3333)
return

NumpadAdd::
     FileAppend, %A_Now% - Bought Someone back.`n, %logFile%
     Click, 255, 190 ; (191 * 1.3333, 143 * 1.3333)
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
