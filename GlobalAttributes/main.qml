import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    BorderButton{
        width: 100;
        height: 50;
        anchors.horizontalCenter: parent.horizontalCenter
        borderbtnText: "click me!"
    }
}
