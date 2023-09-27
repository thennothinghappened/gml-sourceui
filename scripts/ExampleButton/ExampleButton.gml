function ExampleButton(str) : UIButton([ new UIText(str) ]) constructor {
	
	click_end = function() {
		var text = self.children[0];
		text.set_string(text.str + "!");
	}
	
}