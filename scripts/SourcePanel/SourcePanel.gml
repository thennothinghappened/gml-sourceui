/// @desc Source Engine styled panel
/// @param {Real} x Initial x
/// @param {Real} y Initial y
/// @param {Real} w Initial width
/// @param {Real} h Initial height
/// @param {Struct.UIElement} child
function SourcePanel(x, y, w, h, child) : UIDraggablePanel(x, y, w, h, child) constructor {
	
	static header_height = 10;

	_draw_panel = function() {
		draw_set_alpha(0.6);
		draw_set_colour(c_grey);
		
		draw_rectangle(0, 0, self.w, self.h, false);
		
		draw_set_colour(c_white);
		draw_set_alpha(1);
	}
	
	_draw_content = function() {
		var wanted_size = self.children[0].measured_size;
		
		self.children[0]._draw(
			(wanted_size == undefined
				? self.w
				: (wanted_size.width == undefined
					? self.w
					: wanted_size.width.size
				)
			), self.h - header_height);
		draw_surface(self.children[0].surface, 0, header_height);
	}
	
	/// @param {Struct.UIElement} child
	_child_get_y = function(child) {
		return header_height;
	}
}