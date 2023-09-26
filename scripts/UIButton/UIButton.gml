/// @param {Array<Struct.UIElement>} children
function UIButton(children) : UISurface(children) constructor {
	
	self.surface_draw = method(self, draw);
	self.focused = false;
	
	draw = function(w, h) {
		
		draw_rectangle(0, 0, w, h, !self.focused);
		
		self.surface_draw(w, h);
		
	}
	
	get_focused = function(mouse_x, mouse_y) {
		return self;
	}
	
	focus_start = function() {
		self.focused = true;
		update();
	}
	
	focus_end = function() {
		self.focused = false;
		update();
	}
	
}