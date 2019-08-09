import hxd.Key;

class Main extends hxd.App {
	var bmp:h2d.Bitmap;

	override function init() {
		bmp = new h2d.Bitmap(hxd.Res.bugs.toTile(), s2d);
		hxd.Window.getInstance().addEventTarget(onEvent);		
	}

	function onEvent(event:hxd.Event) {
		switch (event.kind) {
			case EKeyDown:
				trace('DOWN keyCode: ${event.keyCode}, charCode: ${event.charCode}');
			case EKeyUp:
				trace('UP keyCode: ${event.keyCode}, charCode: ${event.charCode}');
			case _:
		}
	}

	// on each frame
	override function update(dt:Float) {
		if (Key.isDown(Key.W)) {
			// Placeh-holder
		}
	}

	static function main() {
		hxd.Res.initLocal();
		new Main();
	}
}
