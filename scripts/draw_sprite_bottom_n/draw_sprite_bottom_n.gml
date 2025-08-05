/// @desc								Draw only the bottom `n` pixels of a sprite, full width.
/// @param {asset.GMSprite} _spr        The sprite index
/// @param {real} _subimg		        The sprite sub-image
/// @param {real} _x				   	X pos
/// @param {real} _y					Y pos
/// @param {real} _n					Number of pixels to draw
function draw_sprite_bottom_n(_spr, _subimg, _x, _y, _n){
	var spr_height = sprite_get_height(_spr)
    var spr_width = sprite_get_width(_spr)

    // Clamp n to sprite height
    _n = clamp(_n, 0, spr_height)

    // Calculate source Y within the sprite texture
    var sy = spr_height - _n
	
    draw_sprite_part(
        _spr,
        _subimg,
        0, sy,                      // source x, y (top-left of the cropped area)
        spr_width, 
		_n,              // width, height of the cropped area
        _x, 
		_y + sy
    )
}