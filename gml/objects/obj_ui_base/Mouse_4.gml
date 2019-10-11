/// @description 处理鼠标点击
var mouse = v_ui_scripts[? "mouse"]
if(mouse != undefined){
	var click = mouse[? "click"]
	if(click != undefined){
		script_execute(click, v_ui)
	} 
}