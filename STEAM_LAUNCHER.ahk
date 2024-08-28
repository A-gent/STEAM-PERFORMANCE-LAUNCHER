#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Ignore

; msgbox % "my ahk version: " A_AhkVersion
; Return

GLOBAL STEAMDIRECTORY := "C:\Program Files (x86)\Steam"
GLOBAL STEAMEXE := "steam.exe"

GLOBAL STEAMSTRING := STEAMDIRECTORY . "\" . STEAMEXE



IniRead, aSTEAMLAUNCHDELAY, config.cfg, DELAYS, SteamDelay, 10000
GLOBAL STEAMLAUNCHDELAY := aSTEAMLAUNCHDELAY

IniRead, aDoDebugMessage, config.cfg, DEBUG, DebugMessages, 1
GLOBAL DoDebugMessage := aDoDebugMessage



IniRead, aEnableBreakpad, config.cfg, SWITCHES, EnableBreakpad, 0
GLOBAL EnableBreakpad := aEnableBreakpad

IniRead, aWhiteLionFix, config.cfg, SWITCHES, WhiteLionMacFix, 1
GLOBAL WhiteLionFix := aWhiteLionFix

IniRead, aLaunchMethod, config.cfg, LAUNCH, LaunchMethod, BrowserProtocol
GLOBAL LaunchMethod := aLaunchMethod

If(LaunchMethod="Commandline" or LaunchMethod="BrowserProtocol")
{
    ; MsgBox, 4096, STEAM MINIMAL STARTUP, LaunchMethod 'Commandline' OR 'BrowserProtocol'
}
Else
{
    MsgBox, 4096, STEAM MINIMAL STARTUP, LaunchMethod was improperly defined in the config file. `n`n`n   The only two acceptable values are: `n`n   Commandline   OR   BrowserProtocol `n`n`nPlease edit the config file and change the LaunchMethod. `n`nThe Launcher will now exit after this messagebox is dismissed.
    ExitApp
}
If(LaunchMethod="Commandline" 
{
    GLOBAL Method := "2"
}
If(LaunchMethod="BrowserProtocol")
{
    GLOBAL Method := "1"
}
If(LaunchMethod="")
{
    GLOBAL Method := "1"
}



StartSteamFirstBecauseFuckYouMacOkayNo:
I(Method="1")
{
If(WhiteLionFix="1")
    {

            Run, %STEAMSTRING%
            Process, Wait, Steam.exe

        If(DoDebugMessage="1")
        {
            MsgBox, 4096, STEAM MINIMAL STARTUP, DEBUG CONFIG FILE DELAY: %STEAMLAUNCHDELAY%, 15
        }



        Sleep, %STEAMLAUNCHDELAY%

        If(DoDebugMessage="1")
        {
            MsgBox, 4096, STEAM MINIMAL STARTUP, WAITING DELAY COMPLETED, 15
            Sleep, 4000
            ; SetTimer, SteamMinimalLaunchMsg, -500
        }


            Run, steam://open/minigameslist
    }
    Else
    {
        Run, steam://open/minigameslist
    }
}

I(Method="2")
{
    If(EnableBreakpad="1")
    {
        Run, %A_ScriptDir%\steam_minimal_commandline.bat
    }
    Else
    {
        Run, %A_ScriptDir%\steam_minimal_commandline-nobreakpad.bat
    }
}

Return
; ExitApp



; SteamMinimalLaunchMsg:
; MsgBox, 4096, STEAM MINIMAL LAUNCHER, WAITING DELAY COMPLETED, 15
; Sleep, 4000
; Return