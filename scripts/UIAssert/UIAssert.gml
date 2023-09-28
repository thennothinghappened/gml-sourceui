/// Assert that a condition is true, or throw an error.
function UIAssert(condition/*: bool*/, message/*: string*/) {
    if (!condition) {
        throw message;
    }
}