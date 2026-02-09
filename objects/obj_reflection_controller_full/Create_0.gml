/// NOT CURRENTLY USED, SEE obj_reflection_controller

application_surface_draw_enable(false)
gpu_set_tex_filter(false)

surfaceMirror = -1

surfaceWidth = view_width()
surfaceHeight = view_height()

surfaceMirror = surface_create(surfaceWidth, surfaceHeight)

viewX = 0
viewY = 0

camera = view_camera[0]

age = 0