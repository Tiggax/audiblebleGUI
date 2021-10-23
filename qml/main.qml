import QtQuick 2.14
import QtQuick.Window 2.14
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import "controls"
import "pages"


Window {

    id: mainwindow
    width: 1280
    height: 720
    visible: true
    title: qsTr("Audibleble")

    Rectangle {
        id: container
        color: "#002879"
        anchors.fill: parent

        LeftMenubtn {
            id: leftMenubtn
            x: 0
            y: 0
            clip: false
            colorMouseOver: "#114efb"
            imgSource: "../images/svq_images/menu.svg"
            colorDefault: "#00007f"
            textContent: "Menu"

            Connections {
                target: leftMenubtn
                onClicked: animationMenu.running = true

            }
        }

        Rectangle {
            id: menu
            height: 40
            color: "#002879"
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.top: parent.top
            clip: true
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.leftMargin: 0


        }

        Rectangle {
            id: leftMenu
            width: 50
            height: 480
            color: "#002879"
            anchors.left: parent.left
            anchors.top: leftMenubtn.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            PropertyAnimation{
                id: animationMenu
                target: leftMenu
                property: "width"
                to: if(leftMenu.width == 50){
                        return 120
                    }else {
                        return 50
                    }
                duration: 300
                easing.type: Easing.InOutQuint

            }

            Column {
                id: column
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                clip: true
                anchors.bottomMargin: 45
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 10

                LeftMenubtn {
                    id: libBtn
                    colorMouseOver: "#114efb"
                    textContent: "Knjižnica"
                    imgSource: "../images/svq_images/inbox.svg"
                    colorDefault: "#00007f"
                    onClicked: {
                        libBtn.isSelected = true
                        storeBtn.isSelected = false
                        settBtn.isSelected = false

                        stackContainer.push(Qt.resolvedUrl("pages/LibraryPage.qml"))
                               }


                }

                LeftMenubtn {
                    id: storeBtn
                    anchors.top: libBtn.bottom
                    clip: false
                    colorMouseOver: "#114efb"
                    textContent: "Trgovina"
                    imgSource: "../images/svq_images/cart.svg"
                    colorDefault: "#00007f"
                    anchors.topMargin: 5
                    onClicked: {
                        libBtn.isSelected = false
                        storeBtn.isSelected = true
                        settBtn.isSelected = false

                        stackContainer.push(Qt.resolvedUrl("pages/StorePage.qml"))
                               }
                }

                LeftMenubtn {
                    id: settBtn
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    colorMouseOver: "#114efb"
                    textContent: "Nastavitve"
                    imgSource: "../images/svq_images/settings.svg"
                    colorDefault: "#00007f"
                    onClicked: {
                        libBtn.isSelected = false
                        storeBtn.isSelected = false
                        settBtn.isSelected = true

                        stackContainer.push(Qt.resolvedUrl("pages/SettingsPage.qml"))
                               }
                }

            }
        }

        Rectangle {
            id: appContainer
            width: 200
            height: 200
            color: "#002e8a"
            anchors.left: leftMenu.right
            anchors.right: parent.right
            anchors.top: menu.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            StackView {
                id: stackContainer
                anchors.fill: parent
                clip: true
                initialItem: Qt.resolvedUrl("pages/LibraryPage.qml")
            }
        }


    }
    CaptchaDialog {
        id: captchaDlg


    }

}



