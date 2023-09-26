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
	
	click_end = function() {
		
		if (self.num_children > 0) {
			var first_child = self.children[0];
			
			if (instanceof(first_child) == "UIText") {
				first_child.set_string(first_child.str + "!");
			}
		}
		
	}
	
}