import QtQuick 2.0
import QtQuick.Controls 2.12
import org.julialang 1.0

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
        id: tempUnitPageHeader
        anchors {
            top: parent.top
            left: parent.left 
            leftMargin: 40
            topMargin: 60
        }
        color: "white"
        font.pixelSize: 25
        text: "Temperature Units:"
    }

    ComboBox {
        property bool loaded: false
        currentIndex: guiproperties.systemUnits
        model: ListModel {
            id: units
            ListElement { text: "Farenheit"}
            ListElement { text: "Celsius"}
        }
        width: parent.width * .65
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: tempUnitPageHeader.bottom 
            topMargin: 40
        }
        onCurrentIndexChanged: {
            if(loaded){
                Julia.setSystemUnits()
            }else{
                loaded = true
            }
        }
    }
}
