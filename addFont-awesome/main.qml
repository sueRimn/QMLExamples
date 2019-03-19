import QtQuick 2.10
import QtQuick.Window 2.10
import "Font"
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("font-awesome")
    Rectangle{
        width: 300;
        height: 50;
        radius: 5;
        color: "green"
        anchors.horizontalCenter: parent.horizontalCenter
        Text{
            color: "white"
            font.pointSize: 20
            anchors.centerIn: parent
            font.family: "FontAwesome"
            text: "\uf004"
        }
    }


}
