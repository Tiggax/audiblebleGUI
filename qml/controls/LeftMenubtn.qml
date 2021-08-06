import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    id:menuButton

    implicitHeight: 40
    implicitWidth: 160

    //Properties


    property string textContent: "Text"
    property color colorDefault: "#00007f"
    property color colorMouseOver: "#06216c"
    property color colorPressed: "#021a5b"
    property bool isSelected: false

    property url imgSource:"qrc:/qtquickplugin/images/template_image.png"

    QtObject{
        id: internal

        property var dynamicColor: if(menuButton.down){
                                       menuButton.down ? colorPressed : colorDefault
                                   } else {
                                       menuButton.hovered ? colorMouseOver : colorDefault
                                   }
    }

        Rectangle {
            id: leftHighlight
            width: 8
            color: if(isSelected==true){
                       return "#00aaff"
                   } else {
                       return "#00000000"
                   }

            radius: 4
            border.width: 0
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
        }

        Image {
            id: menuImage
            source:imgSource
            sourceSize.height: 1000
            sourceSize.width: 1000
            x: 8
            y: 0
            width: 40
            height: 40
            anchors.left: leftHighlight.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0
            fillMode: Image.PreserveAspectFit
        }

        Label {
            id: menuLabel
            color: "#ffffff"
            text: textContent
            anchors.left: menuImage.right
            anchors.right: rightHighlight.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            styleColor: "#00000000"
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 5
            anchors.rightMargin: 0
        }

        background: Rectangle{
            color: internal.dynamicColor
            radius: 10
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:4;height:40;width:160}
}
##^##*/
