#SingleInstance, Force

OfficeBlock = %A_Temp%\OfficeBlock

MsgBox 36, OfficeBlock, Play "Game Name"?
IfMsgBox, No
    return

FileCreateDir, %OfficeBlock%
FileInstall, GDIPLUS.DLL, %OfficeBlock%\GDIPLUS.DLL
FileInstall, INTLDATE.DLL, %OfficeBlock%\INTLDATE.DLL
FileInstall, PPTVIEW.EXE, %OfficeBlock%\PPTVIEW.EXE
FileInstall, PPVWINTL.DLL, %OfficeBlock%\PPVWINTL.DLL
FileInstall, SAEXT.DLL, %OfficeBlock%\SAEXT.DLL
FileInstall, UNICOWS.DLL, %OfficeBlock%\UNICOWS.DLL

FileInstall, mainfile.ppt, %OfficeBlock%\mainfile.ppt
FileInstall, soundasset.mp3, %OfficeBlock%\soundasset.mp3

MsgBox, 64, , The game will start in fullscreen. You can press Esc to leave the game.
RunWait, %OfficeBlock%\PPTVIEW.EXE "mainfile.ppt", %OfficeBlock%

RemoveTempDir() {
    FileRemoveDir, %A_Temp%\OfficeBlock, 1
}

OnExit("RemoveTempDir")
