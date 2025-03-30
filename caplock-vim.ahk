#Requires AutoHotkey v2.0
#UseHook
#SingleInstance force

InstallKeybdHook()

SendMode "Input"

SetCapsLockState("AlwaysOff")

global CapslockIsDown := false
global AnotherKeyPressed := false

SetTimer(HandleCapslock, 50)

HandleCapslock() {
    global CapslockIsDown, AnotherKeyPressed

    if (!CapslockIsDown && GetKeyState("Capslock", "P")) {
        CapslockIsDown := true
        AnotherKeyPressed := false
        Send("{Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}")
    } else if (CapslockIsDown && !GetKeyState("Capslock", "P")) {
        CapslockIsDown := false
        Send("{Ctrl Up}{Shift Up}{Alt Up}{LWin Up}")
        if (!AnotherKeyPressed) {
            Send("{Esc}")
        }
        AnotherKeyPressed := false
    }
}

; Hotkey functions to set AnotherKeyPressed
Hotkey "~Capslock & h", SendLeft
Hotkey "~Capslock & l", SendRight
Hotkey "~Capslock & k", SendUp
Hotkey "~Capslock & j", SendDown
Hotkey "~Capslock & c", SendCtrlC
Hotkey "~Capslock & v", SendCtrlV
Hotkey "~Capslock & a", SendCtrlA
Hotkey "~Capslock & s", SendCtrlS
Hotkey "~Capslock & w", SendCtrlW
Hotkey "~Capslock & x", SendCtrlX
Hotkey "~Capslock & e", SendWinCtrlE
Hotkey "~Capslock & q", SendWinCtrlQ
Hotkey "~Capslock & t", SendCtrlT

SendLeft(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("{Left}")
}

SendRight(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("{Right}")
}

SendUp(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("{Up}")
}

SendDown(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("{Down}")
}

SendCtrlA(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^a")
}

SendCtrlS(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^s")
}
SendCtrlC(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^c")
}

SendCtrlT(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^t")
}

SendCtrlV(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^v")
}

SendCtrlW(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^w")
}

SendCtrlX(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("^x")
}

SendWinCtrlE(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("#^{Right}")
}

SendWinCtrlQ(ThisHotkey) {
    global AnotherKeyPressed := true
    Send("#^{Left}")
}
