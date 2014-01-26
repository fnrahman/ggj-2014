package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Combatant
	{
		[Embed(source = "res/rectangle.png")] public const RECTANGLE:Class;
		
		public function Enemy(x:Number=0, y:Number=0) 
		{
			super(x, y);
			type = "enemy";
			this.graphic = new Image(RECTANGLE);
			this.x = x;
			this.y = y;
			(graphic as Image).centerOO();
			this.mask = new Pixelmask(RECTANGLE, -16, -32);
		}
		
	}

}