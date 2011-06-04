; --------------------------------------------------
; $ Remap
; # Windows key
; ^ Control
; ! Alt
; + Shift
; --------------------------------------------------

; --------------------------------------------------
#NoTrayIcon
#SingleInstance, force
#WinActivateForce

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
; Create new folder
; winkey+n
; --------------------------------------------------
#n::Send, {AppsKey}wf

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
Run, "C:\Program Files\SmartFTP Client\SmartFTP.exe"
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
; alt+~
; --------------------------------------------------
!`::
If WinExist("ahk_class BaseWindow_RootWnd")
{
 If WinActive("ahk_class BaseWindow_RootWnd")
 {
  WinSet, Transparent, 1, ahk_class Winamp v1.x
  WinMinimize, ahk_class Winamp v1.x
 }
 Else
 {
  WinSet, Transparent, 255, ahk_class Winamp v1.x
  WinActivate, ahk_class Winamp v1.x
 }
}
Else
{
 Run, "Winamp"
}
Return

; --------------------------------------------------
; Start / show / hide X-Chat
; ctrl+~
; --------------------------------------------------
^`::
If WinExist("ahk_class gdkWindowToplevel")
{
 If WinActive("ahk_class gdkWindowToplevel")
 {
  WinClose, ahk_class gdkWindowToplevel
 }
 Else
 {
  WinShow, ahk_class gdkWindowToplevel
  WinSet, Transparent, 245, ahk_class gdkWindowToplevel
  WinActivate, ahk_class gdkWindowToplevel
 }
}
Else
{
 Run, "C:\Program Files\XChat-WDK\xchat.exe"
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
; Volume Up / Down using Ctrl+Shift+Mouse Wheel
; ctrl+shift+mousewheelup/down
; --------------------------------------------------
^+WheelUp::
Send, {Volume_Up}
Return
^+WheelDown::
Send, {Volume_Down}
Return
; --------------------------------------------------

; --------------------------------------------------
; Remap extra mouse button 1 to middle mouse button
; --------------------------------------------------
XButton1::MButton

; --------------------------------------------------
; Close windows explorer window (if active) or
; minimize xchat or winamp if active
; Esc
; --------------------------------------------------
$Esc::
SendInput, {Esc}
If (GetKeyState("LButton") or GetKeyState("RButton")  or GetKeyState("MButton"))
{
  Return
}
IfWinActive, ahk_class CabinetWClass
{
 WinKill
 Return
}
Else IfWinActive, ahk_class ytWindow
{
 WinHide, ahk_class ytWindow
 WinMinimize, ahk_class ytWindow
 WinKill
 Return
}
Else IfWinActive, ahk_class gdkWindowToplevel
{
 WinClose, ahk_class gdkWindowToplevel
 Return
}
Else If WinActive("ahk_class BaseWindow_RootWnd")
{
 WinHide, ahk_class Winamp v1.x
 WinMinimize, ahk_class Winamp v1.x
 Return
}
Return

; --------------------------------------------------
;~LControl & WheelUp::
;SendInput, {CTRLDOWN}{ALTDOWN}{SHIFTDOWN}b{CTRLUP}{ALTUP}{SHIFTUP}
;Return
;~LControl & WheelDown::
;SendInput, {CTRLDOWN}{ALTDOWN}{SHIFTDOWN}f{CTRLUP}{ALTUP}{SHIFTUP}
;Return
; --------------------------------------------------
