import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window{
    id: root
    width: 640
    height: 480
    visible: true

    Row{
        id:colorTools//颜色提取工具
        anchors{
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 8

        }
        property color paintColor: "#33b5e5"//设置初始画笔颜色
        spacing: 4;
        Repeater{//四个colorSquare
            model: ["#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]//modelData 颜色数据
            ColorSquare{
                id:red;
                color: modelData;
                active: parent.paintColor == color//当选中一个colorSquare时，当前画笔颜色为选中的颜色
                onClicked: {
                    parent.paintColor = color
                }

            }
        }
    }
    Rectangle{
        anchors.fill: canvas
        border.color: "#666"
        border.width: 4;
    }
    Canvas{
        id:canvas;
        anchors{
            left: parent.left;
            right:parent.right;
            top:colorTools.bottom;
            bottom: parent.bottom;
            margins: 8
        }
　　　　　　//鼠标点击坐标位置
        property real lastX
        property real lastY
        property color color: colorTools.paintColor

        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidtn = 5
            ctx.strokeStyle = canvas.color;
            ctx.beginPath()
            ctx.moveTo(lastX,lastY)
            lastX = area.mouseX;
            lastY = area.mouseY;
            ctx.lineTo(lastX,lastY)
            ctx.stroke()
        }
        MouseArea{
            id:area;
            anchors.fill: parent;
            onPressed: {
                canvas.lastX = mouseX;
                canvas.lastY = mouseY;
            }
            onPositionChanged: {
                canvas.requestPaint()//当鼠标press位置改变  完成当前绘制
            }
        }
    }
}//Window
