/// @description Draw Info
var runningOffset = 0

// Draw Sprite
draw_sprite_ext(
	sprite_index,
	image_index,
	x + focusOffsetX,
	y + drawOffsetY + focusOffsetY,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
)

if (state == buttonStates.flashing) {
	draw_sprite_ext(
		flashSprite,
		flashFrame,
		x,
		y,
		1,
		1,
		0,
		c_white,
		0.55
	)
}

if (state == buttonStates.spawning) {
	return 0
}

// Draw Icon
draw_sprite(
	ability.selectionIcon,
	0,
	x + menuOffset.x + 36,
	y + menuOffset.y - 9 + drawOffsetY
)

// Draw Name
draw_set_font(titleFont)
draw_set_color(titleTextShadowColor)

runningOffset = y + menuOffset.y + 32

var nameOffset = (width - string_width(ability.name)) / 2

draw_text(
	x + menuOffset.x + nameOffset + 1,
	runningOffset + 1,
	ability.name
)

//draw_set_color(titleTextColor)
draw_set_color(c_white)

draw_text(
	x + menuOffset.x + nameOffset,
	runningOffset,
	ability.name
)

// Draw Level
runningOffset += 19
draw_set_font(generalFont)

if (ability.level == 0) {
	draw_set_color(subTitleTextColor)
	
	draw_text(
		x + menuOffset.x + 45,
		runningOffset,
		"New Ability!"
	)		
} else {
	draw_text(
		x + menuOffset.x + 45,
		runningOffset,
		"Level"
	)
	
	draw_set_color(c_white)
	
	var _lvlString = string(ability.level) + " > "

	draw_text(
		x + menuOffset.x + 80,
		runningOffset,
		_lvlString
	)
	
	draw_set_color(global.colorDarkGreen)
	
	draw_text(
		x + menuOffset.x + 80 + string_width(_lvlString),
		runningOffset,
		string(ability.level + 1)
	)
}

// Draw Linebreak
runningOffset += 13

draw_sprite(
	spr_card_line_break, 0,
	x + menuOffset.x + 10,
	runningOffset
)

runningOffset += 17

// Draw Description
draw_set_font(bodyFont)
draw_set_color(bodyTextColor)

draw_text_ext(
	x + menuOffset.x + paddingX,
	runningOffset,
	ability.description,
	12,
	maxTextWidth
)

// Draw Stats
for (var i = 0; i < array_length(ability.stats); i++) {
    var stat = ability.stats[i]
	var drawString = stat.name + ": "
    var drawX = x + menuOffset.x + paddingX // string_width(nameString)
    var drawY = y + menuOffset.y + height - paddingY - (i * statSpacing)
	
	draw_set_color(bodyTextColor)
	
	draw_text(
		drawX, // x + menuOffset.x + paddingX,
		drawY, // y + menuOffset.y + height - paddingY - (i * statSpacing),
		drawString
	)
    
    drawX += string_width(drawString)
    
    if (ability.level == 0) {
        // use old method if ability is "New"    
        draw_set_color(statTextHighlightColor)
        
   	    draw_text(
      		drawX,
      		drawY, // y + menuOffset.y + height - paddingY - (i * statSpacing),
      		stat.getDisplayValue(ability.level)
      	)
    } else {
        // if ability has been acquired, new draw
        draw_set_color(global.colorGray)
        
        drawString = stat.getDisplayValueSimple(ability.level) + " > "
        draw_text(drawX, drawY, drawString)
        
        drawX += string_width(drawString)
        draw_set_color(statTextHighlightColor)
        drawString = stat.getDisplayValueSimple(ability.level + 1, true)
        draw_text(drawX, drawY, drawString)
    }
}
