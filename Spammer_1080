#SingleInstance, Force
SendMode, Input
#Persistent

; Define log file path
logFile := A_Temp "\ReportlogfileSpammer1080.txt"
flagFile := A_Temp "\ReportlogfileSpammer1080.txt"

; Initialize log file with script start time
FileAppend, %A_Now% - Script started.`n, %logFile%

; Define the script version
ScriptVersion := "1.0.0"

; Define the correct URL where the latest version is hosted (raw GitHub link)
VersionUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/refs/heads/main/Spammer-1080.txt"

; Path to temporarily download the version file
TempVersionFile := A_Temp "\latest_version-spammer.txt"

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
    ScriptDownloadUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/refs/heads/main/Spammer-1080.ahk"

    ; Path to save the downloaded script
    UpdatedScriptPath := A_Desktop "\Spammer-1080.ahk"

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
Numpad1TextFile := A_Temp "\Numpad1Text.txt"
Numpad2TextFile := A_Temp "\Numpad2Text.txt"
Numpad3TextFile := A_Temp "\Numpad3Text.txt"
Numpad4TextFile := A_Temp "\Numpad4Text.txt"
Numpad5TextFile := A_Temp "\Numpad6Text.txt"
Numpad6TextFile := A_Temp "\Numpad6Text.txt"
Numpad7TextFile := A_Temp "\Numpad7Text.txt"
Numpad8TextFile := A_Temp "\Numpad8Text.txt"
Numpad9TextFile := A_Temp "\Numpad9Text.txt"

if (FileExist(Numpad1TextFile))
{
    FileRead, Numpad1Text, %Numpad1TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad2TextFile))
{
    FileRead, Numpad2Text, %Numpad2TextFile%
} else {
    Numpad6Text := "Text"
}

if (FileExist(Numpad3TextFile))
{
    FileRead, Numpad3Text, %Numpad3TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad4TextFile))
{
    FileRead, Numpad4Text, %Numpad4TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad5TextFile))
{
    FileRead, Numpad5Text, %Numpad5TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad6TextFile))
{
    FileRead, Numpad6Text, %Numpad6TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad1TextFile))
{
    FileRead, Numpad7Text, %Numpad7TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad8TextFile))
{
    FileRead, Numpad8Text, %Numpad8TextFile%
} else {
    Numpad4Text := "Text"
}

if (FileExist(Numpad9TextFile))
{
    FileRead, Numpad9Text, %Numpad9TextFile%
} else {
    Numpad4Text := "Text"
}

; Create a GUI window
Gui, Add, ListBox, vMyListBox w377 h150, Pressing Ctrl+Numpad0 will send report for "Cheating"
|Pressing Ctrl+Numpad1 types "%Numpad1Text%" in chat
|Pressing Ctrl+Numpad2 types "%Numpad2Text%" in chat
|Pressing Ctrl+Numpad3 types "%Numpad3Text%" in chat
|Pressing Ctrl+Numpad4 types "%Numpad4Text%" in chat
|Pressing Ctrl+Numpad5 types "%Numpad5Text%" in chat
|Pressing Ctrl+Numpad6 types "%Numpad6Text%" in chat
|Pressing Ctrl+Numpad7 types "%Numpad7Text%" in chat
|Pressing Ctrl+Numpad8 types "%Numpad8Text%" in chat
|Pressing Ctrl+Numpad9 types "%Numpad9Text%" in chat


; Add labels for the input fields

Gui, Add, Text, x10 y160, Numpad1 Text:
Gui, Add, Edit, vNumpad1Input w377 h20, %Numpad1Text%

Gui, Add, Text, x10 y160, Numpad2 Text:
Gui, Add, Edit, vNumpad2Input w377 h20, %Numpad2Text%

Gui, Add, Text, x10 y160, Numpad3 Text:
Gui, Add, Edit, vNumpad3Input w377 h20, %Numpad3Text%

Gui, Add, Text, x10 y160, Numpad4 Text:
Gui, Add, Edit, vNumpad4Input w377 h20, %Numpad4Text%

Gui, Add, Text, x10 y160, Numpad5 Text:
Gui, Add, Edit, vNumpad5Input w377 h20, %Numpad5Text%

Gui, Add, Text, x10 y205, Numpad6 Text:
Gui, Add, Edit, vNumpad6Input w377 h20, %Numpad6Text%

Gui, Add, Text, x10 y160, Numpad7 Text:
Gui, Add, Edit, vNumpad7Input w377 h20, %Numpad7Text%

Gui, Add, Text, x10 y160, Numpad8 Text:
Gui, Add, Edit, vNumpad8Input w377 h20, %Numpad8Text%

Gui, Add, Text, x10 y160, Numpad9 Text:
Gui, Add, Edit, vNumpad9Input w377 h20, %Numpad9Text%

Gui, Add, Button, gSaveChanges x9 y260 w120 h35, Save Changes
Gui, Add, Button, gCloseGUI x268 y260 w120 h35, Close GUI
Gui, Add, Button, gCancelScript x138 y260 w120 h35, Cancel Script
Gui, Show, w400 h310, Report Actions

; Define Numpad hotkeys (adjusted click coordinates for 1920x1080 resolution)

^Numpad1:: 
    FileAppend, %A_Now% - Ctrl+Numpad1 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad1Text%
    Sleep, 300
    Send, {Enter}
return

^Numpad2:: 
    FileAppend, %A_Now% - Ctrl+Numpad2 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad2Text%
    Sleep, 300
    Send, {Enter}
return

^Numpad3:: 
    FileAppend, %A_Now% - Ctrl+Numpad3 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad3Text%
    Sleep, 300
    Send, {Enter}
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
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad5Text%
    Sleep, 300
    Send, {Enter}
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
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad7Text%
    Sleep, 300
    Send, {Enter}
return

^Numpad8:: 
    FileAppend, %A_Now% - Ctrl+Numpad8 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad8Text%
    Sleep, 300
    Send, {Enter}
return

^Numpad9:: 
    FileAppend, %A_Now% - Ctrl+Numpad9 pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, %Numpad9Text%
    Sleep, 300
    Send, {Enter}
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
    FileAppend, %A_Now% - Numpad1 text saved: %Numpad1Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad2 text saved: %Numpad2Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad3 text saved: %Numpad3Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad4 text saved: %Numpad4Input%`n, %logFile%	
    FileAppend, %A_Now% - Numpad5 text saved: %Numpad5Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad6 text saved: %Numpad6Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad7 text saved: %Numpad7Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad8 text saved: %Numpad8Input%`n, %logFile%
    FileAppend, %A_Now% - Numpad9 text saved: %Numpad9Input%`n, %logFile%
	
    ; Delete old files if they exist, then append new data
    FileDelete, %Numpad1TextFile%
    FileDelete, %Numpad2TextFile%
    FileDelete, %Numpad3TextFile%
    FileDelete, %Numpad4TextFile%
    FileDelete, %Numpad5TextFile%
    FileDelete, %Numpad6TextFile%
    FileDelete, %Numpad7TextFile%
    FileDelete, %Numpad8TextFile%
    FileDelete, %Numpad9TextFile%
	
    FileAppend, %Numpad1Input%, %Numpad1TextFile%
    FileAppend, %Numpad2Input%, %Numpad2TextFile%
    FileAppend, %Numpad3Input%, %Numpad3TextFile%
    FileAppend, %Numpad4Input%, %Numpad4TextFile%
    FileAppend, %Numpad5Input%, %Numpad5TextFile%
    FileAppend, %Numpad6Input%, %Numpad6TextFile%
    FileAppend, %Numpad7Input%, %Numpad7TextFile%
    FileAppend, %Numpad8Input%, %Numpad8TextFile%
    FileAppend, %Numpad9Input%, %Numpad9TextFile%

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
