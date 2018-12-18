from kivy.app import App
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.label import Label
from kivy.uix.popup import Popup
from kivy.config import Config


Config.set("graphics", "resizable", 0)
Config.set("graphics", "width", 400)
Config.set("graphics", "height", 500)


class myLayout(BoxLayout):
    def __init__(self, **kwargs):
        super(myLayout, self).__init__(**kwargs)

        btn = Button(text="Click")
        btn.bind(on_press=self.clk)

        self.add_widget(btn)

    def clk(self, obj):

        popup = Popup(content=Label(text="Hello I am here ;)"))
        popup.open()


class ReminderApp(App):
    def build(self):
        mL = myLayout()
        return mL
if __name__ == "__main__":
    ReminderApp().run()
