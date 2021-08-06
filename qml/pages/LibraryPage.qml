import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.3
import QtQuick.Layouts 1.3
import "../controls"

Item {
    Rectangle {
        id: backgroundLibraryPage
        color: "#285dca"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            color: "#a86c95e8"
            radius: 10
            anchors.fill: parent
            anchors.rightMargin: 5
            anchors.leftMargin: 5
            anchors.bottomMargin: 5
            anchors.topMargin: 5

            Text {
                id: text1
                x: 16
                y: 3
                text: qsTr("library")
                font.pixelSize: 12
            }
            BookItem{
                id: test
                x: 16
                y: 86
                loadingValue: 0
                isHere: false
                bookName: "Some obscurly long name that books might have"
                bookAuthor: "Jake Myers"

            }

            RoundButton {
                id: roundButton
                x: 224
                y: 265
                text: "+"
                onClicked: {
                    backend.welcomeText(test.bookAuthor)
                }
            }
        }
    }
    Connections {
        target: backend

        function onGetName(name){
            text1.text = name
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
