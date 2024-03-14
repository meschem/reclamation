/// @description Init

event_inherited();

xp = 200
hpMax = 60
hp = hpMax

move_wander_setup()

baddie_teleport_enable(seconds_to_frames(6))

fireCdMax = 320
fireCdCur = fireCdMax
fireCount = 8
fireObject = obj_enemy_red_shot
