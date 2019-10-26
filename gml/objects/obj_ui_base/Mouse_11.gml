/// @description 处理鼠标移出
var mouse = v_ui_scripts[? "mouse"]
if(mouse != undefined){
	var moveOut = mouse[? "moveOut"]
	if(moveOut != undefined){
		script_execute(moveOut,v_ui)
	} 
}

if(v_ui_hoverAt != null){
	var hdata = global.g_ui_data[? v_ui_hoverAt]
	hdata[? UI_Field.Display_Visible] = false
}