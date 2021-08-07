import QtQuick 2.15
import QtQuick.Controls 2.15
import QtWebEngine 1.8
import QtWebChannel 1.0


Item {
    Rectangle {
        id: backgroundStorePage
        color: "#285dca"
        anchors.fill: parent

        WebEngineView {
            anchors.fill: parent
            zoomFactor: 1
            clip: true
            url: "https://www.audible.de/"

        }
    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
