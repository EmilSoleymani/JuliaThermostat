import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480
    maximumWidth: 640*2
    maximumHeight: 480*2
    visible: true
    title: qsTr("Thermostat")

    Loader {
        id: mainLoader
        anchors.fill: parent
        source: "./UI/HomeScreen/HomeScreen.qml"
    }
}