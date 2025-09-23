
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

mygui.AddText(,"Subjective:")
mygui.Add("Edit", "r9 vSubjective w400")

mygui.AddText(,"Objective:")
mygui.Add("Edit", "r9 vObjective w400")

mygui.AddText(,"Assessment:")
mygui.Add("Edit", "r9 vAssessment w400")

mygui.AddText(,"Plan:")
mygui.Add("Edit", "r9 vPlan w400")

submit_btn := mygui.AddButton("Default", "Submit")
cancel_btn := mygui.AddButton("Default", "Cancel")

; submit_btn.OnEvent("Click", Button_FillInformation)
submit_btn.OnEvent("Click", (*) => Button_FillInformation(mygui, win_info))
Button_FillInformation(mygui, win_info) {
    data := mygui.Submit()
    win := win_info[data.Win]
    ; WinActivate(win.title, win.text)
    WinActivate("ahk_id " win.id)
    WinWaitActive("ahk_id " win.id)
    Send("{Tab}")
    Send(data.Subjective)
    Send("{Tab}")
    Send(data.Objective)
    Send("{Tab}")
    Send(data.Assessment)
    Send("{Tab}")
    Send(data.Plan)
    ExitApp()
}

cancel_btn.OnEvent("Click", (*) => Button_Cancel())
Button_Cancel() {
    ExitApp()
}


mygui.Show()

; ExitApp