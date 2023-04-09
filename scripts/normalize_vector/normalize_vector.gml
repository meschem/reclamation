// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function normalize_vector(_x, _y){
	 var mag = point_distance(0, 0, _x, _y)
	 var normalX = _x / mag
	 var normalY = _y / mag
	 
	 return [normalX, normalY]
}