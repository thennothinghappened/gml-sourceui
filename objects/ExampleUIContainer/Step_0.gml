/// @desc Handle UI interaction

var focus =
	window._focused(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0));

if (focus != undefined) {
	UILog($"Focused element = {instanceof(focus)}")
}