import QtQuick 2.0


Rectangle {
    id: aboutPageBackground
    width: parent.width * .7
    height: parent.height * .7
    anchors.centerIn: parent
    color: "black"
    border.width: 3
    border.color: "white"
    radius: 5

    Text {
        id: aboutPageHeader
        anchors {
            top: parent.top
            left: parent.left 
            leftMargin: 40
            topMargin: 60
        }
        color: "white"
        font.pixelSize: 25
        text: "Made by: Emil Soleymani<br>Version: 1.0"
    }

    Text {
        anchors {
            top: aboutPageHeader.bottom
            left: parent.left 
            leftMargin: 40
            topMargin: 20
        }
        color: "white"
        font.pixelSize: 18
        text: "Smart Thermostat Control Software<br>Developed with Julia and Qt/QML"
    }
}
