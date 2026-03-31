
event_inherited()

if (state == enemyStates.abilityCharging) {
    draw_sprite(spr_fire_orb_charging, floor(age / 3), x + fireWaveChargeDrawOffset.x, y + fireWaveChargeDrawOffset.y)
}
