import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.an.qobjectSingleton 1.0 as Global
Button{
    id:appBtn;
    property alias borderbtnText: tex.text
    width: parent.width;
    height: parent.height;
    style: ButtonStyle{
        background: Rectangle{
            color: control.pressed ? Global.GlobalVar.btnBorderColor : control.activeFocus ? Global.GlobalVar.btnBorderColor :control.hovered ? Global.GlobalVar.btnBorderColor :"transparent";
            //radius: 2;
            border.color: Global.GlobalVar.btnBorderColor;
            radius: 3;
//            border.color: control.hovered ? "" : Global.GlobalVar.mainColor;
//            radius: control.hovered ? 3 : 0;
            anchors.fill: parent;
        }
    }
    Text{
        id:tex;
        color: parent.pressed ? Global.GlobalVar.contrastColor : parent.activeFocus ? Global.GlobalVar.contrastColor :parent.hovered ? Global.GlobalVar.contrastColor :Global.GlobalVar.btnBorderColor;
        font.pointSize:Global.GlobalVar.textFontSize;
        anchors.centerIn: parent;
        text: "";
    }
}
