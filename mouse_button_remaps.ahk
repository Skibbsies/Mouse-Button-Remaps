#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force
#InstallKeybdHook
#InstallMouseHook
Process, Priority,, High



; ################ VARIABLES ################

global Button1
global Button2

global active := true

global debounce := true



Suspend,On



; ################ GUI ################

Gui, Main:New, +AlwaysOnTop -Theme -Border
Gui, Main:Color, Black

Gui, Main:Font, s12, Arial

Gui, Main:Add, Text, cYellow, Mouse Button 1
Gui, Main:Add, Hotkey, gsubmitInput vButton1

Gui, Main:Add, Text, cYellow, Mouse Button 2
Gui, Main:Add, Hotkey, gsubmitInput vButton2

Gui, Main:Add, Checkbox, cPurple vactive gsubmitInput, Enabled?

Gui, Main:Font, s8, Arial

Gui, Main:Show, x0 y0 w210 h160, Mouse Hotkeys



; ################ HOTKEYS ################

XButton1::
if (active) {
	SendInput, %Button1%
} else {
	return
} return

XButton2::
if (active) {
	SendInput, %Button2%
} else {
	return
} return

F12::
Suspend,Permit

if (debounce = true) {
	Gui, Main:Hide
	
	debounce := false
} else if (debounce = false) {
	Gui, Main:Show, x0 y0 w210 h160, Mouse Hotkeys
	
	debounce := true
} return

#X::
Suspend
ExitApp
return



; ################ FUNCTIONS ################

submitInput() {
	Gui, Main:Submit, NoHide
	
	if (active = true) {		
		Suspend,Off
	} else if (active = false) {
		Suspend,On
	}
} return

