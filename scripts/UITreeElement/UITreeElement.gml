/// @param {Array<Struct.UIElement>} children
function UITreeElement(children) : UIElement() constructor {
	
	self.children = children;
	self.num_children = array_length(self.children);
	
	_find_focused_child = function(mouse_x, mouse_y) {
		throw "Not implemented";
	}
	
	_focused = function(mouse_x, mouse_y) {
		var child = self._find_focused_child(mouse_x, mouse_y);
		
		if (child == undefined) {
			return self.focused(mouse_x, mouse_y);	
		}
		
		return child._focused(mouse_x, mouse_y);
	}
	
	_on_child_update = function() {
		self.has_update = true;
	}
	
}