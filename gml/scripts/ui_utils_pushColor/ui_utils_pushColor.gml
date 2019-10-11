if(!variable_global_exists("g_ui_colorStack")){
	global.g_ui_colorStack = ds_stack_create()
}
var t_alpha = draw_get_alpha()
var t_color = draw_get_color()
var t_font = draw_get_font()
var t_halign = draw_get_halign()
var t_lighting = draw_get_lighting()
var t_valign = draw_get_valign()
var arr = [t_alpha, t_color, t_font, t_halign, t_lighting, t_valign]
ds_stack_push(global.g_ui_colorStack, arr)