import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.0

Window
{
    id: nextWin
    title: qsTr( "Scene Graph TexturedObject" )
    width: 480
    height: 320
    visible: true

    Rectangle
    {
        anchors.fill: parent
        color: "orange"

        Rectangle
        {
            anchors.centerIn: parent
            width: 100
            height: 100
            color: "blue"

            Rectangle
            {
                anchors.centerIn: parent
                width: 20
                height: 20
                color: "red"
            }
        }
    }
}
