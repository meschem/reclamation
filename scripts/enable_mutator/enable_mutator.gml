///@description						Enables a mutator
///@param {id.Instance} _mutator	Mutator to enable
function enable_mutator(_mutator) {
	with (_mutator) {
		enabled = true
		
		_mutator.onEnable()
	}
}