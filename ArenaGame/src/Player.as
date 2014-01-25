package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		[Embed(source = "res/player.png")] private const STILL:Class;
		
		public var speed : Number;
		public function Player(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			speed = 5.0;
			graphic = new Image(STILL);
		}
		
		override public function update():void 
		{
			if (Input.check(Key.W)) { y -= speed; }
			if (Input.check(Key.S)) { y += speed; }
			if (Input.check(Key.A)) { x -= speed; }
			if (Input.check(Key.D)) { x += speed; }
			
			speed += 0.1;
			super.update();
		}
		
	}

}