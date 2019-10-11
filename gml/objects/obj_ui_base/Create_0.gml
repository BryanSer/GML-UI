/// @description 读取UI数据
v_ui_id = global.g_ui_currCreateId
var ui = global.g_ui_data[? global.g_ui_currCreateId]
v_ui = ui
visible = ui[? UI_Field.Display_Visible]
var vec = ui_getCoordinate(v_ui)
x = vec[0]
y = vec[1]
sprite_index = ui[? UI_Field.Display_Sprite]
v_ui_config = ui[? UI_Field.Config]
if(ds_map_exists(v_ui_config,"scripts")){
	v_ui_scripts = v_ui_config[? "scripts"]
	v_ui_scripts_destoryOnDestroy = false
}else{
	v_ui_scripts = ds_map_create()
	v_ui_scripts_destoryOnDestroy = true
}
var init = v_ui_scripts[? "init"]
if(init != undefined){
	script_execute(init, v_ui)
}