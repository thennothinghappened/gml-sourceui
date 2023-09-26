/// @desc Initialise UI

window = new UIWindow([
	new UIPanel(200, 100, 200, 200, [
		new UIColumn([
			new UIText("hi!"),
			new ExampleButton("blah")
		])
	]),
	new UIPanel(400, 300, 300, 250, [
		new UIText("stuff")
	])
]);

focus = undefined;