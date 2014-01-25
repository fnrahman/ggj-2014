package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	
	public class Player extends Entity
	{
		[Embed(source = "res/player.png")] private const STILL:Class;
		[Embed(source = "res/swing.png")]private const SWORDMAN: Class;
		public var sprSwordMan:Spritemap = new Spritemap(SWORDMAN, 256, 256);
	
		public var speed : Number;
		public var img: Image;
		
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
		
		}
		override public function update():void 
		{
			if (Input.check("UP")) { y -= speed; }
			if (Input.check("DOWN")) { y += speed; }
			if (Input.check("LEFT")) { x -= speed; }
			if (Input.check("RIGHT")) { x += speed; }
		
			if (Input.mousePressed) { sprSwordMan.play("attack",true) }
			
			sprSwordMan.angle = FP.angle(x, y, Input.mouseX, Input.mouseY) + 270;
			
			super.update();
		}
		
	}

}