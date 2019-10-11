/// @description 清理多余的数据结构

var destroy = v_ui_scripts[? "destroy"]
if(destroy != undefined){
	script_execute(destroy, v_ui)
}

if(v_ui_scripts_destoryOnDestroy){
	ds_map_destroy(v_ui_scripts)
}