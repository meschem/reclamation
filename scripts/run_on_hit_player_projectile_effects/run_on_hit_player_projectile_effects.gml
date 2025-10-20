///@description							Iterates through items to do stuff
///@param {id.Instance} _projectile		Projectile collecting
///@param {id.Instance} _target			Target being hit
///@param {bool} _critHit				If hit was critical
///@param {real} _damage				Scaled damage dealt after WUPGs
function run_on_hit_player_projectile_effects(_projectile, _target, _critHit, _damage) {
	var _owner = _projectile.owner
	var _isWeapon = _projectile.projectileType == projectileTypes.weapon
	
	// FIXME: Perf, iterate through equipped slots?
	with (obj_equipment) {
		if (owner == _owner && equipped) {
			if (_isWeapon) {
				onWeaponHit({
					projectile: _projectile,
					target: _target,
					critHit: _critHit,
					damage: _damage
				})
			} else {
				onAbilityHit({					
					projectile: _projectile,
					target: _target,
					critHit: _critHit,
					damage: _damage
				})
			}
		}
	}
}
