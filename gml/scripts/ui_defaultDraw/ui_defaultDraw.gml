/// @func ui_defau7ltDraw(ui)
/// @arg {ds_map} 要绘制的UI
/// @desc 仅绘制目标ui的精灵

var vis = ui[? UI_Field.Display_Visible]
if(vis){
	var target = ui[? UI_Field.InstanceID]
	with(target){
		draw_self()
	}
	
}