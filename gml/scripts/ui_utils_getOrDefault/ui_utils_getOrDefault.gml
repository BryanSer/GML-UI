/// @func ui_utils_getOrDefault(map,key,default)
/// @desc 获取map元素或返回默认值 key中'.'会作为子map的分割符
/// @arg {ds_map} map
/// @arg {string} key
/// @arg {any} default
var key = argument1
var count = string_count(".", key)
if(count > 0){
	var fkey = ""
	var length = string_length(key)
	for(var i = 1; i <= length; i++){
		var at = string_char_at(key, i)
		if(at == "."){
			var sub = string_copy(key, i + 1, length - i)
			var map = argument0[? fkey]
			if(map == undefined){
				return argument2
			}else{
				return ui_utils_getOrDefault(map, sub, argument2)
			}
		} else {
			fkey = fkey + at
		}
	}
}
var get = argument0[? key]
if(get == undefined){
	return argument2
}else {
	return get
}