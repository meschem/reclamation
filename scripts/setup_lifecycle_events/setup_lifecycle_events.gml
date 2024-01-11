///@description						Sets up skeleton for lifecycle events
///@param {id.Instance} inst		Instance to apply events to
function setup_lifecycle_events(inst = id) {
	enum enumLifeCycleEvents {
		create,
		destroy,
		stepFirst,
		stepBegin,
		stepEnd,		
		collide,
		targetHit,
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

///@param {real} _type				Adds a lifecycle event
///@param {function} _func
///@param {id.Instance} _inst
function add_lifecycle_event(_type, _func, _inst = id) {
	array_push(_inst.lifeCycleEvents[_type], _func)
}

///@description						Runs all lifecycle events of a given type
///@param {real} _type
///@param {struct} _vars
///@param {id.Instance} _inst
function run_lifecycle_events(_type, _vars = {}, _inst = id) {	
	with (_inst) {
		for (var i = 0; i < array_length(lifeCycleEvents[_type]); i++) {
			lifeCycleEvents[_type][i](_vars, _inst)
		}
	}
}
