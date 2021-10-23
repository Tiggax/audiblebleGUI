import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtWebEngine 1.8
import QtWebChannel 1.0

Dialog {
    property alias captchaUrl: captchaImage.url
    property alias fieldText: fieldy.text
    id: dialog
    width: 400
    height: 300

    Rectangle {
        id: filler
        anchors.fill: parent
        WebEngineView {
            id: captchaImage
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: fieldy.top
            anchors.bottomMargin: -1
        }
        TextField {
            id:fieldy
            height: 30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: weby.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 0

        }
    }
    standardButtons: StandardButton.Apply | StandardButton.Abort

}
