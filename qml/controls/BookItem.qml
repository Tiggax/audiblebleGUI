import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
Rectangle {
    id: rectangle
    x: 0
    y: 0
    width: 400
    height: 60
    color: "#ffffff"
    radius: 6
    border.color: "#002879"
    border.width: 2
    clip: true

    //Properties
    property alias bookName: bookNameText.text
    property alias bookAuthor: authorText.text
    property alias sourceImage: image.source
    property bool isHere: false
    property real loadingValue: 0


    Image {
        id: image
        x: 0
        y: 2
        width: 56
        height: 56
        anchors.left: parent.left
        anchors.top: parent.top
        source: "../../../../../Slike/k98_k99.jpg"
        autoTransform: false
        layer.smooth: false
        anchors.topMargin: 2
        anchors.leftMargin: 0
        clip: true
        sourceSize.height: 232
        sourceSize.width: 232
        fillMode: Image.PreserveAspectFit
        smooth: true
    }

    StackView {
        id: stackView
        x: 225
        y: 0
        anchors.left: image.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.rightMargin: 3
        anchors.leftMargin: 170
        initialItem: rectangle.isHere ? statusInLibrary : statusAvailable
    }

    Rectangle {
        id: imageborder
        color: "#00000000"
        radius: 6
        border.color: "#002879"
        border.width: 2
        anchors.left: image.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -56

        Rectangle {
            id: textContainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 60

            Text {
                id: authorText
                x: -144
                y: 18
                width: 164
                height: 17
                elide: Text.ElideNone
                anchors.left: parent.left
                anchors.top: bookNameText.bottom
                font.pixelSize: 10
                anchors.topMargin: 0
                anchors.leftMargin: 1
            }

            Text {
                id: bookNameText
                x: -144
                y: -21
                width: 164
                height: 39
                elide: Text.ElideNone
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 15
                lineHeightMode: Text.ProportionalHeight
                wrapMode: Text.Wrap
                textFormat: Text.AutoText
                padding: 0
                topPadding: 0
                fontSizeMode: Text.HorizontalFit
                anchors.topMargin: 2
                anchors.leftMargin: 1
            }
        }


    }
    Component {
        id: statusInLibrary
        Text {
            color: "#0de511"
            text: "V Knjižnici"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

        }
    }
    Component {
        id: statusAvailable
        Column {
            id: column
            anchors.fill: parent
            Text {
                color: "#000000"
                text: "Na voljo za prenos"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.horizontalCenterOffset: 10
                anchors.horizontalCenter: parent.horizontalCenter

            }
            Button {
                text: "Prenos"
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 20
                anchors.horizontalCenterOffset: 10
                anchors.bottomMargin: 8
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: try {

                           } catch(error) {
                               stackView.push(statusInLibrary)
                           } finally {
//                               stackView.push(statusLoading)
                           }
            }
        }
    }
    Component {
        id: statusLoading
        Column {
            anchors.fill: parent
            Text {
                color: "#000000"
                text: "Nalagam..."
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 5
            }
            ProgressBar {
                anchors.top: parent.top
                anchors.horizontalCenterOffset: 0
                anchors.topMargin: 35
                anchors.horizontalCenter: parent.horizontalCenter
                clip: true
                to: 1
                from: 0
                value: loadingValue
            }
        }
    }







}
/*##^##
Designer {
    D{i:0;formeditorZoom:2;height:60;width:400}
}
##^##*/
