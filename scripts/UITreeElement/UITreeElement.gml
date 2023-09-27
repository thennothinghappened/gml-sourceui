/// @param {Array<Struct.UIElement>} children
function UITreeElement(children) : UIElement() constructor {
	
	self.children = children;
	self.num_children = array_length(self.children);
	
	/// @param {Real} mouse_x
	/// @param {Real} mouse_y
	/// @returns {Struct|undefined}
	_find_focused_child = function(mouse_x, mouse_y) {
		throw "Not implemented";
	}
	
	init = function() {
		for (var i = 0; i < self.num_children; i ++) {
			self.children[i]._init(self._on_child_update, self);
		}
	}
	
	_get_focused = function(mouse_x, mouse_y) {
		var child = self._find_focused_child(mouse_x, mouse_y);
		
		if (child == undefined) {
			return self.get_focused(mouse_x, mouse_y);	
		}
		
		return child._get_focused(mouse_x, mouse_y);
	}
	
	_on_child_update = function() {
		update();
	}
	
	_cleanup = function() {
		surface_free(self.surface);
		
		for (var i = 0; i < self.num_children; i ++) {
			self.children[i]._cleanup();
		}
	}
	
}