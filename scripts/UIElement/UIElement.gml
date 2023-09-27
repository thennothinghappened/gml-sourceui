function UIElement() constructor {
	
	self.surface = surface_create(1, 1);
	self.has_update = true;
	self.parent = undefined;
	
	self.measured_size = undefined;
	
	self.mouse_last_x = 0;
	self.mouse_last_y = 0;
	self._on_update = function() {};
	
	/// @ignore
	/// @desc Boilerplate, prepare the surface to work in with new sizing.
	///
	/// @param {Real} w Given width to work in
	/// @param {Real} h Given height to work in
	_surface_prep = function(w, h) {
		if (!surface_exists(self.surface)) {
			self.surface = surface_create(w, h);
			
			update();
		}
		
		if (surface_get_width(self.surface) != w || surface_get_height(self.surface) != h) {
			surface_free(self.surface);
			self.surface = surface_create(w, h);
			
			update();
		}
	}
	
	/// @ignore
	/// @desc Boilerplate draw function, taking in a width and height
	/// given for the element to draw itself within.
	///
	/// @param {Real} w Given width to work in
	/// @param {Real} h Given height to work in
	_draw = function(w, h) {
		
		if (w < 1 || h < 1) {
			self.has_update = false;
			return;
		}
		
		self._surface_prep(w, h);
		
		if (!self.has_update) {
			return;
		}
		
		var ret_target = surface_get_target();
		
		// when previous surface was the app surface,
		// the target is -1. attempting to set to -1 crashes
		// so we ignore it as resetting target effectively
		// does the same thing.
		if (ret_target != -1) {
			surface_reset_target();
		}
		
		surface_set_target(self.surface);
		
		draw_clear_alpha(c_white, 0);
		self.draw(w, h);
		
		surface_reset_target();
		
		if (ret_target != -1) {
			surface_set_target(ret_target);
		}
		
		self.has_update = false;
		
	}
	
	/// @desc Measure the space this element requires minimally to draw within.
	/// If unspecified (`undefined`), the parent element chooses a suitable default.
	/// 
	/// @returns {Struct.UIBoxSize|undefined}
	measure = function() {
		UITodo;
	}
	
	/// @desc Automatically called init function to handle setting up
	/// events and linkage with the parent element.
	///
	/// @param {Function} _on_update Function to be called when this element updates
	/// @param {Struct.UITreeElement} _parent The parent element
	_init = function(_on_update, _parent) {
		self._on_update = _on_update;
		self._parent = _parent;
		
		self.update();
		
		self.init();
	}
	
	/// @desc Called during `_init`. This function allows child elements to
	/// run setup logic if needed. This function will not run at the top level.
	init = function() {
		return;
	}
	
	/// @desc Custom draw function for this element.
	/// Elements must implement!
	///
	/// @param {Real} w Given width to work in
	/// @param {Real} h Given height to work in
	draw = function(w, h) {
		UITodo;
	}
	
	/// @desc Find the focused element. For a regular element, this is either `self`
	/// or `undefined` if unfocusable. Elements with children may implement this differently,
	/// and descend the tree to find the relevant child in focus.
	/// 
	/// @param {Real} mouse_x Relative mouse X in the element's bounds
	/// @param {Real} mouse_y Relative mouse Y in the element's bounds
	/// @returns {Struct.UIElement|undefined}
	_get_focused = function(mouse_x, mouse_y) {
		return self.get_focused(mouse_x, mouse_y);
	}
	
	// TODO: `get_focused` and UI broadly should be usable without mouse.
	// Maybe need a distinction between focus and "hover", and able to keep
	// track of which element is being hovered.
	// This is why `self.parent` exists.
	
	/// @param {Real} mouse_x Relative mouse X in the element's bounds
	/// @param {Real} mouse_y Relative mouse Y in the element's bounds
	/// @returns {Struct.UIElement|undefined}
	get_focused = function(mouse_x, mouse_y) {
		return undefined;
	}
	
	/// @desc Called when the element becomes focused.
	focus_start = function() {
		return;
	}
	
	/// @desc Called when the element is no longer focused.
	focus_end = function() {
		return;
	}
	
	/// @desc Called when the mouse moves while over this element.
	///
	/// @param {Real} mouse_x Relative mouse X in the element's bounds
	/// @param {Real} mouse_y Relative mouse Y in the element's bounds
	mouse_move = function(mouse_x, mouse_y) {
		return;
	}
	
	/// @desc Called when the element is clicked.
	click_start = function() {
		return;
	}
	/// @desc Called when the element finishes being clicked.
	click_end = function() {
		return;
	}
	
	/// @desc MUST be called when the element is discarded, or
	/// will leak.
	_cleanup = function() {
		surface_free(self.surface);
	}
	
	/// @desc Called whenever this element has updated, and needs a re-render.
	/// If this element is a child of another (it generally is), it will trigger
	/// the given callback, which will usually mean marking the parent for re-render
	/// as well.
	update = function() {
		UILog($"Update: {instanceof(self)}");
		
		self.measured_size = self.measure();
		self.has_update = true;
		self._on_update();
	}
	
}