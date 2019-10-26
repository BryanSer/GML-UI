/// @func ui_utils_loadFileAsString(fname)
/// @arg {string|read}文件路径或fd
/// @desc 读取文件到字符串, 若传入字符串则会打开对应的文件 若传入real则读取传入的fd 
/// @desc 注意操作结束后会关闭文件读入流
var fd = argument0
if(is_string(fd)){
	fd = file_text_open_read(fd)
}
var read = ""
while(!file_text_eof(fd)){
	var line = file_text_readln(fd)
	read = read + line
}
file_text_close(fd)
return read