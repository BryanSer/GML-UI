/// @func ui_utils_readSprite(data)
/// @desc 读取设定的精灵 若传入字符串则直接读取对应精灵 否则按ds_map读取
/// @arg {string|ds_map} data
if(is_string(argument0)){
	return asset_get_index(argument0)
}
if(!variable_global_exists("g_ui_cacheImgSprite")){
	global.g_ui_cacheImgSprite =ds_map_create()
}
if(!ds_exists(argument0,ds_type_map)){
	return noone
}
var data = argument0
var fname = data[? "fname"]
if(fname == undefined){
	return noone
}
var imgnum = getOrDefault(data, "imgnum", 1)
var removeback = getOrDefault(data, "removeback",false)
var smooth = getOrDefault(data, "smooth", false)
var xorig = getOrDefault(data, "xorig", 0)
var yorig = getOrDefault(data, "yorig", 0)
var cache =  fname + "|" + string(imgnum) + "|" + string(removeback) + "|" + string(smooth) + "|" + string(xorig) + "|" + string(yorig)
var get = global.g_ui_cacheImgSprite[? cache]
if(get != undefined){
	return get
}
get = sprite_add(fname, imgnum, removeback, smooth, xorig, yorig)
global.g_ui_cacheImgSprite[? cache] = get

return get

