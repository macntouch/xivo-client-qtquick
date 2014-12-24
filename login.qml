import QtQuick 2.0

Rectangle {
    id: loginwindow

    height: 500
    width: 360

    Rectangle {
        id: top
        width: parent.width
        height: 170
        color: "#2c2927"

        Image {
            id: logo

            anchors.centerIn: parent
            source: "content/images/logo.svg"
            sourceSize: Qt.size(234, 97)
            visible: true
        }

    }

    Rectangle {
        id: body
        width: parent.width
        height: loginwindow.height - top.height
        anchors.top: top.bottom
    }
}
