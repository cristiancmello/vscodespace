Set objShell = WScript.CreateObject("WScript.Shell")

Dim codeArguments

codeArguments = "--file-uri vscode-remote://ssh-remote+localhost/home/vagrant/workspace/vscodespace.code-workspace"

intReturn = objShell.Run("code " & codeArguments, 0, true)

If intReturn <> 0 Then 
   Wscript.Echo "Error running program"
End If