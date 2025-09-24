
ids := WinGetList(,, "Program Manager")
win_opts := []
win_info := []

for id in ids {
    win_pname := WinGetProcessName(id)
    win_title := WinGetTitle(id)
    win_text := WinGetText(id)
    win_opts.Push(win_pname " | " win_title " | " win_text)
    win_info.Push({
        id: id,
        process_name: win_pname,
        title: win_title,
        text: win_text
    })
}

; build gui
mygui := Gui()

mygui.AddText(,"Chose your target window from the list:")
mygui.AddDropDownList("vWin w400 AltSubmit", win_opts)

mygui.AddText(,"Text:")
mygui.Add("Edit", "r9 vText w400")

submit_btn := mygui.AddButton("Default", "Submit")

submit_btn.OnEvent("Click", (*) => Button_FillInformation(mygui, win_info))
Button_FillInformation(mygui, win_info) {
    data := mygui.Submit()
    win := win_info[data.Win]

    ; activate the selected window
    WinActivate("ahk_id " win.id)
    WinWaitActive("ahk_id " win.id)

    ; send the text to the active window
    Send(data.Text)

    ExitApp()
}

mygui.Show()