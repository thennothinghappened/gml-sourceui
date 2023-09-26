function UIButton(children) : UISurface(children) constructor {
	
	self.surface_draw = method(self, draw);
	
	draw = function(w, h) {
		
		if (self.draw_focused)
		draw_rectangle(0, 0, w, h, true);
		
		self.surface_draw(w, h);
		
	}
	
	focused = function(mouse_x, mouse_y) {
		self.has_update = true;
		return self;
	}
	
	click = function() {
		show_message("uwu");
	}
	
}