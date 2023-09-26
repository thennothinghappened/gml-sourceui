function UIElement() constructor {
	
	self.surface = surface_create(1, 1);
	self.has_update = true;
	
	self.mouse_last_x = 0;
	self.mouse_last_y = 0;
	self._on_update = function() {};
	
	_surface_prep = function(w, h) {
		if (!surface_exists(self.surface)) {
			self.surface = surface_create(w, h);
			
			update();
		}
		
		if (surface_get_width(self.surface) != w || surface_get_height(self.surface) != h) {
			surface_free(self.surface);
			self.surface = surface_create(w, h);
			
			update();
		}
	}
	
	_draw = function(w, h) {
		
		self._surface_prep(w, h);
		
		if (!self.has_update) {
			return;
		}
		
		var ret_target = surface_get_target();
		
		// when previous surface was the app surface,
		// the target is -1. attempting to set to -1 crashes
		// so we ignore it as resetting target effectively
		// does the same thing.
		if (ret_target != -1) {
			surface_reset_target();
		}
		
		surface_set_target(self.surface);
		
		draw_clear_alpha(c_white, 0);
		self.draw(w, h);
		
		surface_reset_target();
		
		if (ret_target != -1) {
			surface_set_target(ret_target);
		}
		
		self.has_update = false;
		
	}
	
	_init = function(_on_update) {
		self._on_update = _on_update;
	}
	
	draw = function(w, h) {
		throw "Not implemented";
	}
	
	_get_focused = function(mouse_x, mouse_y) {
		self.mouse_last_x = mouse_x;
		self.mouse_last_y = mouse_y;
		return self.get_focused(mouse_x, mouse_y);
	}
	
	get_focused = function(mouse_x, mouse_y) {
		return undefined;
	}
	
	
	focus_start = function() {
		return;
	}
	
	focus_end = function() {
		return;
	}
	
	click_start = function() {
		return;
	}
	
	click_end = function() {
		return;
	}
	
	_cleanup = function() {
		surface_free(self.surface);
	}
	
	update = function() {
		self.has_update = true;
		self._on_update();
	}
	
}