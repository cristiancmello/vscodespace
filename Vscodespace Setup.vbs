Set objShell = WScript.CreateObject("WScript.Shell")

Dim currentDirectory, destinyShortcutPath, applicationName

applicationName = "Vscodespace" 
currentDirectory = objShell.CurrentDirectory

Function ShowSuccessDialog(currentDirectory)
    WScript.Echo("Create successfully! " & currentDirectory)
End Function

Class VscodespaceScript
    Public FriendlyName
    Public TargetFileName
    Public TargetPath
    Public IconFileName

    Public Function CreateShortcut()
        On Error Resume Next
        CreateShortcut = vbNull

        Set lnk = objShell.CreateShortcut(destinyShortcutPath & "\" & me.FriendlyName & ".LNK")

        lnk.TargetPath = currentDirectory & "\" & me.TargetPath & "\" & me.TargetFileName
        lnk.Arguments = ""
        lnk.Description = "vscodespace " & me.FriendlyName
        lnk.HotKey = ""
        lnk.IconLocation = currentDirectory & "\" & me.IconFileName
        lnk.WindowStyle = "1"
        lnk.WorkingDirectory = currentDirectory & "\" & me.TargetPath
        CreateShortcut = lnk.Save

        'Clean up 
        Set lnk = Nothing
        
        On Error Goto 0
    End Function
End Class

Function CreateVscodespaceScript(FriendlyName, TargetFileName, IconName)
    Set vscodeSpaceScriptInstance = new VscodespaceScript
    vscodeSpaceScriptInstance.FriendlyName = FriendlyName
    vscodeSpaceScriptInstance.TargetFileName = TargetFileName
    vscodeSpaceScriptInstance.TargetPath = "scripts"
    vscodeSpaceScriptInstance.IconFileName = "icons/" & IconName & ".ico"

    Set CreateVscodespaceScript = vscodeSpaceScriptInstance
End Function

Function SelectFolder(myStartFolder)
    ' Standard housekeeping
    Dim objFolder, objItem, objShell
    
    ' Custom error handling
    On Error Resume Next
    SelectFolder = vbNull

    ' Create a dialog object
    Set objShell  = CreateObject("Shell.Application")
    Set objFolder = objShell.BrowseForFolder(0, "Select the folder where the shortcuts will be created:", 0, myStartFolder)

    ' Return the path of the selected folder
    If IsObject( objfolder ) Then SelectFolder = objFolder.Self.Path

    ' Standard housekeeping
    Set objFolder = Nothing
    Set objshell  = Nothing
    On Error Goto 0
End Function

destinyShortcutPath = SelectFolder("")

If destinyShortcutPath = vbNull Then 
    Msgbox "No folder chosen", vbApplicationModal+vbInformation, applicationName
    WScript.Quit
End If

Set StartScript = CreateVscodespaceScript("Vscodespace Start", "up.sh", "run")
Set BuildScript = CreateVscodespaceScript("Vscodespace Build", "build.sh", "download")
Set ReloadScript = CreateVscodespaceScript("Vscodespace Reload", "reload.sh", "update")
Set CleanupAllScript = CreateVscodespaceScript("Vscodespace Clean Up", "cleanup.all.sh", "delete")
Set ShellScript = CreateVscodespaceScript("Vscodespace Shell", "ssh.sh", "shell")
Set ShutdownScript = CreateVscodespaceScript("Vscodespace Shutdown", "down.sh", "stop")
Set StatusScript = CreateVscodespaceScript("Vscodespace Status", "status.sh", "info")
Set OpenWorkspaceInVsCodeScript = CreateVscodespaceScript("Open Workspace in Visual Studio Code", "code.workspace.start.vbs", "open-in-vscode")

Dim createShortCutReturn

createShortCutReturn = StatusScript.CreateShortcut()

If createShortCutReturn = vbNull Then 
    Msgbox "It is not possible to create shortcuts in the chosen folder.", vbApplicationModal+vbInformation, applicationName
Else
    Msgbox "Successfully created!", vbApplicationModal+vbInformation, applicationName
End If

StartScript.CreateShortcut
BuildScript.CreateShortcut
ReloadScript.CreateShortcut
CleanupAllScript.CreateShortcut
ShellScript.CreateShortcut
ShutdownScript.CreateShortcut
OpenWorkspaceInVsCodeScript.CreateShortcut