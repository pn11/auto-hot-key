; 左 Ctrl の動作を Mac 風にする AutoHotkey スクリプト
; JIS キーボード版
;
; AutoHotkey: v1.1.22.07
; Author:     karakaram   http://www.karakaram.com/hhkb-pro2-windows-customize

; https://github.com/karakaram/alt-ime-ahk
#Include ./alt-ime-ahk.ahk

#InstallKeybdHook
#UseHook

; Ctrl+F で検索とかはやりたいため、CapsLockを Emacs 用に使う。
; Shift 付きの動作は書き方が分からないのであとで。

; CapsLock の動作を Mac 風に
sc03A & a::switchKeyByWindow("{Home}", "^a")
;+<^a::switchKeyByWindow("+{Home}", "+^a")
sc03A & e::switchKeyByWindow("{End}", "^e")
;+<^e::switchKeyByWindow("+{End}", "+^e")
sc03A & f::switchKeyByWindow("{Right}", "^f")
;+<^f::switchKeyByWindow("+{Right}", "+^f")
sc03A & b::switchKeyByWindow("{Left}", "^b")
;+<^b::switchKeyByWindow("+{Left}", "+^b")
sc03A & p::switchKeyByWindow("{Up}", "^p")
;+<^p::switchKeyByWindow("+{Up}", "^+p")
sc03A & n::switchKeyByWindow("{Down}", "^n")
;+<^n::switchKeyByWindow("+{Down}", "+^n")
sc03A & o::switchKeyByWindow("{End}{Enter}", "^o")
sc03A & h::switchKeyByWindow("{Backspace}", "^h")
sc03A & d::switchKeyByWindow("{Delete}", "^d")
sc03A & k::switchKeyByWindow("+{End}{Delete}", "^k")
sc03A & v::switchKeyByWindow("{PgDn}", "^v")


sc03A & q::send ^{q}
sc03A & w::send ^{w}
sc03A & r::send ^{r}
sc03A & t::send ^{t}
sc03A & y::send ^{y}
sc03A & u::send ^{u}
sc03A & i::send ^{i}

sc03A & s::send ^{s}
sc03A & g::send ^{g}
sc03A & j::send ^{j}
sc03A & l::send ^{l}

sc03A & z::send ^{z}
sc03A & x::send ^{x}
sc03A & c::send ^{c}
sc03A & m::send ^{m}
sc03A & .::send ^{.}

;----------------------------------------------------------------
; Ctrl キーを送信する Window かどうかを判断する
;
; return   1:差し替えを無効にするウィンドウ
;          0:差し替えを有効にするウィンドウ
;----------------------------------------------------------------
isCtrlKeyWindow()
{
    ; GVim
;    IfWinActive,ahk_class Vim
;    {
;        return 1
;    }
    ; Poderosa
;    IfWinActive,ahk_class WindowsForms10.Window.8.app.0.20f9772
;    {
;        return 1
;    }
    ; Mingw, PowerShell
;    IfWinActive,ahk_class ConsoleWindowClass
;    {
;        return 1
;    }
    ; Tera Term
    if WinActive("ahk_class VTWin32")
    {
        return 1
    }
    ; Cygwin, Git-Bash, MSYS
    if WinActive("ahk_class mintty")
    {
        return 1
    }
    ; VScode
    if WinActive("ahk_exe Code.exe")
    {
        return 1
    }
    ; PowerShell
;    if WinActive("ahk_exe powershell.exe")
;    {
;        return 1
;    }
    ; PyCharm
    if WinActive("ahk_exe pycharm64.exe")
    {
        return 1
    }
    ; IntelliJ IDEA
    if WinActive("ahk_exe idea64.exe")
    {
        return 1
    }
    ; Hyper
    if WinActive("ahk_exe Hyper.exe")
    {
        return 1
    }
    ; Boostnote
    ; Boostnote は CodeMirror の Emacs mode があるが、
    ; Yank とクリップボードが共有されないため不便なので、
    ; AHK を使うことにする。
;    if WinActive("ahk_exe Boostnote.exe")
;    {
;        return 1
;    }
    Return 0
}

;----------------------------------------------------------------
; Window によって送信するキーを振り分ける
;
; defaultKey    デフォルトで送信するキー
; ctrlKey       Ctrlを送信するウィンドウのとき送信するキー
;----------------------------------------------------------------
switchKeyByWindow(defaultKey, ctrlKey)
{
    if (isCtrlKeyWindow())
    {
        Send,%ctrlKey%
    }
    else
    {
        Send,%defaultKey%
    }
    Return
}
