
event_inherited()

name = "Great-hawk Talon"
description = "Formed to match the prowess of fierce birds of war."

cooldown = stf(5)
projectileCount = [5, 7]
statsSpecial = ["Increases projectile count of your weapon on a cooldown."]

maxLevel = 2

maxCd = cooldown
curCd = 0

onStep = function() {
    curCd++
}

getProjectileCount = function() {
    if (curCd >= maxCd) {
        curCd = 0
        
        return projectileCount[level - 1]
    }
    
    return 0
}