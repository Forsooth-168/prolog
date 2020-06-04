open System
open System.Windows.Forms
open System.Drawing

//Создание формы
let form = new Form(Width = 500, Height = 500, Text = "IZ 11, var 6", StartPosition = FormStartPosition.CenterScreen)

//Создание скроллбара
let scroll_bar = new TrackBar(Maximum = 400, Minimum = 50, Value = 50, Location = new Point(50, 20), Width = 400)
 
//Создание кнопки
let button = new Button(Width = scroll_bar.Value, Height = 30, Text = "Button", Location = new Point(form.Width / 2 - scroll_bar.Value/2, form.Height/2 - 15))

//Обработчик события для скроллбара
let scroll_bar_ValueChanged _ = 
    button.Width <- scroll_bar.Value
    button.Location <- new Point(form.Width / 2 - scroll_bar.Value/2, form.Height/2 - 15)

let _ =  scroll_bar.ValueChanged.Add(scroll_bar_ValueChanged)

//Добавление элементов управления на форму
form.Controls.Add(scroll_bar) 
form.Controls.Add(button)

do Application.Run(form)
