function UIText(str) : UIElement() constructor {

	self.str = str;
	
	draw = function(w, h) {
		draw_text(0, 0, self.str);	
	}
	
	set_string = function(str) {
		self.str = str;
		update();
	}

}