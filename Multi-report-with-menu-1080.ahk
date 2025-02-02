#SingleInstance, Force
SendMode, Input
#Persistent

; Define log file path
logFile := A_Temp "\Reportlogfile1080.txt"
flagFile := A_Temp "\Reportlogfile1080.txt"

; Initialize log file with script start time
FileAppend, %A_Now% - Script started.`n, %logFile%

; Define the script version
ScriptVersion := "2.1.4"

; Define the correct URL where the latest version is hosted (raw GitHub link)
VersionUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/refs/heads/main/Version-1080.txt"

; Path to temporarily download the version file
TempVersionFile := A_Temp "\latest_version-1080.txt"

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
    ScriptDownloadUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/refs/heads/main/Multi-report-with-menu-1080.ahk"

    ; Path to save the downloaded script
    UpdatedScriptPath := A_Desktop "\Multi-report-with-menu-1080.ahk"

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

; Read saved Numpad4 and Numpad6 text from file
Numpad4TextFile := A_Temp "\Numpad4Text.txt"
Numpad6TextFile := A_Temp "\Numpad6Text.txt"

if (FileExist(Numpad4TextFile))
{
    FileRead, Numpad4Text, %Numpad4TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad6TextFile))
{
    FileRead, Numpad6Text, %Numpad6TextFile%
} else {
    Numpad6Text := "Text"
}

; Create a GUI window
Gui, Add, ListBox, vMyListBox w377 h150, Pressing Ctrl+Numpad0 will send report for "Cheating"
|Pressing Ctrl+Numpad1 will send report for "ALL"
|Pressing Ctrl+Numpad2 will send report for "Exploiting"
|Pressing Ctrl+Numpad3 will send report for "Text Chat-Spam"
|Pressing Ctrl+Numpad4 types "%Numpad4Text%" in chat
|Pressing Ctrl+Numpad5 will send report for "Text Chat-Offensive"
|Pressing Ctrl+Numpad6 types "%Numpad6Text%" in chat
|Pressing Ctrl+Numpad7 will send report for "Voice Chat-Offensive"
|Pressing Ctrl+Numpad8 will send report for "UserName-Offensive"
|Pressing Ctrl+Numpad9 will send report for "ClanTag-Offensive"
|Pressing Ctrl+Numpad+ will buy the first person back on list.

; Add labels for the input fields
Gui, Add, Text, x10 y160, Numpad4 Text:
Gui, Add, Edit, vNumpad4Input w377 h20, %Numpad4Text%

Gui, Add, Text, x10 y205, Numpad6 Text:
Gui, Add, Edit, vNumpad6Input w377 h20, %Numpad6Text%

Gui, Add, Button, gSaveChanges x9 y260 w120 h35, Save Changes
Gui, Add, Button, gCloseGUI x268 y260 w120 h35, Close GUI
Gui, Add, Button, gCancelScript x138 y260 w120 h35, Cancel Script
Gui, Show, w400 h310, Report Actions

; Define Numpad hotkeys (adjusted click coordinates for 1920x1080 resolution)
^Numpad0:: 
    FileAppend, %A_Now% - Ctrl+Numpad0 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 420  ; Reports for "Cheating"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad1:: 
    FileAppend, %A_Now% - Ctrl+Numpad1 pressed.`n, %logFile%
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
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad2:: 
    FileAppend, %A_Now% - Ctrl+Numpad2 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 480 ; Reports for "Exploiting"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad3:: 
    FileAppend, %A_Now% - Ctrl+Numpad3 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 540 ; Reports for "Text Chat-Spam"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad4:: 
    FileAppend, %A_Now% - Ctrl+Numpad4 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad4Text%
    Sleep, 300
    Send, {Enter}
return

^Numpad5:: 
    FileAppend, %A_Now% - Ctrl+Numpad5 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 600 ; Reports for "Text Chat-Spam"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad6:: 
    FileAppend, %A_Now% - Ctrl+Numpad6 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad6Text%
    Sleep, 300
    Send, {Enter}
return

^Numpad7:: 
    FileAppend, %A_Now% - Ctrl+Numpad7 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 660 ; Reports for "Voice Chat-Offensive"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad8:: 
    FileAppend, %A_Now% - Ctrl+Numpad8 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 722 ; Reports for "UserName-Offensive"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^Numpad9:: 
    FileAppend, %A_Now% - Ctrl+Numpad9 pressed.`n, %logFile%
    SendInput, x
    Sleep, 300
    Click, 870, 785 ; Reports for "ClanTag-Offensive"
    Sleep, 300
    Click, 955, 890 ; Clicks "Send report"
return

^NumpadAdd:: 
    FileAppend, %A_Now% - Ctrl+Numpad+ pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    Click, 280, 300 ; buys back the first person on list
    Sleep, 300
    SendInput, {Enter}
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
    Gui, Submit, NoHide  ; Ensure it grabs the current input values from the GUI

    ; Save to the text files
    FileAppend, %A_Now% - Numpad4 text saved: %Numpad4Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad6 text saved: %Numpad6Input%`n, %logFile%

    ; Delete old files if they exist, then append new data
    FileDelete, %Numpad4TextFile%
    FileDelete, %Numpad6TextFile%
    FileAppend, %Numpad4Input%, %Numpad4TextFile%
    FileAppend, %Numpad6Input%, %Numpad6TextFile%

    ; Create a custom Gui for the popup message
    Gui, +AlwaysOnTop
    Gui, Add, Text, w400 h50 Center, Changes have been saved!`nNumpad4Input:
    Gui, Show, w400 h265, Changes Saved

    ; Wait for 500ms before closing the Gui and reloading
    Sleep, 500

    ; Close the custom Gui
    Gui, Destroy

    ; Reload the script
    Reload
return

^Esc::ExitApp
