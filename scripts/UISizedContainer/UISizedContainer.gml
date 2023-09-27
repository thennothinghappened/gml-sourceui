/// @param {Struct.UIElement} child
/// @param {Struct.UIBoxSize} size
function UISizedContainer(child, size) : UISurface([child]) constructor {
	
	self.size = size;
	
	measure = function() {
		return self.size;
	}
}