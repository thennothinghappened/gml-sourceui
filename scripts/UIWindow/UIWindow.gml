/// @param {Array<Struct.UIPanel>} panels
function UIWindow(panels) : UISurface(panels) constructor {

	_child_get_x = function(child) {
		return child.x;
	}
	
	_child_get_y = function(child) {
		return child.y;
	}
	
	_child_get_w = function(child) {
		return child.w;
	}
	
	_child_get_h = function(child) {
		return child.h;
	}
	
	_init(function() {}, undefined);

}