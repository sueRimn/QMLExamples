import QtQuick 2.10
import QtQuick.Window 2.10
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("边框按钮 悬浮变色")
    Rectangle{
        anchors.fill: parent;

        color: "#ffff00"
        BorderButton{
            width: 100;
            height: 50;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenter: parent.horizontalCenter
            borderbtnText: "Button"
        }
    }
}
