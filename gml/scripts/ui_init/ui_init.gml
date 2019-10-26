/// @func ui_init()
/// @desc 初始化UI系统
if(variable_global_exists("g_ui_init")){
	exit
}
#macro UI_DEFAULT_LAYER "UI"
#macro UI_DEFAULT_DRAW_SCRIPT ui_defaultDraw
#macro getOrDefault ui_utils_getOrDefault
global.g_ui_init = true
global.g_ui_data = ds_map_create() //Index -> ds_map
global.g_ui_currMaxIndex = 1
global.g_ui_fieldMap = ds_map_create()
global.g_ui_typeMap = ds_map_create()//类型映射
global.g_ui_macroMap = ds_map_create()//可能用到的宏映射

enum UI_Field{
	Index,
	Name,
	Type,
	Coordinate_X,
	Coordinate_Y,
	Display_Sprite,
	Display_Visible,
	Config,
	Components,
	Father,
	InstanceID,
	Hover
}
global.g_ui_fieldMap[? UI_Field.Name] = ["name", "defaultUIName"]
global.g_ui_fieldMap[? UI_Field.Type] = ["type", "none"]
global.g_ui_fieldMap[? UI_Field.Coordinate_X] = ["x", 0]
global.g_ui_fieldMap[? UI_Field.Coordinate_Y] = ["y", 0]
global.g_ui_fieldMap[? UI_Field.Display_Sprite] = ["sprite", noone] 
global.g_ui_fieldMap[? UI_Field.Display_Visible] = ["visible", false]
global.g_ui_fieldMap[? UI_Field.Config] = ["config", ds_map_create()] 
global.g_ui_fieldMap[? UI_Field.Components] = ["components", ds_list_create()]
global.g_ui_fieldMap[? UI_Field.Hover] = ["hover", null]

global.g_ui_typeMap[? "frame"] = obj_ui_frame
global.g_ui_typeMap[? "text"] = obj_ui_text

global.g_ui_macroMap[? "fa_left"] = fa_left
global.g_ui_macroMap[? "fa_center"] = fa_center
global.g_ui_macroMap[? "fa_right"] = fa_right
global.g_ui_macroMap[? "fa_top"] = fa_top
global.g_ui_macroMap[? "fa_middle"] = fa_middle
global.g_ui_macroMap[? "fa_bottom"] = fa_bottom


