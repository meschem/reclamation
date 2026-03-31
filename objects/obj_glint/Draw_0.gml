
//shader_set(shd_glow)

//shader_set_uniform_f(u_texel_size, texel_w, texel_h)
//shader_set_uniform_f(u_glow_size, 7.0)
//shader_set_uniform_f(u_glow_color, 0.0, 1.0, 1.0, 1.0)
gpu_set_blendmode(bm_add)
draw_sprite_ext(starSprite, 0, x, y, 0.4, 0.4, starAngle, c_white, 0.6)
gpu_set_blendmode(bm_normal)

draw_self()
