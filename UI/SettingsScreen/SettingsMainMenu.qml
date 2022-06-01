import QtQuick 2.0

Item {
    ListModel {
        id: settingsMenuModel
        ListElement { menuText: "Temperature Units"; iconSource: "../Assets/thermometer.png" }
        ListElement { menuText: "Schedule"; iconSource: "../Assets/calendar.png" }
        ListElement { menuText: "WiFi Settings"; iconSource: "../Assets/wifi.png" }
        ListElement { menuText: "About"; iconSource: "../Assets/info-button.png" }
    }

     Rectangle {
        id: stackViewBackground
        width: parent.width * .7
        height: parent.height * .7
        anchors.centerIn: parent
        color: "black"
        border.width: 3
        border.color: "white"
        radius: 5
    }

    ListView {
        id: settingsListView
        anchors.fill: stackViewBackground
        model: settingsMenuModel
        interactive: false   // Prevents "flicking"
        delegate: Rectangle {
            id: mainButton
            width: settingsListView.width
            height: settingsListView.height/4
            color: "black"
            border.color: "white"
            border.width: 3
            radius: 5
            
            Image {
                id: iconImage
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 30
                }
                source: iconSource
                width: 48; height: 48
            }

            Text {
                id: mainText
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: iconImage.right
                    leftMargin: 40
                }
                color: "white"
                font.pixelSize: 30
                text: menuText
            }

            MouseArea{
                anchors.fill: parent
                onPressed: {
                    mainButton.color = "white"
                    mainText.color = "black"
                }
                onReleased: {
                    mainButton.color = "black"
                    mainText.color = "white"
                }
                onClicked: {
                    if (menuText === "Temperature Units")
                        settingsStackView.push("TemperatureUnitsPage.qml")
                    else if (menuText === "About")
                        settingsStackView.push("AboutPage.qml")
                }
            }
        }
    }
}