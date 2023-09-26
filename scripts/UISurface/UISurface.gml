/// @param {Array<Struct.UIElement>} children
function UISurface(children) : UITreeElement(children) constructor {
	
	draw = function() {
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			
			child._draw(_child_get_w(child), _child_get_h(child));
			
			draw_surface(child.surface, _child_get_x(child), _child_get_y(child));
		}
	}
	
	_child_get_x = function(child) {
		return 0;	
	}
	
	_child_get_y = function(child) {
		return 0;
	}
	
	_child_get_w = function(child) {
		return surface_get_width(self.surface);
	}
	
	_child_get_h = function(child) {
		return surface_get_height(self.surface);	
	}
	
	_find_focused_child = function(mouse_x, mouse_y) {
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			
			var rel_mouse_x = mouse_x - _child_get_x(child);
			var rel_mouse_y = mouse_y - _child_get_y(child);
			
			if (
				rel_mouse_x >= 0 &&
				rel_mouse_y >= 0 &&
				rel_mouse_x <= _child_get_w(child) &&
				rel_mouse_y <= _child_get_h(child)
			) {
				return {
					child: child,
					mouse_x: rel_mouse_x,
					mouse_y: rel_mouse_y
				};
			}
		}
		
		return undefined;
	}
	
	_focused = function(mouse_x, mouse_y) {
		var found = _find_focused_child(mouse_x, mouse_y);
		
		if (found == undefined) {
			return self.focused(mouse_x, mouse_y);
		}
		
		var res = found.child._focused(found.mouse_x, found.mouse_y);
		
		if (res == undefined) {
			return self.focused(mouse_x, mouse_y);
		}
		
		return res;
	}
	
	focused = function(mouse_x, mouse_y) {
		return undefined;
	}
	
}