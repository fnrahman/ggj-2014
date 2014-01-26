package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	public class ArenaWorld extends World
	{
		
		public function ArenaWorld() 
		{
			FP.screen.color = 0xC0C0C0;
			add(new Enemy(FP.halfWidth / 2, FP.halfHeight / 2));
			var player : Player = new Player(FP.halfWidth, FP.halfHeight)
			add(player)
			add(new Sword(player));
			
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}