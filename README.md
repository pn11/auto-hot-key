# Auto Hot Key 設定

- [karakaram/auto-hot-key](https://github.com/karakaram/auto-hot-key)

をフォークして自分用にカスタマイズした。

## 変更点

- [karakaram/alt-ime-ahk](https://github.com/karakaram/alt-ime-ahk) から `IME.ahk`, `alt-ime-ahk.ahk` をコピー。
- 無効化するアプリ追加。
    - IDE など、独自の方法で Emacs キーバインドにできるアプリでは無効化する。
        - ターミナルアプリ、VScode, PyCharm, IntelliJ IDEA など。
        - Eclipse はウィンドウを判定する術がみつからなかったので無効化していない。(`if WinActive("ahk_exe javaw.exe")` のようにすると Java に関係ないはずのものまで動かなくなる？)
        - Boostenote は CodeMirror 由来の Emacs mode があるが、yank とクリップボードが共有されないため不便なので、無効化していない。
- `IfWinActive,ahk_class` のような書き方は AHK のドキュメントで deprecated となっていたので、`if WinActive()` のような書き方に変えた。
- `as-mac-jis.ahk` は CapsLock を Ctrl に割り当てるのではなく、CapsLock+何かのキーだと Emacs/Unix-Like な動きになり、Ctrl キーは Windows-Like に使えるようにしてある (C-c でコピーなど)。Mac の Ctrl と Cmd の使い心地に少し近づいた。
    - 上記の「無効化するアプリ」上では CapsLock は Ctrl として動作する。

## 使い方

- `as-mac-jis.ahk` か `as-mac-us.ahk` を AutoHotKey でコンパイルして、スタートアップフォルダにショートカットを置く。(Win+R して `shell:startup` と入力すると開く。)
- コンパイルは AutoHotKey のコンテキストメニューをインストールしていれば右クリックからいけるが、コマンドラインでやる例は `compile.bat`
- スタートアップフォルダは `open_startup_folder.bat` のように開ける。
- 無変換を左alt、変換、カタカナを右alt に割り当てるには ChgKey を使う。


## Reference

- [AutoHotkeyでMac USキーボード完全互換を目指す](https://qiita.com/maoutokagura/items/7b64b17783a29f63b2c6)
- [GitHub - karakaram/alt-ime-ahk](https://github.com/karakaram/alt-ime-ahk)
- [WindowsでHHKB Professional2をMac風に使うための設定 – karakaram-blog](https://www.karakaram.com/hhkb-pro2-windows-customize)
- [WindowsでHHKB(US配列)を使ってMac風のキー操作を行う](https://qiita.com/Rozsa777/items/ef75a827979a0240d2d4)
- [ウィンドウ指定の方法 - AutoHotkey Wiki](http://ahkwiki.net/Window#Window_Spy_.E3.82.92.E5.88.A9.E7.94.A8.E3.81.97.E3.81.A6.E8.AA.BF.E6.9F.BB.E3.82.92.E8.A1.8C.E3.81.86)
- [WinActive() / IfWinActive - Syntax & Usage | AutoHotkey](https://autohotkey.com/docs/commands/WinActive.htm)
- [WinTitle & Last Found Window | AutoHotkey](https://autohotkey.com/docs/misc/WinTitle.htm)
- [AutoHotkeyにおけるラベルの優先度と3キー同時押しの定義 - 情報科学屋さんを目指す人のメモ（FC2ブログ版）](http://did2.blog64.fc2.com/blog-entry-371.html)
