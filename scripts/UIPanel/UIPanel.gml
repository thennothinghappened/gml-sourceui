/// @param {Real} x Initial x
/// @param {Real} y Initial y
/// @param {Real} w Initial width
/// @param {Real} h Initial height
/// @param {Struct.UIElement} child
function UIPanel(x, y, w, h, child) : UISurface([child]) constructor {
	
	self.x = x;
	self.y = y;
	self.w = w;
	self.h = h;
	
	self.surface_draw = method(self, draw);
	
	_draw_panel = function() {
		draw_rectangle_color(0, 0, self.w, self.h, c_red, c_green, c_blue, c_orange, false);
	}
	
	_draw_content = function() {
		self.children[0]._draw(self.w, self.h);
		draw_surface(self.children[0].surface, 0, 0);
	}
	
	draw = function(w, h) {
		self.w = w;
		self.h = h;
		
		self._draw_panel();
		self._draw_content();
	}
	
	measure = function() {
		return new UIBoxSize(self.w, self.h);
	}
	
	get_focused = function(mouse_x, mouse_y) {
		return self.children[0]._get_focused(mouse_x, mouse_y);
	}
	
	_move = function(x, y) {
		self.x = x;
		self.y = y;
		update();
	}
	
}