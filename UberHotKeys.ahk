; --------------------------------------------------
; # is for the Windows key
; ^ is for the Control key
; ! is for the Alt key
; + is for the Shift key
; --------------------------------------------------

; --------------------------------------------------
#NoTrayIcon
#SingleInstance, force
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows, On
SetTitleMatchMode, 2
; --------------------------------------------------

; --------------------------------------------------
; Close script
; ctrl+alt+end
; --------------------------------------------------
^!End::ExitApp

; --------------------------------------------------
; New Evernote note
; ctrl+alt+e
; --------------------------------------------------
^!e::!+n

; --------------------------------------------------
; Create new folder
; ctrl+n
; --------------------------------------------------
^n::Send, {AppsKey}wf

; --------------------------------------------------
; Paste as plain/unformatted text
; ctrl+alt+v
; --------------------------------------------------
^!v::
temp = %clipboard%
Clipboard = %temp%
Send, ^v
Return

; --------------------------------------------------
; Paste the date (e.g. 2010-09-22)
; ctrl+alt+d
; --------------------------------------------------
^!d::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput, %CurrentDateTime%
Return

; --------------------------------------------------
; Paste the date and time (e.g. 2010-09-22 11-03 PM)
; ctrl+alt+shift+d
; --------------------------------------------------
^+!d::
FormatTime, CurrentDateTime,, yyyy-MM-dd hh-mm tt
SendInput, %CurrentDateTime%
Return

; --------------------------------------------------
; Close active window
; ctrl+alt+q
; --------------------------------------------------
^!q::
WinGet, active_id, ID, A
WinKill, ahk_id %active_id%
Return

; --------------------------------------------------
; Start / focus SmartFTP
; ctrl+alt+s
; --------------------------------------------------
^!s::
IfWinExist, ahk_class AfxMDIFrame100su
{
 WinActivate
 Return
}
Run, "SmartFTP"
Return

; --------------------------------------------------
; Start web browser
; ctrl+alt+s
; --------------------------------------------------
^!w::Send, {Browser_Home}

; --------------------------------------------------
; Start favourite text editor
; ctrl+alt+space
; --------------------------------------------------
^!Space::Run, "editplus"

; --------------------------------------------------
; Start Photoshop
; ctrl+alt+x
; --------------------------------------------------
^!x::Run, "photoshop"

; --------------------------------------------------
; Start / show / hide Winamp
; ctrl+alt+x
; --------------------------------------------------
!`::
If winamp_hidden = False
{
 WinHide, Winamp
 winamp_hidden = True
}
Else
{
 Run, "Winamp"
 WinShow, Winamp
 winamp_hidden = False
}
Return

; --------------------------------------------------
; Ctrl+v that allows pasting into a command prompt
; ctrl+v
; --------------------------------------------------
$^v::
IfWinActive, ahk_class ConsoleWindowClass
{
 SendInput, %clipboard%
 Return
}
SendInput, ^v
Return

; --------------------------------------------------
; Ctrl+Middle mouse button to easily double click
; ctrl+mbutton
; --------------------------------------------------
$^MButton:: SendInput, {LBUTTON}{LBUTTON}

; --------------------------------------------------
; Set default state of lock keys
; --------------------------------------------------
SetCapsLockState, off
SetNumLockState, on
SetScrollLockState, off

; --------------------------------------------------
; Disable caps lock / scroll lock ftw
; --------------------------------------------------
$ScrollLock::Return
^$ScrollLock::Return
^+$ScrollLock::Return
^!$ScrollLock::Return
^!+$ScrollLock::Return
+$ScrollLock::Return
+!$ScrollLock::Return
!$ScrollLock::Return
$CapsLock::Return
^$CapsLock::Return
^+$CapsLock::Return
^!$CapsLock::Return
^!+$CapsLock::Return
+$CapsLock::Return
+!$CapsLock::Return
!$CapsLock::Return

; --------------------------------------------------
; Remap extra mouse button 1 to middle mouse button
; --------------------------------------------------
XButton1::MButton

; --------------------------------------------------
;~LControl & WheelUp::
;SendInput, {CTRLDOWN}{ALTDOWN}{SHIFTDOWN}b{CTRLUP}{ALTUP}{SHIFTUP}
;Return
;~LControl & WheelDown::
;SendInput, {CTRLDOWN}{ALTDOWN}{SHIFTDOWN}f{CTRLUP}{ALTUP}{SHIFTUP}
;Return
; --------------------------------------------------
