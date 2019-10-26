/// @func ui_defaultDraw(ui)
/// @arg {ds_map} 要绘制的UI
/// @desc 仅绘制目标ui的精灵
var ui = argument0
var vis = ui[? UI_Field.Display_Visible]
if(vis){
	var target = ui[? UI_Field.InstanceID]
	with(target){
		draw_self()
	}
	
}