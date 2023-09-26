function UIColumn(children) : UISurface(children) constructor {
	
	draw = function(w, h) {
		var child_h = floor(h / self.num_children);
		
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			
			child._draw(w, child_h);
			draw_surface(child.surface, 0, child_h * i);
		}
	}
	
	_find_focused_child = function(mouse_x, mouse_y) {
		var child_h = floor(surface_get_width(self.surface) / self.num_children);
		var picked = min(floor(mouse_y / child_h), self.num_children - 1);
		
		var child = self.children[picked];
		
		return {
			child: child,
			mouse_x: mouse_x,
			mouse_y: mouse_y - (picked * child_h)
		};
	}
	
}