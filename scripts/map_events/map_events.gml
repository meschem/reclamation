///@description   Group of functions for map events
function map_events(){}

///@description						Starts an event
///@param {string}	_name			Name of the event
///@param {string}	_description	Description of the event
///@param {real}	_length			Length of event in frames
///@param {real}	_maxCount		Max count of things to use
function event_start(_name, _description, _length, _maxCount = 0) {
	with (obj_event_controller) {
		if (state == eventStates.active) {
			event_end("Event ended early")
		}
	
		state = eventStates.active
		name = _name
		description = _description
		length = _length
		maxCount = _maxCount
	
		count = 0
		time = 0
		
		textBlocks = []
	}
}

///@description						Adds an amount to the event
///@param {real} _amount			Amount to add to counter
function event_add_count(_amount = 1) {
	with (obj_event_controller) {
		count += _amount
	}
}

///@description						Ends an event
///@param {string} _notification	Notification to add
function event_end(_notification) {
	with (obj_event_controller) {
		state = eventStates.inactive
	}	
}
