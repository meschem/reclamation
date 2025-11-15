// 1. CHECK: Make sure the surface exists before trying to draw it.

draw_surface(application_surface, 0, 0)

if (surface_exists(reflection_surface))
{
	create_toaster("drawing surface")
    // 2. DISPLAY: Draw the entire surface at screen position (0, 0).
    // You should see a large red rectangle filling the top-left of your screen.
    draw_surface(reflection_surface, 0, 0); 
}