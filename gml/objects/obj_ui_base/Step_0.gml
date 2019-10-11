/// @description 处理数据变动

var vec = ui_getCoordinate(v_ui)
x = vec[0]
y = vec[1]
var step = v_ui_scripts[? "step"]
if(step != undefined){
	script_execute(step, v_ui)
}