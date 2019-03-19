pragma Singleton
import QtQuick 2.0

/*
  @brief 全局属性
  @version 1.0
  @author 狐狸家的妤
  @date 20180921
*/
QtObject{
    // 全局属性 共同属性
    property real borderBtnFontSize: 12//边框按钮字体大小
    property real textFontSize: 12//主要字体大小

    property color bgColor: "#698196"//底色
    property color whiteColor: "#fff"//白色
    property color hoverColor: "#eee"//鼠标滑过颜色
    property color btnBorderColor: "#1240AB"//边框按钮颜色
    property color remindColor: "#C23B07"//
    property color listBg: "#ccc"//列表的背景颜色
    property color blackColor: "#333"//黑木色
    property color checkFontColor: "#2C3E50"//checkButton RadioButton 选中时字体颜色
    property color unCheckFontColor: "#333"//checkButton RadioButton 未选中时字体颜色
    property color checkColor: "#333"//checkButton RadioButton 选中颜色
    property color unCheckColor: "gray"//checkButton RadioButton 未选中颜色
    property color contrastColor: "#eee"//反差色
    property color currentColor: "#999"//listView当前项颜色

}
