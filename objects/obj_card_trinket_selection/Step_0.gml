
event_inherited();

if (iconOverlay == spr_none) {
	switch (trinket.rarity) {
		case enumRarity.magic:
			iconOverlay = spr_icon_trinket_border_green
		break
	
		case enumRarity.rare:
			iconOverlay = spr_icon_trinket_border_blue
		break
	
		case enumRarity.legendary:
			iconOverlay = spr_icon_trinket_border_purple
		break
		
		default:
			iconOverlay = spr_icon_trinket_border_white
		break
	}
}
