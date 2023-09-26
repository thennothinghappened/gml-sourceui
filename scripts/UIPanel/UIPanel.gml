function UIPanel(x, y, w, h, children) : UISurface(children) constructor {
	
	self.x = x;
	self.y = y;
	self.w = w;
	self.h = h;
	
	self.surface_draw = method(self, draw);
	
	draw = function(w, h) {
		self.w = w;
		self.h = h;
		
		draw_rectangle_color(0, 0, self.w, self.h, c_red, c_green, c_blue, c_orange, false);
		
		self.surface_draw(w, h);
		
	}
	
	focused = function(mouse_x, mouse_y) {
		if (self.num_children > 0) {
			return self.children[0]._focused(mouse_x, mouse_y);
		}
		
		return undefined;
	}
	
	_move = function(x, y) {
		self.x = x;
		self.y = y;
		self.has_update = true;
	}
	
}