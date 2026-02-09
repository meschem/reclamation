/// @description					Creates a button that can be used for a menu
/// @param {string} displayText		Text to display on the button
/// @param {real}	behavior		On click behavior. Uses enum buttonOnClickBehaviors.
/// @param {real}	style			Display style. Uses enum buttonStyles.

/// @return {Id.Instance}

function create_button(displayText, behavior = buttonOnClickBehaviors.none, style = buttonStyles.orange) {
	var button = instance_create_depth(x, y, depths.ui - 100, obj_menu_button)
	
	button.displayText = displayText
	button.style = style
	button.onClick = behavior
	
	return button
}