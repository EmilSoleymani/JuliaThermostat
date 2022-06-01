import QtQuick 2.0
import org.julialang 1.0

Rectangle {
    id: heatSelectDialogBackground
    signal destroyMe() 

    anchors.fill: parent 
    color: Qt.rgba(0,0,0,0)

    MouseArea {
        anchors.fill: parent
        onClicked: heatSelectDialogBackground.destroyMe()
    }


    ListView {
        id: heatListView
        anchors.fill: innerRectangle
        model: heatModel
        delegate: Rectangle {
            width: innerRectangle.width
            height: innerRectangle.height/3
            color: "black"
            border.color: "white"
            border.width: 3
            radius: 5
            
            Text {
                anchors.centerIn: parent
                color: "white"
                font.pixelSize: 42
                text: controlText
            }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    if (controlText === "Heat")
                        Julia.setSystemState(0)  // Heating
                    else if(controlText === "Cool")
                        Julia.setSystemState(1)  // Cooling
                    else
                        Julia.setSystemState(2)  // Auto

                    // Close dialog after selection
                    heatSelectDialogBackground.destroyMe()
                }
            }
        }
    }

    ListModel {
        id: heatModel
        ListElement { controlText: "Heat" }
        ListElement { controlText: "Cool" }
        ListElement { controlText: "Auto" }
    }

    Rectangle {
        id: innerRectangle
        width: parent.width / 2
        height: parent.height * 0.8
        anchors.centerIn: parent
        z: -1
        color: "black"
        border.color: "white"
        border.width: 3
        radius: 5
    }
}