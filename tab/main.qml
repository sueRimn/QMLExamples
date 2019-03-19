import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("泡芙的TabView吖~")
    Column{
        id:coloumn;
        spacing: 0;
        width: 100;
        height: 500;
        Rectangle{
            width: 100;
            height: 20;
            color: "#ffc2fc"
            Text{
                id:cake
                text: "蛋糕"
                font.pointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    tabView.currentIndex = 0
                }
            }
        }
        Rectangle{
            width: 100;
            height: 20;
            color: "#ff557f"
            Text{
                id:hotPot
                text: "火锅"
                font.pointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    tabView.currentIndex = 1
                }
            }
        }
        Rectangle{
            width: 100;
            height: 20;
            color: "#fff66f"
            Text{
                id:puff
                text: "泡芙"
                font.pointSize: 12;
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    tabView.currentIndex = 2;
                }
            }
        }
    }
    TabView{
        id:tabView;
        anchors.left: coloumn.right;
        anchors.top:coloumn.top
        height: coloumn.height
        tabsVisible: false
        tabPosition: Qt.leftEdge
        Tab{
            Rectangle{
                anchors.fill: parent;
                color: "#ffc2fc"
                Text{
                    text: "今天吃蛋糕"
                    color:"#333"
                    font.pointSize: 14
                    anchors.centerIn: parent
                }
            }
        }
        Tab{
            Rectangle{
                anchors.fill: parent;
                color: "#ff557f"
                Text{
                    text: "今天吃火锅"
                    color:"#333"
                    font.pointSize: 14
                    anchors.centerIn: parent
                }
            }

        }
        Tab{
            Rectangle{
                anchors.fill: parent;
                color: "#fff66f"
                Text{
                    text: "今天吃泡芙"
                    color:"#333"
                    font.pointSize: 14
                    anchors.centerIn: parent
                }
            }
        }
    }
}
