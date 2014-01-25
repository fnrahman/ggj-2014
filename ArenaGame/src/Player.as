package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	public class Player extends Entity
	{
		[Embed(source = "res/player.png")] private const STILL:Class;
		
		public var speed : Number;
		public var img : Image;
		
		public function Player(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			speed = 5.0;
			graphic = img = new Image(STILL);
			img.originX = 129; img.originY = 142;
		}
		
		override public function update():void 
		{
			if (Input.check(Key.W)) { y -= speed; }
			if (Input.check(Key.S)) { y += speed; }
			if (Input.check(Key.A)) { x -= speed; }
			if (Input.check(Key.D)) { x += speed; }
			
			img.angle = FP.angle(x, y, Input.mouseX, Input.mouseY) + 270;
			
			super.update();
		}
		
	}

}