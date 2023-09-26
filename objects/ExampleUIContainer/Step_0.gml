/// @desc Handle UI interaction

var new_focus = window._get_focused(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));
var mouse_pressed = device_mouse_check_button_pressed(0, mb_left);
var mouse_released = device_mouse_check_button_released(0, mb_left);

if (new_focus == focus) {
	
	if (focus == undefined) {
		return;
	}
	
	if (mouse_pressed) {
		focus.click_start();
	}
	
	if (mouse_released) {
		focus.click_end();
	}
	
	return;
}


if (focus != undefined) {
	focus.focus_end();
		
	if (mouse_released) {
		focus.click_end();
	}
}
	
if (new_focus != undefined) {
	new_focus.focus_start();
	
	if (mouse_pressed) {
		focus.click_start();
	}
}
	
focus = new_focus;