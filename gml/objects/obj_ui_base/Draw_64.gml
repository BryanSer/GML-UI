/// @description 默认绘制事件

if(!visible){
	exit
}
var father = v_ui[? UI_Field.Father]
if(father != undefined){
	exit
}
//递归绘制
ui_recuDraw(v_ui)