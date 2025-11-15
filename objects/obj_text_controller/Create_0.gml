
global.COLOR_HEALTH = c_red
global.COLOR_MANA = c_blue
global.COLOR_DEFAULT = c_white

colorStruct = {
    Health: global.COLOR_HEALTH,
    Mana: global.COLOR_MANA,
    Critical: c_yellow,
    XP: c_lime,
    Level: c_fuchsia
}

drawTest = false

textToDraw = "Core stat.\n\nA precise representation of how many cinder blocks your can chop through in a single blow.\n\n * Increases |Physical_Damage| by 1 per point.\n * Increases |Knockback| by 1 per point.\n * Increases |HP| by 1 per 10 points."
//textToDraw = "I did play and beat 2 Juris last night, I think I 2-0'd each. small pool and all, but I actually relied on being a bit aggressive myself which I think works fairly well against Juri. I didn't realize how her charges worked before"
maxWidth = 200
lineHeight = string_height("A")
