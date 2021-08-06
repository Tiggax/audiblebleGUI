import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    Rectangle {
        id: backgroundStorePage
        color: "#285dca"
        anchors.fill: parent

        Text {
            id: text1
            x: 8
            y: 8
            text: qsTr("store")
            font.pixelSize: 12
        }
    }

}
