
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

textToDraw = "The |Health| of the target dropped to zero after a |Critical| hit. Use your |Mana| wisely. This text should wrap to multiple lines automatically if it exceeds the maximum width specified, allowing you to display large amounts of information such as new quests or item descriptions. You gained |XP| and are now |Level| 10."
maxWidth = 300
lineHeight = string_height("A")
