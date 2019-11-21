import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 480
    height: 320
    title: qsTr("ScrollMe")

    ScrollView {
        anchors.fill: parent

        ListView {
            width: parent.width
            model: 10
            delegate: ItemDelegate {
                text: "Hello World " + (index + 1)
                width: parent.width
            }
        }
    }
}
