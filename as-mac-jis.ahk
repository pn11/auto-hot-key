; �� Ctrl �̓���� Mac ���ɂ��� AutoHotkey �X�N���v�g
; JIS �L�[�{�[�h��
;
; AutoHotkey: v1.1.22.07
; Author:     karakaram   http://www.karakaram.com/hhkb-pro2-windows-customize

; https://github.com/karakaram/alt-ime-ahk
#Include ./alt-ime-ahk.ahk

#InstallKeybdHook
#UseHook

; Ctrl+F �Ō����Ƃ��͂�肽�����߁ACapsLock�� Emacs �p�Ɏg���B
; ����ȊO�� Ctrl-XXX �𑗐M����B
; ���O�A�v���̏ꍇ�� Ctrl-XXX �𑗐M�B
; Shift + CapsLock + XXX �ɂ��Ή��B

sc03A & a::
If GetKeyState("Shift", "P")
    switchKeyByWindow("+{Home}", "+^a")
Else
    switchKeyByWindow("{Home}", "^a")
Return

sc03A & e::
If GetKeyState("Shift", "P")
    switchKeyByWindow("+{End}", "+^e")
Else
    switchKeyByWindow("{End}", "^e")
Return

sc03A & f::
If GetKeyState("Shift", "P")
    switchKeyByWindow("+{Right}", "+^f")
Else
    switchKeyByWindow("{Right}", "^f")
Return

sc03A & b::
If GetKeyState("Shift", "P")
    switchKeyByWindow("+{Left}", "+^b")
Else
    switchKeyByWindow("{Left}", "^b")
Return

sc03A & p::
If GetKeyState("Shift", "P")
    switchKeyByWindow("+{Up}", "+^p")
Else
    switchKeyByWindow("{Up}", "^p")
Return

sc03A & n::
If GetKeyState("Shift", "P")
    switchKeyByWindow("+{Down}", "+^n")
Else
    switchKeyByWindow("{Down}", "^n")
Return

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

sc03A & Space::send ^{Space}

sc03A & Tab::
If GetKeyState("Shift", "P")
    send +^{Tab}
Else
    send ^{Tab}
Return

; Ctrl+` �� VS code �Ń^�[�~�i���\�����������A
; IME �Ɏ���Ă��܂��̂ł������������B
^sc029:: send {}

; CapsLock + `
sc03A & sc029::
If GetKeyState("Shift", "P")
    send +^{sc029}
Else
    send {}
Return

sc03A & 1::send ^{1}
sc03A & 2::send ^{2}
sc03A & 3::send ^{3}
sc03A & 4::send ^{4}
sc03A & 5::send ^{5}
sc03A & 6::send ^{6}
sc03A & 7::send ^{7}
sc03A & 8::send ^{8}
sc03A & 9::send ^{9}
sc03A & 0::send ^{0}

sc03A & -::
If GetKeyState("Shift", "P")
    send +^{-}
Else
    send ^{-}
Return

sc03A & =::
If GetKeyState("Shift", "P")
    send +^{=}
Else
    send ^{=}
Return


;----------------------------------------------------------------
; Ctrl �L�[�𑗐M���� Window ���ǂ����𔻒f����
;
; return   1:�����ւ��𖳌��ɂ���E�B���h�E
;          0:�����ւ���L���ɂ���E�B���h�E
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
    ; Boostnote �� CodeMirror �� Emacs mode �����邪�A
    ; Yank �ƃN���b�v�{�[�h�����L����Ȃ����ߕs�ւȂ̂ŁA
    ; AHK ���g�����Ƃɂ���B
;    if WinActive("ahk_exe Boostnote.exe")
;    {
;        return 1
;    }
    Return 0
}

;----------------------------------------------------------------
; Window �ɂ���đ��M����L�[��U�蕪����
;
; defaultKey    �f�t�H���g�ő��M����L�[
; ctrlKey       Ctrl�𑗐M����E�B���h�E�̂Ƃ����M����L�[
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
