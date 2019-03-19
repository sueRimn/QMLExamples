import QtQuick 2.10
import QtQuick.Window 2.10
import QtWebEngine 1.4
Window {
    visible: true;
    width: 640;
    height: 480;
    title: qsTr("WebEngineView加载HTML");
    WebEngineView{
        anchors.fill: parent;
        url:"./html/test.html";
    }
}
