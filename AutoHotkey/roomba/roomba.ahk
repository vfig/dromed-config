/*  Roomba: Make changing Roombrush Archetypes rather more convenient.
    Created by vfig, 10 Jan. 2024. Do with it as you will.

    The idea is you will be batch-changing a number of room brushes all to 
    the same archetype.

FIRST TIME SETUP:

    Before using this script for the first time, you must ensure it knows how
    to find the room brush "Create" button in your Dromed setup. Select a room
    brush, and take a screenshot of your Dromed window. Crop the screenshot
    down to just the room brush "Create" button (that is immediately above
    "Edit" and "Links"). Save this screenshot as "roomba_create.png" in the
    same folder as this script.

USING THIS SCRIPT:

    First, you must select the target Room archetype. Open the Rooms hierarchy,
    select the target archetype, and press Ctrl + N. This choice will be
    remembered as long as the script remains active in AutoHotkey's tray icon.

    Then, select a room brush. Press Ctrl + B to change its archetype to your
    chosen target. Repeat with the next room brush, and so on.

    Additionally, with a room brush selected, you can press Ctrl + Shift + B
    to open the Rooms hierarchy dialog in Create mode, without changing the
    selected room brush. This is if you wish to manually choose a different
    archetype to change this brush to, instead of the previously chosen one.
*/
#SingleInstance Force

#include "RemoteTreeView.ahk"

SetTitleMatchMode "RegEx"

Log(args*) {
    message := ""
    for arg in args {
        message .= " " . arg
    }
    OutputDebug "ROOMBA:" . message
}

PlayOKSound() {
    SoundPlay "tick1.wav", 0
}

PlayErrorSound() {
    SoundPlay "*-1", 0
}

LoadButtonPicture(filename, &width, &height) {
    hBitmap := LoadPicture(filename)
    structBITMAP := Buffer(A_PtrSize==4?24:32, 0)
    result := DllCall("gdi32\GetObject", "Ptr",hBitmap, "Int",structBITMAP.Size, "Ptr",structBITMAP, "Int")
    width := NumGet(structBITMAP, 4, "Int")
    height := NumGet(structBITMAP, 8, "Int")
    return hBitmap
}

FindButton(handle, &x, &y) {
    WinGetClientPos &clientX, &clientY, &clientW, &clientH
    ; Only search the lower-left eighth of the client area
    x1 := 0
    y1 := Floor(0.75 * clientH)
    x2 := Floor(0.5 * clientW)
    y2 := clientH
    return ImageSearch(&x, &y, x1, y1, x2, y2, "HBITMAP:" handle)
}

CenterMouse() {
    WinGetClientPos &clientX, &clientY, &clientW, &clientH
    MouseMove Round(0.5*clientW), Round(0.5*clientH), 0
}

DoRoomCreate() {
    /* The 'Create' button changes appearance (because of highlight and
       mouse cursor) when the mouse is over it. So to robustly find the
       button, we need the mouse to *not* be over it first.

       So we center the mouse before searching; if we don't find the
       button, we restore the original mouse position.
    */
    MouseGetPos &mouseX, &mouseY
    CenterMouse()
    btnHandle := LoadButtonPicture("roomba_create.png", &btnW, &btnH)
    found := FindButton(btnHandle, &btnX, &btnY)
    if (found) {
        x := btnX+Round(0.5*btnW)
        y := btnY+Round(0.5*btnH)
        MouseClick "Left", x, y
        Sleep 50
        MouseMove mouseX-x, mouseY-y,,"R"
    } else {
        MouseMove mouseX, mouseY
    }
    return found
}

GetRoomControls(&tree, &createButton, &closeButton) {
    tree := 0
    createButton := 0
    closeButton := 0
    typeCombo := 0
    For hwnd in WinGetControlsHwnd() {
        classNN := ControlGetClassNN(hwnd)
        if (SubStr(classNN, 1, 8)=="ComboBox") {
            typeCombo := hwnd
        } else if (SubStr(classNN, 1, 11)=="SysTreeView") {
            tree := hwnd
        } else if (ControlGetText(hwnd)=="&Create") {
            createButton := hwnd
        } else if (ControlGetText(hwnd)=="Close") {
            closeButton := hwnd
        }
    }
    if (typeCombo==0 || tree==0 || createButton==0 || closeButton==0
            || ControlGetText(typeCombo) != "Rooms") {
        return False
    } else {
        return True
    }
}

g_SelectedRoomArchetype := ""

ChangeRoomBrushArchetype(automatic := True) {
    global g_SelectedRoomArchetype
    if (automatic && g_SelectedRoomArchetype=="") {
        Log "no archetype selected"
        PlayErrorSound
        MsgBox "You must select the Room archetype to apply!`r`n`r`nOpen the Rooms hierarchy, select the archetype you want, and press Ctrl+N. Then try this again."
        return
    }
    if (! DoRoomCreate()) {
        Log "cannot find room Create button"
        PlayErrorSound
        MsgBox "Couldn't find the room Create button. Please update 'roomba_create.png'"
        return
    }
    roomWindow := WinWait("Room Hierarchy",,0.5)
    if (! GetRoomControls(&roomsTreeHwnd, &createButton, &closeButton)) {
        Log "failed to find tree view or Rooms hierarchy"
        PlayErrorSound
        return
    }
    if (! automatic) {
        ; Let the user choose whatever archetype they want by hand now.
        return
    }
    roomsTree := RemoteTreeView(roomsTreeHwnd)
    hitem := roomsTree.GetHandleByText(g_SelectedRoomArchetype)
    if (hitem==0) {
        SetControlDelay -1
        ControlClick closeButton
        Log "failed to find active archetype"
        PlayErrorSound
        MsgBox "Couldn't find the archetype '" . g_SelectedRoomArchetype . "'! Please select a different one to apply."
        g_SelectedRoomArchetype := ""
        return
    }
    if (! roomsTree.SetSelection(hitem, false)) {
        Log "failed to select item"
        return
    }
    SetControlDelay -1
    ControlClick createButton
}

SelectArchetype() {
    global g_SelectedRoomArchetype
    if (! GetRoomControls(&roomsTreeHwnd, &createButton, &closeButton)) {
        Log "failed to find tree view or Rooms hierarchy"
        PlayErrorSound
        MsgBox "Select the Room archetype to use, and try again."
        return
    }
    roomsTree := RemoteTreeView(roomsTreeHwnd)
    hitem := roomsTree.GetSelection()
    if (hitem==0) {
        Log "no selection in tree view"
        PlayErrorSound
        MsgBox "Select the Room archetype to use, and try again."
        return
    }
    g_SelectedRoomArchetype := roomsTree.GetSelectionText()
    Log "Selected archetype:", g_SelectedRoomArchetype
    PlayOKSound
}

; ^Space::{
;     Log "---- Reloading ----"
;     Reload
; }

#HotIf WinActive("DromEd Final .*")

^b::{
    ChangeRoomBrushArchetype()
}

^+b::{
    ChangeRoomBrushArchetype(False)
}

#HotIf WinActive("(Object|Room) Hierarchy")

^n::{
    SelectArchetype()
}
