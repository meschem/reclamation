/// @description Insert description here
// You can write your code in this editor

if (!drawTest) {
	return 0
}

draw_set_colour(c_black)
draw_rectangle(300, 20, 300 + maxWidth, 500, false)

draw_set_font(font_aseprite);

// Call the script to draw the highlighted, wrapped text
draw_highlighted_text(
    300,             // x
    20,             // y
    textToDraw,   // text
    maxWidth,      // max_width
    global.colorMapStruct,   // color_map_struct (the struct we created)
    12,    // line_height
    global.COLOR_DEFAULT // default_color
);

draw_text_ext(
	300,
	240,
	textToDraw,
	0,
	maxWidth
)