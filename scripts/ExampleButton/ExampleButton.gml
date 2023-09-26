function ExampleButton(str) : UIButton([ new UIText(str) ]) constructor {
	
	click_end = function() {
		var first_child = self.children[0];
		first_child.set_string(first_child.str + "!");
	}
	
}