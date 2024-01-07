///@description						Applies lifecycle events to a given object
///@param {id.Instance} inst		Instance to apply events to
function setup_lifecycle_events(inst = id) {
	enum enumLifeCycleEvents {
		create,
		destroy,
		stepFirst,
		stepBegin,
		stepEnd,		
		collide,
		damageEntity,
		criticalHit,
		length
	}
	
	with inst {
		for (var i = 0; i < enumLifeCycleEvents.length; i++) {
			if (i < enumLifeCycleEvents.length - 1) {
				array_push(lifeCycleEvents, [])
			}
		}
	}
}

///@param {real} type
///@param {function} func
///@param {id.Instance} inst
function add_lifecycle_event(_type, _func, _inst = id) {
	array_push(_inst.lifeCycleEvents[_type], _func)
}

///@param {real} type
///@param {id.Instance} inst
function run_lifecycle_events(_type, _inst = id, _vars = {}) {
	with (_inst) {
		for (var i = 0; i < array_length(lifeCycleEvents[_type]); i++) {
			lifeCycleEvents[_type][i](_inst, _vars)
		}
	}
}
