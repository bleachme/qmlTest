import QtQuick 2.3
import QtQuick.Controls 2.5


import CallCPP.module 1.0



ApplicationWindow {
    visible: true
    width: 480
    height: 320
    title: qsTr("testWindows")


    QMLClass {
        id: qmlTest
    }


    Rectangle {
        id: rec1
        visible: true
        x: 0; y: 0; width: 100; height: 100
        color: "red"
        opacity: 0.5

        Text {
            anchors.centerIn: parent
            text: "hello world"
        }




        function testFunc()
        {
            //qmlTest.age
            var temp = width + 10
            if (temp <= 400)
            {
                width = temp
            }

            console.log('rec1.width=', width)
            return width;
        }

        onWidthChanged: console.log('OnwidthChanged=', width)


    }

    Button {
        id: bt_ok
        x: 10; y: 110; width: 80; height: 30;
        text: "bigger"
        flat: false


        onClicked: rec1.testFunc()
    }



    Rectangle {
        id: rec3
        //color: "blue"
        x: 0; y: 150; width: 100; height: 100
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "blue" }
        }

        Text {
            id: text3
            anchors.centerIn: parent

        }
        //opacity: 0.5


        MouseArea {
            width: 100; height: 100
            onClicked: console.log('click2', 2)
        }

        Item {
            id: item3
            //focus: true

            Keys.onPressed: {
                if (event.key === Qt.Key_A)
                {
                    text3.text = "a pressed"
                    console.log('a pressed')
                }
            }
        }
    }

    Button {
        id: bt_cancle
        x: 10; y: 250; width: 80; height: 30;
        text: "test Clik"
        flat: false

        //icon.source: "img1.png"

        onClicked: {

            console.log("cancle.onClicked", qmlTest.age)
        }
        onPressed: {
            qmlTest.testInvoke()
            console.log("cancle.onPressed")
        }
        onReleased: {
            qmlTest.testSlot()
            console.log("cancle.onReleased")
        }

    }


    StackView{
        id: stack
        x: 110; y: 150; width: 150; height: 150

        Button {
            id: btNext
            x: 0; y: 100; width: 80; height: 30;
            text: "call yellow"

            onClicked: {
                stack.push(com1)
            }
        }
    }






    Component {
        id: com1


        Rectangle {
            color: "yellow"
            width: 100; height: 100
            Text {
                anchors.fill: parent
                anchors.centerIn: parent
                text: qsTr("next")
            }


        }
    }

    Button {
        id: bt_n
        x: 250; y: 200; width: 80; height: 30;
        text: "NEXT"
        flat: false

        //onClicked: {
        //    console.log("next clicked")
        //    gotoWin.show()
        //}


        Loader {
            id: load

        }

        onClicked: {
            load.setSource("next.qml")
            //load.source = "next.qml"

        }
    }









    ApplicationWindow {
        id: gotoWin
        visible: false
        x: 50
        y: 50
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
                    width: 100
                }
            }
        }
    }



}






