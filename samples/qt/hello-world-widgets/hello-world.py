import sys
from PySide2.QtWidgets import QMainWindow, QApplication, QTreeView
from PySide2.QtGui import QStandardItemModel, QStandardItem
from PySide2.QtCore import Qt
from ui_mainwindow import Ui_MainWindow


class MainWindow(QMainWindow):

    def __init__(self):
        super(MainWindow, self).__init__()

        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)

        self.ui.helloButton.clicked.connect(self.hello)

    def hello(self):
        self.ui.helloLabel.setText("Hello Qt World!!!!")


if __name__ == "__main__":

    app = QApplication(sys.argv)

    window = MainWindow()

    window.show()

    sys.exit(app.exec_())
