
application_surface_draw_enable(false)

// 1. Surface ID variable
reflection_surface = -1; 

// 2. Define the size (let's use your low resolution for the test)
var _view_w = 640; 
var _view_h = 360; 

// 3. Create the surface.
reflection_surface = surface_create(_view_w, _view_h);