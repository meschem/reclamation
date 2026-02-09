

// 1. CHECK and RECREATE: This is the most critical step!
if (!surface_exists(reflection_surface))
{
    var _view_w = 640; 
    var _view_h = 360; 
    reflection_surface = surface_create(_view_w, _view_h);
}

// 2. SET TARGET: Tell GMS2 to draw to the surface.
surface_set_target(reflection_surface);

// 3. DRAW ANYTHING: Draw the massive red box.
//    Note: Since (0,0) is the surface corner, we just draw right there.
draw_set_color(c_red);
draw_rectangle(0, 0, 1000, 1000, false); // Draw a 1000x1000 red box

// 4. RESET TARGET: Tell GMS2 to stop drawing to the surface.
surface_reset_target();