import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

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

            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            source: "content/images/logo.svg"
            sourceSize: Qt.size(234, 97)
            visible: true
        }

        Text {
            id: connectionLabel
            anchors.top: logo.bottom
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            text: "CONNEXION"
            color: "#e77d39"
            font.pointSize: 16
        }

    }

    Rectangle {
        id: body
        width: parent.width
        height: loginwindow.height - top.height
        anchors.top: top.bottom

        Rectangle {
            id: bodyContent

            anchors.fill: parent
            anchors.margins: 30

            Text {
                id: descriptionLabel
                anchors.top: parent.top
                width: parent.width
                text: "pwet"
            }

            Rectangle {
                height: childrenRect.height
                anchors.bottom: bodyContent.bottom
                width: parent.width
                TextField {
                    id: login
                    anchors.top: parent.top
                    width: parent.width
                    placeholderText: "login"
                    style: TextFieldStyle {
                        textColor: "#2C2927"
                        placeholderTextColor: "#8C8987"
                        background: Rectangle {
                            radius: 10
                            color: "#E8E4E2"
                        }
                    }
                }

                TextField {
                    id: password
                    anchors.top: login.bottom
                    anchors.topMargin: 15
                    width: parent.width
                    placeholderText: "password"
                    echoMode: TextInput.Password
                    style: TextFieldStyle {
                        textColor: "#2C2927"
                        placeholderTextColor: "#8C8987"
                        background: Rectangle {
                            radius: 10
                            color: "#E8E4E2"
                        }
                    }
                }

                CheckBox {
                    id: rememberMe
                    anchors.top: password.bottom
                    anchors.topMargin: 20
                    text: "Se souvenir de moi"
                }

                Button {
                    id: connectButton
                    anchors.top: rememberMe.bottom
                    anchors.topMargin: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    style: ButtonStyle {
                        label: Text {
                            color: "white"
                            text: "ME CONNECTER"
                            font.pixelSize: 12
                        }
                        background: Rectangle {
                            radius: 7
                            color: "#e77d39"
                        }
                    }
                }
            }
        }
    }
}
