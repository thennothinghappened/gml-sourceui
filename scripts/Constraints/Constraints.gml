/// Constraints supplied by a parent layout under which
/// a child must choose their size.
function UIConstraints(
    min_width/*: real*/,
    min_height/*: real*/,
    max_width/*: real*/,
    max_height/*: real*/
) constructor {
    
    UIAssert(max_width >= min_width, "max_width must be greater or equal to min_width");
    UIAssert(max_height >= min_height, "max_height must be greater or equal to min_height");
    
    self.min_width = min_width;
    self.min_height = min_height;
    self.max_width = max_width;
    self.max_height = max_height;
    
    self.fixed_width = (self.min_width == self.max_height);
    self.fixed_height = (self.min_height == self.max_height);
    
    self.has_bounded_width = (self.max_width != infinity);
    self.has_bounded_height = (self.max_height != infinity);
    
    self.is_zero = (self.max_width == 0 || self.max_height == 0);
    
    /// Takes another set of constraints, and returns the result of cooercing them
    /// into these constraints.
    constrain = function(other_constraints/*: UIConstraints*/) /*-> UIConstraints*/ {
        
    }
    
}