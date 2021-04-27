#SingleInstance, Force

OfficeBlock = %A_Temp%\OfficeBlock

; Ask user if they want to play, quit on "No" Response
MsgBox 36, OfficeBlock, Play "Game Name"?
IfMsgBox, No
    return

FileCreateDir, %OfficeBlock% ; Creates temporary folder to store game assets
; Add viewer files to game folder
FileInstall, GDIPLUS.DLL, %OfficeBlock%\GDIPLUS.DLL
FileInstall, INTLDATE.DLL, %OfficeBlock%\INTLDATE.DLL
FileInstall, PPTVIEW.EXE, %OfficeBlock%\PPTVIEW.EXE
FileInstall, PPVWINTL.DLL, %OfficeBlock%\PPVWINTL.DLL
FileInstall, SAEXT.DLL, %OfficeBlock%\SAEXT.DLL
FileInstall, UNICOWS.DLL, %OfficeBlock%\UNICOWS.DLL

; Add game files
FileInstall, mainfile.ppt, %OfficeBlock%\mainfile.ppt
FileInstall, soundasset.mp3, %OfficeBlock%\soundasset.mp3

MsgBox, 64, , The game will start in fullscreen. You can press Esc to leave the game. ; Warn user about fullscreen
RunWait, %OfficeBlock%\PPTVIEW.EXE "mainfile.ppt", %OfficeBlock% ; Run the game

RemoveTempDir() {
    ; Deletes the temporary directory
    FileRemoveDir, %A_Temp%\OfficeBlock, 1 
}

OnExit("RemoveTempDir")
