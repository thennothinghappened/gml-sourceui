/// @param {Array<Struct.UIPanel>} panels
function UIWindow(panels) : UITreeElement(panels) constructor {
	
	draw = function() {
		var num_panels = array_length(self.children);
		
		for (var i = 0; i < num_panels; i ++) {
			var panel = self.children[i];
			
			panel._draw(panel.w, panel.h);
			
			draw_surface(panel.surface, panel.x, panel.y);
		}
	}
	
}