
event_inherited()

if (state == enemyStates.normal) {
    draw_sprite(spr_storm_mage_orb, floor(age / 3), x + orbOffset.x, y + orbOffset.y)
} else if (state == enemyStates.abilityCharging) {
    draw_sprite(spr_lightning_orb_charging, floor(age / 3), x + orbOffset.x, y + orbOffset.y)
}
