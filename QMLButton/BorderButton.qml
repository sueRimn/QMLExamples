import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Button{
    id:appBtn;
    property alias borderbtnText: tex.text
    width: parent.width;
    height: parent.height;
    style: ButtonStyle{
        background: Rectangle{
            color: control.pressed ? "#00cc00" : control.hovered ? "#00cc00" : control.activeFocus ? "#00cc00" : "#ffff00"
            border.color: "#00cc00"
            radius: 3;
            anchors.fill: parent;
        }
    }
    Text{
        id:tex;
        color: parent.pressed ? "#ffff00" : parent.hovered ? "#ffff00" : parent.activeFocus ? "#ffff00" : "#00cc00"
        font.pointSize:12;
        anchors.centerIn: parent;
        text: "";
    }
}
