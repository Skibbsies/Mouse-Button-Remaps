#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force
#InstallKeybdHook
#InstallMouseHook
Process, Priority,, High



; ################ VARIABLES ################

global ButtonOne
global ButtonTwo

global HotkeysEnabled := 0



; ################ GUI ################

Gui, Main:New, +AlwaysOnTop -Theme -Border -ToolWindow
Gui, Main:Color, Black

Gui, Main:Font, s12, Arial

Gui, Main:Add, Text, cYellow, Mouse Button 1
Gui, Main:Add, Hotkey, gSubmitInput vButtonOne

Gui, Main:Add, Text, cYellow, Mouse Button 2
Gui, Main:Add, Hotkey, gSubmitInput vButtonTwo

Gui, Main:Add, Checkbox, cPurple vHotkeysEnabled gSubmitInput, Enabled?

Gui, Main:Font, s8, Arial

Gui, Main:Show, x0 y0 w210 h160, Mouse Hotkeys

SubmitInput()



; ################ HOTKEYS ################

$XButton1::SendInput, % (HotkeysEnabled) ? (ButtonOne) : (XButton1)
$XButton2::SendInput, % (HotkeysEnabled) ? (ButtonTwo) : (XButton2)

F12::
Suspend, Permit
Gui, % (GuiActive := !GuiActive) ? ("Main:Hide") : ("Main:Show")
return

#X::
Suspend, Permit
ExitApp
return



; ################ FUNCTIONS ################

SubmitInput() {
	Gui, Main:Submit, NoHide
} return