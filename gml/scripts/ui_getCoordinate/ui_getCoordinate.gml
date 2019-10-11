/// @func ui_getCoordinate(ui)
/// @arg {ds_map} 要计算的UI
/// @desc 计算坐标位置(非顶层UI则会进入相对运算)
/// @return 返回坐标矢量

var ui = argument0
var fx
var fy
var father = ui[? UI_Field.Father]
if(father != undefined){
	var fdata = global.g_ui_data[? father]
	var fv = ui_getCoordinate(fdata)
	fx = fv[0]
	fy = fv[1]
} else {
	fx = 0
	fy = 0
}
fx += ui[? UI_Field.Coordinate_X]
fy += ui[? UI_Field.Coordinate_Y]
return vector_Create(fx, fy)