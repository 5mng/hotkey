Coordmode "Mouse"
MonitorCount := MonitorGetCount()

MouseGetPos &xpos, &ypos 
;MsgBox "The cursor is at X" xpos " Y" ypos
if(MonitorCount>=2){
    ;next monitor to switch
    Next_Monitor_Index := 1
   Loop MonitorCount
    {
        MonitorGet A_Index, &L, &T, &R, &B
        ;if mouse in the monitor
        if(xpos>=L && xpos<=R && ypos>=T && ypos<=B){
            if(A_Index<MonitorCount){
                Next_Monitor_Index :=A_Index+1
            }
            MonitorGet Next_Monitor_Index, &L1, &T1, &R1, &B1
            ;move mouse to next monitor (center?)
            MouseMove (L1+R1)/2, (T1+B1)/2
            break
	}
    }
}
MouseGetPos(&MouseX, &MouseY, &WinHandle)

; active window where mouse point at
if WinHandle {
    WinActivate(WinHandle)
}