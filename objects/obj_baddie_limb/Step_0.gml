/// @description Reposition

age++

if (!instance_exists(owner)) {
	instance_destroy()
	
	return 0
}


ownerDrawInfo.damagedFlashDuration = owner.damagedFlashDuration
ownerDrawInfo.floatOffset = owner.floatOffset
ownerDrawInfo.rotation = owner.rotation
ownerDrawInfo.damageXScaleMultiplier = owner.damageXScaleMultiplier
ownerDrawInfo.damageYScaleMultiplier = owner.damageYScaleMultiplier


x = owner.x + offset.x
y = owner.y + offset.y

depth = owner.depth + depthOffset

damagedOn = owner.damagedOn
