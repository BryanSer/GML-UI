/// @func ui_load(json)
/// @desc 加载json定义的UI
/// @arg {string|json} 传入的json字符串
/// @return 返回ui的id 返回-1表示解析失败
ui_init()
var t_json
var t_destory = false
if(is_string(argument0)){
	t_json = json_decode(argument0)
	t_destory = true
}else{
	t_json = argument0
}
if(t_json == -1 || !ds_exists(t_json,ds_type_map)){
	return -1
}
var t_ui = ds_map_create()
var t_ui_id = global.g_ui_currMaxIndex++
t_ui[? UI_Field.Index] = t_ui_id
global.g_ui_data[? t_ui_id] = t_ui
#region 读取json
	var key = ds_map_find_first(global.g_ui_fieldMap)
	while(key != undefined){
		var arr = global.g_ui_fieldMap[? key]
		if(ds_map_exists(t_json, arr[0])) {
			t_ui[? key] = t_json[? arr[0]]
		}else{
			t_ui[? key] = arr[1]
		}
		key = ds_map_find_next(global.g_ui_fieldMap, key)
	}
#endregion
t_ui[? UI_Field.Father] = undefined
var t_spr = t_ui[? UI_Field.Display_Sprite] // 转换精灵
if(t_spr != noone){
	t_ui[? UI_Field.Display_Sprite] = ui_utils_readSprite(t_spr)
}
#region 拷贝config
	var config = t_ui[? UI_Field.Config]
	var copycfg = ds_map_create()
	ds_map_copy(copycfg, config)
	t_ui[? UI_Field.Config] = copycfg
#endregion
#region 读取子组件
	var jscomp = t_ui[? UI_Field.Components]
	var comp = ds_list_create()
	if(!ds_list_empty(jscomp)){
		for(var i = 0; i < ds_list_size(jscomp); i++){
			var sub = jscomp[| i]
			var tid = ui_load(sub)
			var subui = global.g_ui_data[? tid]
			subui[? UI_Field.Father] = t_ui_id
			ds_list_add(comp, tid)
		}
	}
	t_ui[? UI_Field.Components] = comp
#endregion
#region 读取Hover
	var hover = t_ui[? UI_Field.Hover]
	if(hover != null){
		var tid = ui_load(hover)
		var subui = global.g_ui_data[? tid]
		subui[? UI_Field.Father] = t_ui_id
		subui[? UI_Field.Display_Visible] = false
		t_ui[? UI_Field.Hover] = tid
	}
#endregion
global.g_ui_currCreateId = t_ui_id
var type = global.g_ui_typeMap [? t_ui[? UI_Field.Type]]
if(type == undefined){   
	msg = "UI type undefine"
	debug
}else{
	var iid = instance_create_layer(0,0,UI_DEFAULT_LAYER, type)
	t_ui[? UI_Field.InstanceID] = iid
}
if (t_destory){
	ds_map_destroy(t_json)
}
return t_ui_id