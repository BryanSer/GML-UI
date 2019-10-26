/// @func ui_recuDraw(ui)
/// @desc 递归绘制UI(本身也会绘制)
/// @arg {ds_map} 要绘制的父UI

var ui = argument0
var inst = ui[? UI_Field.InstanceID]
with(inst){
	var vec = ui_getCoordinate(v_ui)
	x = vec[0]
	y = vec[1]
	if(!visible){
		exit
	}
	var draw = v_ui_scripts[? "draw"]
	if(draw == undefined){
		draw = v_ui_defaultDrawScript
	}
	script_execute(draw, v_ui)
}

var sub = ui[? UI_Field.Components]
var length = ds_list_size(sub)
for(var i = 0; i < length; i++){
	var comp = sub[| i]
	var compui = global.g_ui_data[? comp]
	ui_recuDraw(compui)
}
var hover = ui[? UI_Field.Hover]
if(hover != null){
	var data = global.g_ui_data[? hover]
	ui_recuDraw(data)
}
