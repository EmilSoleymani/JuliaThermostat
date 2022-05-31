import QtQuick 2.0
import QtQuick.Controls 2.15
import org.julialang 1.0

Slider {
    id: temperatureControlSlider
    from: 55
    to: 85
    stepSize: 1
    orientation: Qt.Vertical

    onValueChanged: Julia.setTargetTemp(value)

    background: Rectangle {
        height: parent.height
        width: 3
        anchors.centerIn: parent
    }

    handle: Rectangle {
        color: "black"
        border.color: "white"
        border.width: 3
        width: 76
        height: 76
        radius: width/2
        anchors.horizontalCenter: parent.horizontalCenter
        y: temperatureControlSlider.visualPosition * (temperatureControlSlider.availableHeight - height)
    
        Text {
            anchors.centerIn: parent
            color: "white"
            font.pixelSize: 30
            text: temperatureControlSlider.value
        }
    }
}