/// @description Insert description here
// You can write your code in this editor

if (!drawTest) {
	return 0
}

draw_set_colour(c_black)
draw_rectangle(300, 20, 300 + maxWidth, 500, false)

draw_set_font(font_aseprite);

draw_highlighted_text(
    300,             
    20,             
    textToDraw,  
    maxWidth,      
    global.colorMapStruct,
    12,    
    global.COLOR_DEFAULT 
);

draw_text_ext(
	300,
	240,
	textToDraw,
	0,
	maxWidth
)