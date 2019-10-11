if(!variable_global_exists("g_ui_colorStack")){
	global.g_ui_colorStack = ds_stack_create()
	exit
}
if(ds_stack_empty(global.g_ui_colorStack)){
	exit
}
var pop = ds_stack_pop(global.g_ui_colorStack)
draw_set_alpha(pop[0])
draw_set_color(pop[1])
draw_set_font(pop[2])
draw_set_halign(pop[3])
draw_set_lighting(pop[4])
draw_set_valign(pop[5])