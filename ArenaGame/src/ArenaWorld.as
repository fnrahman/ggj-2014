package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	public class ArenaWorld extends World
	{
		
		public function ArenaWorld() 
		{
			FP.screen.color = 0xC0C0C0;
			add(new Player(FP.halfWidth, FP.halfHeight));
		}
		
		override public function update():void 
		{
			super.update();
		}
	}

}