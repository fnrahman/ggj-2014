package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	public class Player extends Entity
	{
		[Embed(source = "res/player.png")] private const STILL:Class;
		public function Player(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			graphic = new Image(STILL);
		}
		
		override public function update():void 
		{
			
			super.update();
		}
		
	}

}