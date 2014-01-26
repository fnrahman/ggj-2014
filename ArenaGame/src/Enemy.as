package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Combatant
	{
		[Embed(source = "res/rectangle.png")] public const RECTANGLE:Class;
		
		public var target : Player;
		public function Enemy(x:Number=0, y:Number=0) 
		{
			super(x, y);
			type = "enemy";
			graphic = sprMan;
			this.x = x;
			this.y = y;

			//(graphic as Image).centerOO();
			//this.mask = new Pixelmask(RECTANGLE, -16, -32);
		}
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!this.target) this.target = this.world.getInstance("player") as Player;
			if (!this.target) {
				trace("Can't find target");
				return; //player still has not been added to the player
			}

			//this.angle = FP.angle(x, y, target.x, target.y) + 270;
		}
		
	}

}