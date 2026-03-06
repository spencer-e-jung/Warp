; Makes the mouse cursor follow window focus, but ONLY if the focus change
; wasn't caused by the mouse - e.g. Alt-Tab, Win+<Number>, hotkeys, ...
; Saves a lot of mousing around on multi-monitor setups!
#UseHook
#SingleInstance force

global lastActiveWindow := 0
global lastMouseClickTime := 0

; We have to register the window to receive global shell hook events.
DllCall("RegisterShellHookWindow", "Ptr", A_ScriptHwnd)
; The message number for the shell hook messages (undocumented).
global msgNum := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK")
OnMessage(msgNum, OnShellMessage)

OnShellMessage(wParam, lParam, msg, hwnd)
{
	global lastActiveWindow, lastMouseClickTime
    static HSHELL_WINDOWACTIVATED := 4
    static HSHELL_RUDEAPPACTIVATED := 32772
    
	if (wParam = HSHELL_WINDOWACTIVATED || wParam = HSHELL_RUDEAPPACTIVATED) {
        Sleep(100)
        hwnd := WinExist("A")

        if (!hwnd) {
            return
        }

        ; if the active window didn't change, don't move the mouse
        if (hwnd == lastActiveWindow) {
            return
        }

        lastActiveWindow := WinExist("A")

		; ignore when the mouse was used to change focus
        if (A_TickCount - lastMouseClickTime <= 500) {
            return
        }
        
        WinGetPos(&wx, &wy, &width, &height, "A")
        mx := Round(wx + width // 2)
        my := Round(wy + height // 2)
        DllCall("SetCursorPos", "Int", mx, "Int", my)
	}
}

*~LButton::
*~RButton::
*~MButton:: {
    global lastMouseClickTime
	lastMouseClickTime := A_TickCount
    return
}