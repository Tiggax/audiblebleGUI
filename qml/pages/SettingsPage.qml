import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtWebEngine 1.8
import QtWebChannel 1.0
import "../controls"

Item {
    Rectangle {
        id: backgroundSettingsPage
        color: "#285dca"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        GroupBox {
            id: loginBox
            width: 318
            height: 266
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 8
            anchors.topMargin: 8
            title: qsTr("Prijava")

            Label {
                id: userText
                text: qsTr("Uporabniško Ime :")
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.leftMargin: 0
            }

            TextField {
                id: userTextField
                height: 32
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: userText.bottom
                anchors.rightMargin: 5
                anchors.leftMargin: 0
                anchors.topMargin: 5
                placeholderText: qsTr("mojmejl@neki.com")
            }

            Label {
                id: passText
                text: qsTr("Geslo :")
                anchors.left: parent.left
                anchors.top: userTextField.bottom
                anchors.leftMargin: 0
                anchors.topMargin: 10
            }


            TextField {
                id: passTextField
                height: 32
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: passText.bottom
                anchors.rightMargin: 5
                anchors.leftMargin: 0
                anchors.topMargin: 5
                placeholderText: qsTr("********")
                echoMode: TextInput.Password
            }

            ComboBox {
                id: regionBox
                height: 32
                anchors.left: regionText.right
                anchors.right: parent.right
                anchors.top: passTextField.bottom
                currentIndex: 5
                anchors.rightMargin: 5
                font.pointSize: 8
                anchors.leftMargin: 6
                anchors.topMargin: 6
                textRole: "text"
                valueRole: "value"
                model: [
                    { value: "us" , text: "USA" },
                    { value: "ca" , text: "Canada" },
                    { value: "uk" , text: "UK and Ireland" },
                    { value: "au" , text: "Australia and New Zeland" },
                    { value: "fr" , text: "France, Belgium and Switzerland" },
                    { value: "de" , text: "Germany, Austria and Switzerland" },
                    { value: "jp" , text: "Japan" },
                    { value: "it" , text: "Italy" },
                    { value: "in" , text: "India" },
                    { value: "es" , text: "Spain" }
                ]

            }

            Label {
                id: regionText
                text: qsTr("Država :")
                anchors.left: parent.left
                anchors.top: passTextField.bottom
                anchors.leftMargin: 8
                anchors.topMargin: 12
            }

            Button {
                id: loginButton
                x: 111
                text: qsTr("Prijava")
                anchors.top: regionBox.bottom
                checkable: false
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    backend.createLoginFile(userTextField.text,passTextField.text,regionBox.currentValue)
                }
            }
        }

    }



//    RoundButton {
//        id: roundButton
//        x: 387
//        y: 63
//        text: "+"
//        onClicked: {
//            backend.openInput()
//        }

//    }
//    QtObject {
//    id: functions
//    function OpenDialogBox(url){

//    }
//    }




}







/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
