import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window{
    id: root
    property real startX
    property real startY
    property real stopX
    property real stopY
    property color color: colorTools.paintColor
    property var paintType: ["line","rect","circle","curve"]
    property bool isMouseMoveEnable: false  //是否允许鼠标移动绘制事件
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
//        Repeater{//四个colorSquare
//            model: ["#33B5E5", "#99CC00", "#FFBB33", "#FF4444"]//modelData 颜色数据
//            ColorSquare{
//                id:red;
//                color: modelData;
//                active: parent.paintColor == color//当选中一个colorSquare时，当前画笔颜色为选中的颜色
//                onClicked: {
//                    parent.paintColor = color
//                }

//            }
//        }
        Button {
            text: "Clear"
            onClicked: {
                canvas.clear()
            }
        }
        Button{
            text: "line";
                onClicked: {

                    paintType = "line";
                    //canvas.requestPaint();
                }

        }
        Button{
            text: "rect"
            onClicked: {
                paintType = "rect";
               // canvas.requestPaint();
            }
        }
        Button{
            text: "circle"
            onClicked: {
                paintType = "circle";
//                canvas.requestPaint();
            }
        }
        Button{
            text: "curve"
            onClicked: {
                paintType = "curve";
//                canvas.requestPaint();
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

        function clear() {//此清除有问题
            var ctx = getContext("2d");
            ctx.reset();
            canvas.requestPaint();
        }
          onPaint: {
              var ctx = getContext("2d")
              ctx.lineWidtn = 10
              ctx.strokeStyle = canvas.color;
             // ctx.fillStyle = canvas.color;//若想要填充的 此不注释
　　　　　　　　if(isMouseMoveEnable)
　　　　　　　　ctx.clearRect(0,0,width,height) //这句话要换成一个只清理临时的对象
 　　　　　　　　ctx.beginPath()
　　　　　　if(paintType === "line")
　　　　　　{
                ctx.moveTo(startX,startY)
                startX = area.mouseX;
                startY = area.mouseY;
                ctx.lineTo(stopX,stopY)
                stopX = area.mouseX;
                stopY = area.mouseY;
                 }
                if(paintType === "rect")
                {
                //ctx.fillRect(startX,startY,stopX-startX,stopY-startY)//填充类型
                //ctx.clearRect(0,0,width,height)
                ctx.strokeRect(startX,startY,stopX-startX,stopY-startY)//非填充
                }
                if(paintType === "circle")
                {
                ctx.arc(startX,startY,Math.sqrt(Math.pow((stopX-startX),2)+Math.pow((stopY-startY),2)),0,Math.PI*2)
                 }
                if(paintType === "curve"){
                //未实现
                ctx.arcTo(startX,startY,stopX,stopY,Math.sqrt(Math.pow((stopX-startX),2)+Math.pow((stopY-startY),2)))
                }
                //ctx.fill();
                ctx.stroke()
                }
                 MouseArea{
                id:area;
                anchors.fill:
                parent;
                onPressed: {
                //第一次点击鼠标记录起始点
                startX = mouse.x;
                 startY = mouse.y;
                isMouseMoveEnable=true
                }
                onReleased: {
                stopX = mouse.x;
                 stopY = mouse.y;
                 isMouseMoveEnable=false
                }
                onPositionChanged: {
                //鼠标移动动态记录结束点，并且绘制
                if(isMouseMoveEnable) {

                // console.log("mouse posiont changed....")
                stopX = mouse.x;
                stopY = mouse.y;
                canvas.requestPaint();
                }
             }
          }
     }
}
