/// @description 处理数据变动
	var vec = ui_getCoordinate(v_ui)
	var cam = view_camera[0]
	var cx = camera_get_view_x(cam)
	var cy = camera_get_view_y(cam)
	x = vec[0] + cx
	y = vec[1] + cy
visible = v_ui[? UI_Field.Display_Visible]
var step = v_ui_scripts[? "step"]
if(step != undefined){
	script_execute(step, v_ui)
}
