enum Sizing {
	/// @desc An exact pixel amount
	PIXELS
}

/// @desc Sizing types for element measurement
/// a given element measures the minimum size it needs
/// to draw itself, and depending on its parent may
/// be given this area, or a larger size.
///
/// @param {Real} size
/// @param {Enum.Sizing} units
function UISize(size, units) constructor {
	self.size = size;
	self.units = units;
}

/// @desc A given size vertically and horizontally that
/// an element can draw itself within minimally.
/// @param {Real|undefined} width
/// @param {Real|undefined} height
/// @param {Enum.Sizing} width_units
/// @param {Enum.Sizing} height_units
function UIBoxSize(width, height, width_units = Sizing.PIXELS, height_units = Sizing.PIXELS) constructor {
	self.width = width == undefined ? undefined : new UISize(width, width_units);
	self.height = height == undefined ? undefined : new UISize(height, height_units);
}