/// @description Insert description here
// You can write your code in this editor
//if(!ui_utils_hasFather(v_ui)) {
	var vec = ui_getCoordinate(v_ui)
	var cam = view_camera[0]
	var cx = camera_get_view_x(cam)
	var cy = camera_get_view_y(cam)
	x = vec[0] + cx
	y = vec[1] + cy
//}