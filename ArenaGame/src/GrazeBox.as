package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author ...
	 */
	public class GrazeBox extends Entity 
	{
		public var player : Player;
		public function GrazeBox(player:Player) 
		{
			super(player.x, player.y);
			this.player = player;
			this.x = player.x; this.y = player.y;
			this.width = this.height = 96;
			this.centerOrigin();
			
			type = "grazeBox";
			
		}
		
		override public function update():void 
		{
			super.update();
			this.x = player.x;
			this.y = player.y;
		}
		
	}

}