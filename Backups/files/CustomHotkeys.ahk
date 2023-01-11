#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe WindowsTerminal.exe
CapsLock::Esc
Esc::CapsLock

;#IfWinActive ahk_class Chrome_WidgetWin_1
;CapsLock::Esc
;Esc::CapsLock

#IfWinActive ahk_exe devenv.exe
CapsLock::Esc
Esc::CapsLock

#IfWinActive ahk_exe qtcreator.exe
CapsLock::Esc
Esc::CapsLock

#IfWinActive ahk_exe studio64.exe
CapsLock::Esc
Esc::CapsLock

#IfWinActive ahk_exe Code.exe
CapsLock::Esc
Esc::CapsLock

#IfWinActive ahk_exe powershell.exe
CapsLock::Esc
Esc::CapsLock