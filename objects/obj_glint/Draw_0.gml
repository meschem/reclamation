
shader_set(shd_glow)

shader_set_uniform_f(u_texel_size, texel_w, texel_h)
shader_set_uniform_f(u_glow_size, 7.0)
shader_set_uniform_f(u_glow_color, 0.0, 1.0, 1.0, 1.0)

draw_sprite_ext(starSprite, 0, x, y, 1.2, 1.2, starAngle, c_white, 1)
shader_reset()

draw_self()
