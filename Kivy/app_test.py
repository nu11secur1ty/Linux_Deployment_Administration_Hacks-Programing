import kivy
kivy.require('1.10.1') # replace with your current kivy version !
from kivy.app import App
from kivy.uix.label import Label

class TaratorApp(App):

    def build(self):
        return Label(text='Some text here :)')
if __name__ == '__main__':
    TaratorApp().run()
