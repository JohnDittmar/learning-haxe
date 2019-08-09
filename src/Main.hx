import h3d.scene.Object;
import h3d.pass.DefaultShadowMap;
import hxd.Key;
import h3d.scene.fwd.DirLight;

class Main extends hxd.App {
	var cache : h3d.prim.ModelCache;
	var skellyboi : Object;

	override function init() {
		cache = new h3d.prim.ModelCache();

		var skellyboi = cache.loadModel(hxd.Res.models.Skeleton);
		skellyboi.scale(0.1);
		s3d.addChild(skellyboi);
		s3d.camera.pos.set( -3, -5, 3);
		s3d.camera.target.z += 1;

		skellyboi.playAnimation(cache.loadAnimation(hxd.Res.models.Skeleton));
		// add lights and setup materials
		var dir = new DirLight(new h3d.Vector( -1, 3, -10), s3d);
		for( m in skellyboi.getMaterials() ) {
			var t = m.mainPass.getShader(h3d.shader.Texture);
			if( t != null ) t.killAlpha = true;
			m.mainPass.culling = None;
			m.getPass("shadow").culling = None;
		}
		s3d.lightSystem.ambientLight.set(0.4, 0.4, 0.4);

		var shadow = s3d.renderer.getPass(h3d.pass.DefaultShadowMap);
		shadow.power = 20;
		shadow.color.setColor(0x301030);
		dir.enableSpecular = true;

		new h3d.scene.CameraController(s3d).loadFromCamera();
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
			skellyboi.rotate(0.02);
		}

		if (Key.isDown(Key.S)) {
			skellyboi.rotate(-0.02);
		}
	}

	static function main() {
		hxd.Res.initLocal();
		new Main();
	}
}
