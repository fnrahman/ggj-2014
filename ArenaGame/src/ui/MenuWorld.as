package ui 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	public class MenuWorld extends World
	{
		
		public function MenuWorld() 
		{
			FP.screen.color = 0x000000;
			var title:Label = new Label(50, 50, "The Arena", { size:"64" } );
			title.x = FP.halfWidth - title.halfWidth;
			
			var startBtn:Button = new Button(300, 200, "Start Game", function():void { FP.world = new ArenaWorld() } );
			startBtn.x = FP.halfWidth - startBtn.halfWidth;
			
			var helpBtn:Button = new Button(300, 300, "Instructions", function():void { FP.world = new InstructionsWorld() } );
			helpBtn.x = FP.halfWidth - helpBtn.halfWidth;
			
			add(title);
			add(startBtn);
			add(helpBtn);
		}
		
	}

}