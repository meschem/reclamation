// Inherit the parent event
event_inherited()

if (tellLineDraw) {
    draw_sprite_ext(
        spr_dotted_line_tell,
        tellLineFrame,
        x + tellLineOffsetX,
        y + tellLineOffsetY,
        1, 1,
        tellLineAngle,
        c_white,
        1
    )
    //draw_sprite(spr_dotted_line_tell, tellLineFrame, x + tellLineOffsetX, y + tellLineOffsetY)
}
