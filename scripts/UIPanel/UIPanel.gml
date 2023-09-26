function UIPanel(x, y, w, h, children) : UITreeElement(children) constructor {
	
	self.x = x;
	self.y = y;
	self.w = w;
	self.h = h;
	
	function draw(w, h) {
		//self.w = w;
		self.h = h;
		
		self.w = random_range(w - 20, w + 20);
		draw_rectangle_color(0, 0, self.w, self.h, c_red, c_green, c_blue, c_orange, false);
	}
	
}