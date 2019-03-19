import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
Window{
    id: root
    width: 640
    height: 480
    visible: true

    Canvas {
        id: mycanvas
        width:  1000
        height: 1000

        property var arrpoints : []

        onPaint: {
            var context = getContext("2d");
            // Delete everything drawn before?
            context.clearRect(0, 0, mycanvas.width, mycanvas.height);

            // Render all the points as small black-circles
            context.strokeStyle = Qt.rgba(0, 1, 1, 0)

            // Draw all the points
            for(var i=0; i < arrpoints.length; i++){
                var point = arrpoints[i]
                context.ellipse(point["x"], point["y"], 10, 10)
                context.fill()
                context.stroke()

            }
        }

        function clear() {
            var ctx = getContext("2d");
            ctx.reset();
            mycanvas.requestPaint();
        }

        // For mousing in points.
        MouseArea {
            id: mymouse
            anchors.fill: parent
            onClicked: {
                // Record mouse-position into all the input objects
                mycanvas.arrpoints.push({"x": mouseX, "y": mouseY})
                mycanvas.requestPaint()
                console.log( mycanvas.arrpoints)
            } // onClicked
        }// MouseArea
    } // Canvas

    Button {
        text: "clear input"
        onClicked: {
          mycanvas.arrpoints.length = 0
          mycanvas.clear()
          console.log( mycanvas.arrpoints )
        }
    }
}
