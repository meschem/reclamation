
if (open && (openedOn - age) < stf(10)) {
    draw_set_font(font_alagard)
    draw_set_color(c_black)
    draw_text(openTextLocation.x + 1, openTextLocation.y + 1, openTextString)
    draw_set_color(c_white)
    draw_text(openTextLocation.x, openTextLocation.y, openTextString)
    
    draw_set_font(font_pxlxxl_m)    
}

