/// @func ui_defaultDraw_text(ui)
/// @desc 绘制字符串
/// @arg {ds_map} ui

var ui = argument0
if(ui[? UI_Field.Type] != "text"){
	exit
}

var cfg = ui[? UI_Field.Config]
var text = cfg[? "text"]
var inst = ui[? UI_Field.InstanceID]
var tx, ty
with(inst){
	tx = x
	ty = y
}
ui_utils_pushColor()
var t_alpha = cfg[? "alpha"]
if(t_alpha == undefined){
	t_alpha = draw_get_alpha()
}
var t_color = cfg[? "color"]
if(t_color == undefined){
	t_color = draw_get_color()
}
var t_font = cfg[? "font"]
if(t_font == undefined){
	t_font = draw_get_font()
} else {
	t_font = asset_get_index(t_font)
}
var t_halign = cfg[? "halign"]
if(t_halign == undefined){
	t_halign = draw_get_halign()
} else {
	t_halign = global.g_ui_macroMap[? t_halign]
}
var t_valign = cfg[? "valign"]
if(t_valign == undefined){
	t_valign = draw_get_valign()
} else {
	t_valign = global.g_ui_macroMap[? t_valign]
}
var xscale = cfg[? "xscale"]
if(xscale == undefined){
	xscale = 1
}
var yscale = cfg[? "yscale"]
if(yscale == undefined){
	yscale = 1
}
var angle = cfg[? "angle"]
if(angle == undefined){
	angle = 0
}
draw_set_alpha(t_alpha)
draw_set_color(t_color)
draw_set_font(t_font)
draw_set_halign(t_halign)
draw_set_valign(t_valign)
draw_text_transformed(x, y, text, xscale, yscale, angle);
ui_utils_popColor()