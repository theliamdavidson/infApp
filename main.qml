import QtQuick 2.10
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQml 2.0

ApplicationWindow {
    title: qsTr("NEUROPATHIC VIEW")
    width: 1024
    height: 768
    visible: true
    id: root


    Rectangle {
        anchors.fill: parent
        color: white
        Rectangle {
            x: 0
            y: 0
            width: 1024
            height: 163
            //rotation: 270
            visible: true
            border.color: "#ffffff"

            gradient: Gradient {
                GradientStop { position: 0; color: "#3d1d5c"}
                GradientStop { position: 1; color: "#337cb6"}
            }
            Image {
                id: logo
                x: 25
                y: 13
                width: 272
                height: 90
                source: "logo-lluh_0.png"
                fillMode: Image.PreserveAspectFit
            }
        }
        Rectangle {
            id: title
            x: 300
            y: 200
            width: 380
            height: 100
            radius: 5
            visible: true
            gradient: Gradient {
                GradientStop { position: 0; color: "#901c3b"}
                GradientStop { position: 1; color: "#e13f52"}
            }
            Label{
                text: "Neuropathic View"
                font.pointSize: 18
                color: "black"
                anchors.centerIn: parent

            }
        }
        Rectangle {
            id: optionsMenu
            x: 300
            y: 350
            width: 380
            height: 300
            radius: 5
            visible: true
            gradient: Gradient {
                GradientStop { position: 0; color: "#901c3b"}
                GradientStop { position: 1; color: "#e13f52"}
            }
            RoundButton {
                id: fileCabinet
                x: 102
                y: 10
                width: 175
                height: 80
                visible: true
                radius: 5
                text: qsTr("FILE CABINET")
                font.bold: true
                font.pointSize: 12
                leftPadding: 10
                highlighted: true
                layer.enabled: false
                anchors.horizontalCenter: parent
                focus: true
                function activate(){
                    var component = Qt.createComponent("fileCabinet.qml")
                    var window    = component.createObject(root)
                    window.show()
                }
                onClicked: {
                    fileCabinet.activate()
                }
                Keys.onSpacePressed: fileCabinet.activate()
                Keys.onEnterPressed: fileCabinet.activate()
            }
            RoundButton {
                id: mainmenu
                x: 102
                y: 100
                width: 175
                height: 80
                radius: 5
                text: qsTr("LOG OUT")
                font.bold: true
                font.pointSize: 12
                leftPadding: 10
                highlighted: true
                onClicked: {
                    root.close()
                }
            }
        }

    }

}
