
enum debugControllerStates {
	hidden,
	overlay,
	full
}

drawX = 5
drawY = 5
padding = 4
lineHeight = 2
lineSpacing = 4
width = 300
height = 500
draw = false
state = debugControllerStates.hidden

debugFont = font_dogica_s
bgAlpha = 1

textBlobs = []

objectChecks = [
	obj_spawner
]
