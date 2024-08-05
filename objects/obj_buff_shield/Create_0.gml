
event_inherited()

shield = true
//invuln = true

hp = 50
hpMax = 50

damageDelayCdMax = seconds_to_frames(0.5)
damageDelayCdCur = 0

onDamage = function() {
	audio_play_sound(snd_hard_hit, 0, false)
}
