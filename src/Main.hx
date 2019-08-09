import hxd.Key;

class Main extends hxd.App {
	var bmp:h2d.Bitmap;
	var shader:SineDeformShader;

	override function init() {
		bmp = new h2d.Bitmap(hxd.Res.bugs.toTile(), s2d);
		shader = new SineDeformShader();
		shader.speed = 1;
		shader.amplitude = .1;
		shader.frequency = .5;
		shader.texture = bmp.tile.getTexture();
		bmp.addShader(shader);
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
		//
		var mul:Float = 10;
		if (Key.isDown(Key.W)) {
			shader.speed = 0.2;
		}
		if (Key.isDown(Key.S)) {
			shader.speed = 2;
		}
		if (Key.isDown(Key.A)) {
			shader.amplitude += 0.1 / mul;
		}
		if (Key.isDown(Key.D)) {
			shader.amplitude -= 0.1 / mul;
		}
	}

	static function main() {
		hxd.Res.initLocal();
		new Main();
	}
}
