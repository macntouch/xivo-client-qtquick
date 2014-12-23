import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0
import QtGraphicalEffects 1.0

ApplicationWindow {
    id: container
    height: 1000
    width: 1000

    Rectangle {
        id: mainwindow
        height: container.height
        width: container.width
        state: "BODY_SHOWN"

        property int oldHeight: container.height

        states: [
            State {
                name: "BODY_SHOWN"
                PropertyChanges { target: hideButtonImageOverlay; rotation: 180 }
                PropertyChanges { target: container; height: mainwindow.oldHeight }
                PropertyChanges { target: body; height: parent.height }
            },
            State {
                name: "BODY_HIDDEN"
                PropertyChanges { target: hideButtonImageOverlay; rotation: 0 }
                PropertyChanges { target: body; height: 0 }
                PropertyChanges { target: container; height: identity.height + statusBar.height }
            }
        ]

        transitions: [
            Transition {
                to: "*"
                NumberAnimation { target: hideButtonImageOverlay; properties: "rotation"; duration: 100; easing.type: Easing.OutExpo }
                NumberAnimation { target: body; properties: "height"; duration: 100; easing.type: Easing.OutExpo }
                // NumberAnimation { target: container; properties: "height"; duration: 100; easing.type: Easing.OutExpo }
            }
        ]

        Rectangle {
            id: identity

            color: "#2c2927"
            width: parent.width
            height: 90
            z: 1

            Rectangle {
                id: hideButton
                x: parent.x + 15
                y: parent.y + 30
                width: hideButtonImage.width
                height: hideButtonImage.height
                color: "transparent"

                Image {
                    id: hideButtonImage

                    source: "/home/seb/data/specs/xivoclient-ui/charte_applicative_XiVO_2014_v1/icones/hide.svg"
                    sourceSize: Qt.size(30, 30)
                    visible: false
                }

                ColorOverlay {
                    id: hideButtonImageOverlay
                    anchors.fill: hideButtonImage
                    source: hideButtonImage
                    color: "#ffe77d39"
                    // cached: false
                }

                MouseArea {
                    id: hideButtonMouseArea
                    anchors.fill: parent

                    onClicked: {
                        if (mainwindow.state == "BODY_HIDDEN") {
                            mainwindow.state = "BODY_SHOWN"
                        } else if (mainwindow.state == "BODY_SHOWN") {
                            mainwindow.oldHeight = container.height
                            mainwindow.state = "BODY_HIDDEN"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: body

            anchors.top: identity.bottom
            height: parent.height
            width: parent.width

            Rectangle {
                id: menu
                color: "#C0C0C0"
                width: 60
                height: parent.height
            }
        }
    }

    statusBar: StatusBar {
        id: statusbar

        anchors.bottom: parent.bottom
        RowLayout {
            anchors.fill: parent
            Label { text: "Connected" }
        }
    }
}
