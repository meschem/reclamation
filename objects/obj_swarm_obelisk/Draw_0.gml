
draw_self()

draw_sprite(
    difficultyIcon,
    difficultyBoost,
    x, y - 12
)

if (playerInActiveRange) {
    draw_sprite(spr_g_to_activate, 0, x + 43, y - 32)
}