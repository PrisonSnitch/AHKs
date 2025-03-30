#SingleInstance, Force
SendMode, Input
#Persistent

; Define log file path
logFile := A_Temp "\logfileSpammer1080.txt"

; Initialize log file
FileAppend, %A_Now% - Script started.`n, %logFile%

; Define script version
ScriptVersion := "1.0.0"

; Define URL for version check
VersionUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/main/Spammer-1080-version"

; Path for temporary version file
TempVersionFile := A_Temp "\latest-Spammer-1080-version.txt"

; Debugging mode
DebugMode := true
if DebugMode
    FileAppend, %A_Now% - Debug mode enabled.`n, %logFile%

; Download version file
URLDownloadToFile, %VersionUrl%, %TempVersionFile%
if !FileExist(TempVersionFile) {
    MsgBox, Error: Could not download the version file.
    ExitApp
}

; Read version from file
FileRead, LatestVersion, %TempVersionFile%
LatestVersion := Trim(LatestVersion)

; Validate version format
if !RegExMatch(LatestVersion, "^\d+\.\d+\.\d+$") {
    MsgBox, Error: Invalid version format in the file: %LatestVersion%
    ExitApp
}

; Function to compare versions
IsNewerVersion(CurrentVersion, RemoteVersion) {
    CurrentParts := StrSplit(CurrentVersion, ".")
    RemoteParts := StrSplit(RemoteVersion, ".")
    Loop, 3 {
        if (RemoteParts[A_Index] > CurrentParts[A_Index])
            return true
        if (RemoteParts[A_Index] < CurrentParts[A_Index])
            return false
    }
    return false
}

; Check for updates
if IsNewerVersion(ScriptVersion, LatestVersion) {
    MsgBox, 4, Update Available, A newer version (%LatestVersion%) is available.`nDo you want to update now?
    IfMsgBox, Yes {
        UpdateScript()
    } else {
        return
    }
} else {
    MsgBox, You are using the latest version (%ScriptVersion%).
}

; Function to update the script
UpdateScript() {
    ScriptDownloadUrl := "https://raw.githubusercontent.com/PrisonSnitch/AHKs/main/Spammer-1080"
    UpdatedScriptPath := A_Desktop "\Spammer-1080.ahk"
    URLDownloadToFile, %ScriptDownloadUrl%, %UpdatedScriptPath%
    if FileExist(UpdatedScriptPath) {
        MsgBox, Update successful! Restarting the script...
        Run, %UpdatedScriptPath%
        ExitApp
    } else {
        MsgBox, Error: Failed to download the updated script.
    }
}

; Load default text for numpad actions
SpammerNumpadTextFiles := {}
NumpadText := {}
Loop, 9 {
    SpammerNumpadTextFiles[A_Index] := A_Temp "\SpammerNumpad" A_Index "Text.txt"
    if FileExist(SpammerNumpadTextFiles[A_Index]) {
        FileRead, Content, %SpammerNumpadTextFiles[A_Index]%
        NumpadText[A_Index] := Trim(Content)
    } else {
        NumpadText[A_Index] := "Default"
    }
}

; Define hotkeys for Numpad
Loop, 9 {
    Hotkey, ^Numpad%A_Index%, HandleNumpadPress
}

; Hotkey handler
HandleNumpadPress:
    Hotkey := SubStr(A_ThisHotkey, 2)
    NumpadIndex := SubStr(Hotkey, 7)
    FileAppend, %A_Now% - Ctrl+%Hotkey% pressed.`n, %logFile%
    SendInput, {Enter}
    Sleep, 300
    SendInput, % NumpadText[NumpadIndex]
    Sleep, 300
    Send, {Enter}
return

; GUI setup
Gui, Add, Text, x10 y10, Configure Numpad Texts:
Loop, 9 {
    Gui, Add, Text, x10 y%((A_Index - 1) * 30 + 40)%, Numpad%A_Index% Text:
    Gui, Add, Edit, vNumpad%A_Index%Input w250 x150 y%((A_Index - 1) * 30 + 40), % NumpadText[A_Index]
}
Gui, Add, Button, gSaveChanges x10 y330 w120 h35, Save Changes
Gui, Add, Button, gCloseGUI x270 y330 w120 h35, Close GUI
Gui, Show, w400 h380, Spammer Configuration

SaveChanges:
    Gui, Submit, NoHide
    Loop, 9 {
        NumpadText[A_Index] := GuiControlGet("Numpad" A_Index "Input")
        File := SpammerNumpadTextFiles[A_Index]
        FileDelete, %File%
        FileAppend, %NumpadText[A_Index]%, %File%
    }
    MsgBox, Changes saved successfully!
return

CloseGUI:
    Gui, Destroy
    ExitApp
return
 qw
