package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import ui.MenuWorld;
	
	[SWF(width="832", height="640")]
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(832, 640, 60, true);
			//FP.world = new ArenaWorld();
			//FP.world = new MenuWorld();
			FP.world = new AfterMatchWorld();
			FP.console.enable();
		}
		
		override public function init():void 
		{
			trace("Flashpunk has started successfully!");
		}
		
	}
	
}