package ui 
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	public class MenuWorld extends World
	{
		
		public function MenuWorld() 
		{
			add(new Label(50, 50, "The Arena", { size:"64" } ));
			add(new Button(300, 200, "Start Game", function():void { FP.world = new ArenaWorld() } ));
			add(new Button(300, 300, "Instructions", function():void {FP.world = new InstructionsWorld()})); // Still needs to link to a new world that explains controls.
		}
		
	}

}