/// @param {Array<Struct.UIElement>} children
function UIColumn(children) : UISurface(children) constructor {
	
	self.heights = undefined;
	
	draw = function(w, h) {
		var draw_height = 0;
		
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			var next_height = self.heights[i];
			
			child._draw(w, next_height);
			draw_surface(child.surface, 0, draw_height);
			
			draw_height += next_height;
		}
	}
	
	measure = function() {
		var width = 0;
		var height = 0;
		
		self.heights = [];
		
		for (var i = 0; i < self.num_children; i ++) {
			var child = self.children[i];
			var size = child.measured_size;
			
			var _width = (size == undefined ? undefined : size.width);
			var _height = (size == undefined ? undefined : size.height);
			
			if (_width != undefined && _width.size > width) {
				width = _width.size;
			}
			
			if (_height == undefined) {
				var h = height / i;
				height += h;
				self.heights[i] = h;
				
				continue;
			}
			
			height += size.height.size;
			self.heights[i] = size.height.size;
		}
		
		return new UIBoxSize(width, height);
	}
	
	self.parent_init = method(self, init);
	
	_find_focused_child = function(mouse_x, mouse_y) {
		var draw_height = 0;
		
		for (var i = 0; i < self.num_children; i ++) {
			var next_height = self.heights[i];
			var child_size = self.children[i].measured_size;
			
			if (
				mouse_y >= draw_height &&
				mouse_y < draw_height + next_height &&
				(child_size == undefined
					? true
					: (child_size.width == undefined
						? true
						: child_size.width.size >= mouse_x
					)
				)
			) {
				return {
					child: self.children[i],
					mouse_x: mouse_x,
					mouse_y: mouse_y - draw_height
				};
			}
			
			draw_height += next_height;
		}
	}
}