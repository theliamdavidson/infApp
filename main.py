# This Python file uses the following encoding: utf-8

import sys

from PySide6.QtCore import QObject, Signal, QUrl, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

arteryList = ["Right subclavian", "Right Brachial",
              "Right Proximal Radial", "Right Proximal Ulnar ",
              "Right Distal Radial", "Right Distal Ulnar",
              "Right 1st", "Right 2nd", "Right 3rd", "Right 4th",
              "Left subclavian", "Left Brachial", "Left Proximal Radial",
              " Left Proximal Ulnar", "Left Distal radial",
              "Left Distal Ulnar", "Left 1st", "Left 2nd", "Left 3rd",
              "Left 4th", "Right u Sciatic", "Right M Sciatic",
              "Right L sciatic", " Right Proximal Pero ", "Right Inter Pero",
              "Right Low Pero", "Right Proximal tib", "Right inter tib",
              "Right low tib", "Right Calc", "Right Med arch",
              "Right Lat arch", "Right MT cutanesou", "Right 1ST", "Right 2ND",
              "Right 3RD", "Right 4th", "Left u Sciatic", "Left M Sciatic",
              "Left L sciatic", "Left Proximal Pero", "Left Inter Pero",
              "Left Low Pero", "Left Proximal tib", "Left inter tib",
              "Left low tib", "Left Calc", "Left Med arch", "Left Lat arch",
              "Left MT cutanesou", "Left 1ST", "Left 2ND", "Left 3RD",
              "Left 4th", "Right Interm ulnar", "Right Interm Radial",
              "Left Interm Ulnar", "Left Interm Radial", "Left EI",
              "Lower Aorta", "Upper Aorta", "Right EI", "Intermim Aorta",
              "Intermed LEI", "Intermed REI", "Lower LEI", "Lower REI"]
currentArtery = 0


class Main(QObject):
    def __init__(self):
        QObject.__init__(self)

    def keyPressEvent(self, event):
        if type(event) == QtGui.QKeyEvent:
            if event.key() == QtCore.Qt.Key_Space:
                self.emit(QtCore.SIGNAL('MYSIGNAL'))



if __name__ == '__main__':
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    main = Main()
    engine.rootContext().setContextProperty("main", main)

    engine.load(QUrl.fromLocalFile('main.qml'))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
