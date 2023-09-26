/// @desc Initialise UI

window = new UIWindow([
	new UIPanel(200, 100, 200, 200, [
		new UIColumn([
			new UIText("hi!"),
			new UIButton([
				new UIText("blah")
			])
		])
	]),
	new UIPanel(400, 300, 300, 250, [
		
	])
]);

focus = undefined;