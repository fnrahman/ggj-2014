package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	
	public class Player extends Entity
	{
		[Embed(source = "res/swing.png")]private const SWORDMAN: Class;
		public var sprSwordMan:Spritemap = new Spritemap(SWORDMAN, 256, 256);
		[Embed(source = "res/sword_hitbox_strip.png")] private const SWORD_PIXELMAP:Class;
		[Embed(source = "res/rectangle.png")] private const RECTANGLE:Class;

		public var speed : Number;
		
		public var hitboxMap:Spritemap = new Spritemap(SWORD_PIXELMAP, 256, 256);
		public var pixelMaps : Array = new Array(36);
		
		public function Player(x:int, y:int) 
		{
			Input.define("UP", Key.UP, Key.W);
			Input.define("DOWN", Key.DOWN, Key.S);
			Input.define("LEFT", Key.LEFT, Key.A);
			Input.define("RIGHT", Key.RIGHT, Key.D);
			this.x = x;
			this.y = y;
			speed = 5.0;
			
			sprSwordMan.add("attack", [0, 1, 2, 3, 3, 2, 1, 0], .25, false);
			graphic = sprSwordMan;
			
		
			sprSwordMan.originX = 129; sprSwordMan.originY = 142;
			hitboxMap.originX = 129; hitboxMap.originY = 142;
			
			(graphic as Image).centerOO();
			
			for (var i:int = 0; i < 36; i++) {
				hitboxMap.frame = i;
				pixelMaps[i] = new Pixelmask(hitboxMap.getBuffer(), -128, -128);
			}
			
			//this.mask = new Pixelmask(RECTANGLE, -16, -32);
			
		}
		
		
		override public function update():void 
		{
			if (Input.check("UP")) { y -= speed; }
			if (Input.check("DOWN")) { y += speed; }
			if (Input.check("LEFT")) { x -= speed; }
			if (Input.check("RIGHT")) { x += speed; }
		
			if (Input.mousePressed) { sprSwordMan.play("attack",true) }
			
			sprSwordMan.angle = FP.angle(x, y, Input.mouseX, Input.mouseY) + 270;
			var angle:int = FP.angle(x, y, Input.mouseX, Input.mouseY) + 270;
			
			var frameNumber:int = (angle % 360) / 10;
			hitboxMap.frame = frameNumber;
			
			this.mask = pixelMaps[frameNumber];
			
			if (collide("enemy", x, y)) {
				FP.screen.color = 0xF0FF0F;
			}
			else {
				FP.screen.color = 0xFFFFFF;
			}
			
			super.update();
		}
		
	}
	
}