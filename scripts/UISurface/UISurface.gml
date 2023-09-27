/// @param {Array<Struct.UIElement>} children
function UISurface(children) : UITreeElement(children) constructor {
	
	draw = function(w, h) {
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			
			child._draw(_child_get_w(child), _child_get_h(child));
			
			draw_surface(child.surface, _child_get_x(child), _child_get_y(child));
		}
	}
	
	measure = function() {
		var max_width = 0;
		var max_height = 0;
		
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			
			var _width = _child_get_w(child);
			var _height = _child_get_h(child);
			
			if (_width > max_width) {
				max_width = _width;
			}
			
			if (_height > max_height) {
				max_height = _height;
			}
		}
		
		return new UIBoxSize(max_width, max_height);
	}
	
	/// @param {Struct.UIElement} child
	_child_get_x = function(child) {
		return 0;
	}
	
	/// @param {Struct.UIElement} child
	_child_get_y = function(child) {
		return 0;
	}
	
	/// @param {Struct.UIElement} child
	_child_get_w = function(child) {
		var size = child.measured_size;
		if (size == undefined || size.width == undefined) {
			return 0;
		}
		
		return size.width.size;
	}
	
	/// @param {Struct.UIElement} child
	_child_get_h = function(child) {
		var size = child.measured_size;
		if (size == undefined || size.height == undefined) {
			return 0;
		}
		
		return size.height.size;
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
	
	_get_focused = function(mouse_x, mouse_y) {
		var found = _find_focused_child(mouse_x, mouse_y);
		
		if (found == undefined) {
			return get_focused(mouse_x, mouse_y);
		}
		
		var res = found.child._get_focused(found.mouse_x, found.mouse_y);
		
		if (res == undefined) {
			return get_focused(mouse_x, mouse_y);
		}
		
		return res;
	}
	
	get_focused = function(mouse_x, mouse_y) {
		return undefined;
	}
	
}