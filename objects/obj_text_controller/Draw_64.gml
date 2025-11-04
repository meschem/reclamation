/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_aseprite);

// Call the script to draw the highlighted, wrapped text
draw_highlighted_text(
    20,             // x
    20,             // y
    textToDraw,   // text
    maxWidth,      // max_width
    colorStruct,   // color_map_struct (the struct we created)
    lineHeight,    // line_height
    global.COLOR_DEFAULT // default_color
);
