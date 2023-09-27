/// @param {String} str Initial text
function UIText(str) : UIElement() constructor {

	self.str = str;
	
	draw = function(w, h) {
		draw_text(0, 0, self.str);	
	}
	
	measure = function() {
		return new UIBoxSize(
			string_width(self.str),
			string_height(self.str)
		);
	}
	
	set_string = function(str) {
		self.str = str;
		update();
	}

}