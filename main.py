# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

import audible
import webbrowser

#sys.path.append("qml/controls")
#import CaptchaDialog.qml

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from PySide2 import QtCore, QtWidgets, QtGui
from PySide6.QtWidgets import QInputDialog,QDialog
from PySide2.QtWidgets import QWidget

#import qml/main.qml
sys.path.append("qml")




# TODO passi čez Qobject od MainWindow za QInputDialog
#def getCaptcha(self):
#    print(url)
#    text, result = QInputDialog.getText(self,"input","Enter captcha: ")
#    if result == True:
#        self.text_name.setText(str(text))
    # MainWindow.captchaCode.emit(url)
def getCaptcha(url):
    print(url)
    ne = QInputDialog()
    ne.open()




#TODO nekak je treba da captcha_callback k pošlje url captche dobi return kode k jo vidiš, sam skos nadaljuje z pošiljanjem....
class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    captchaCode = Signal(str)
        # TODO nekak initialzas dialog
    #Signal set vars
    @Slot(str,str,str)
    def createLoginFile(self, user, psw, loc):
        print(user)
        auth = audible.Authenticator.from_login(
            user,
            psw,
            locale=loc, ## amazon.de == "de", amazon.com == us, ...
            with_username=False,
            register=True,
            captcha_callback= getCaptcha)

         # auth.to_file("login", encryption=False)



if __name__ == "__main__":

    # get data

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    #Get Backend/ Context
    main = MainWindow()
    engine.rootContext().setContextProperty("backend", main)
    #Load QML file
    engine.load(os.fspath(Path(__file__).resolve().parent / "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
