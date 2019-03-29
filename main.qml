import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    //State.name: "clicked"

    Rectangle {
       id:rect
       height: parent.height/4
       width: parent.width/4
       anchors.centerIn: parent
       TextInput{
          id:text
          anchors.centerIn:rect
          height:10

          text:"KESHAW"
          color:"white"

       }

        state: "clicked"
        states: [
           State {
             name: "clicked"
             PropertyChanges {
                target: rect
                color: "red"

             }
             PropertyChanges {
                target: text
                color: "red"

             }
            },
            State {
            name: "unclicked"
            PropertyChanges {
                target: rect
                color: "blue"
            }
            PropertyChanges {
                target: text
                color: "blue"
            }

          }

        ]
        transitions: [
            Transition {
                from: "clicked"
                to: "unclicked"

                ColorAnimation {
                    from: "red"
                    to: "blue"
                    duration: 2000
                    target: rect
                }

            },
            Transition {
                from: "unclicked"
                to: "clicked"

                ColorAnimation {
                    from: "blue"
                    to: "red"
                    duration: 2000
                    target:rect
                }

            }
        ]
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: rect.state = "unclicked"
            onExited: rect.state = "clicked"

            onClicked: rect.state = "unclicked"
        }
     }
}
