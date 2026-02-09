
//array_foreach(revealList, function() {
//	image_alpha = 1
//	revealed = true
//})

for (var i =0; i < array_length(revealList); i++) {
	revealList[i].image_alpha = 1
}

onDeath()
deathFx()
