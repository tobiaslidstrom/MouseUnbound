/*
 * MouseUnbound
 * Copyright (c) Tobias Lidström
 */

GameName := "nwmain.exe" ; Name of the game executable
HotkeyExit := true ; Hotkey (Win + X) to exit the script
ScriptTimeout := 30 ; Number of seconds to wait for game to load

#SingleInstance
#Persistent

; Wait for game to load, terminate on timeout
Loop {
	WinWait, ahk_exe %GameName%,, ScriptTimeout
	if (ErrorLevel) {
		ExitApp
	}
}

; Remap mouse if game is running
Loop {
	if WinActive("ahk_exe " . GameName) {
		XButton1::MButton
	}
}

; Hotkey to exit script
if (HotkeyExit) {
	#x::ExitApp ; Win + X
}
