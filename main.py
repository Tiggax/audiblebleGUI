# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    #Signal set vars
    getName = Signal(str)
    #Signal set functions
    @Slot(str)
    def welcomeText(self, name):
        self.getName.emit("Welcome, " + name)


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
