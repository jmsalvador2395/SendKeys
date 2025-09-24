# Overview
This is a simple program written in AutoHotkey to select a window and send keystrokes.

# Usage
Run the program, select the window you wish to send your keystrokes to and enter the keys you want to send in the "Text" field (refer to `Sending Special Keys` section for sending strokes like `Tab` or `PgDn`).

# Convert to .exe
Download AutoHotkey from the [website](https://www.autohotkey.com/). After opening the program, you will see an option to "Compile". Select this option, set "Source (script file)" to `send_keys.ahk`, and then convert.

# Sending Special Keys
* Refer to the [this page](https://www.autohotkey.com/docs/v2/lib/Send.htm) for details on the formats for sending specific keys. 
For example, putting `{Tab}` in the text field will simulate a tab press and `{Alt}` will simulate an alt key press