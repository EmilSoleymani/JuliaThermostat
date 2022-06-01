import QtQuick 2.0
import org.julialang 1.0

Item{
    id: homeScreen
    property var heatSelectDialogHolder: null

    function createHeatSelectDialog() {
        if(heatSelectDialogHolder === null) {
            var component = Qt.createComponent("HeatSelectDialog.qml")
            heatSelectDialogHolder = component.createObject(homeScreen, {"x": 0, "y":0})
            if (heatSelectDialogHolder)
                heatSelectDialogHolder.anchors.fill = homeScreen
                heatSelectDialogHolder.destroyMe.connect(destroyHeatSelectDialog)
        }
    }

    function destroyHeatSelectDialog() {
        if( heatSelectDialogHolder !== null){
            heatSelectDialogHolder.destroy()
            heatSelectDialogHolder = null
        }
    }

    Rectangle {
        id: mainBackground
        anchors.fill: parent
        color: "black"
    }

    Text {
        id: currentTempText
        anchors.centerIn: parent
        color: "white"
        font.pixelSize: 170
        text: guiproperties.currentSystemTemperature
    }

    Text {
        id: systemStatus
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: currentTempText.bottom
            topMargin: 30
        }
        font.pixelSize: 30
        color: "white"
        text: guiproperties.systemStatusMessage
    }

    Image {
        id: heatCoolSelectIcon
        anchors {
            top: temperatureSlider.top
            right: currentTempText.left
            rightMargin: 100
        }
        width: 70; height: 70
        source: {
            if(guiproperties.systemState === 0)  // HEATING
                return "../Assets/flame.png"
            if(guiproperties.systemState === 1)  // COOLING
                return "../Assets/ice-crystal.png"
            if(guiproperties.systemState === 2)  // AUTO
                return "../Assets/auto.png"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: createHeatSelectDialog()
        }
    }

    Image {
        id: settingsIcon
        anchors {
            bottom: temperatureSlider.bottom
            right: currentTempText.left
            rightMargin: 100
        }
        width: 70; height: 70
        source: "../Assets/settings.png"
    }

    TemperatureControlSlider {
        id: temperatureSlider
        value: guiproperties.targetTemp
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: currentTempText.right
            leftMargin: 100
            topMargin: 70
            bottomMargin: 70
        }
    }
}