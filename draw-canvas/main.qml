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
    property var paintType: ["line","rect","circle","curve"]//自定义绘制类型
    property var clickPoint: []//多边形画图的存点数组 未实现
    property int clickNum: 0//鼠标点击
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

        function clear() {
            var ctx = getContext("2d");
            ctx.reset();
            canvas.requestPaint();
        }
          onPaint: {
              var ctx = getContext("2d")
              ctx.lineWidtn = 5
              ctx.strokeStyle = canvas.color;//轮廓颜色
              //ctx.fillStyle = canvas.color;//填充颜色
              ctx.beginPath()
              if(paintType === "line"){
                  ctx.moveTo(startX,startY)
                  startX = area.mouseX;
                  startY = area.mouseY;
                  ctx.lineTo(stopX,stopY)
                  stopX = area.mouseX;
                  stopY = area.mouseY;

              }
              if(paintType === "rect"){
                  //ctx.fillRect(startX,startY,stopX-startX,stopY-startY)//填充类型
                  //ctx.clearRect(0,0,width,height)
                  ctx.strokeRect(startX,startY,stopX-startX,stopY-startY)//非填充
              }
              if(paintType === "circle"){
                  ctx.arc(startX,startY,Math.sqrt(Math.pow((stopX-startX),2)+Math.pow((stopY-startY),2)),0,360,false)
              }
              if(paintType === "curve"){
                  ctx.arcTo(startX,startY,stopX,stopY,Math.sqrt(Math.pow((stopX-startX),2)+Math.pow((stopY-startY),2)))
              }

             // ctx.fill();//完成填充
              ctx.stroke()
          }
          MouseArea{
              id:area;
              anchors.fill: parent;
              onClicked:   {//存点  遍历
                  //clickPoint.push({"x":mouseX,"y":mouseY})//多边形绘制存点 多边形未实现
                  clickNum++;
                  for(var i = 0;i<clickPoint.length;i++){
                      var point = clickPoint[i];

                  }

                  if(clickNum == 1){
                      startX = mouseX;
                      startY = mouseY;
                  }
                  if(clickNum == 2){
                      clickNum = 0;
                      stopX = mouseX;
                      stopY = mouseY;
                      canvas.requestPaint();
                  }

              }
           }

         }
    }

