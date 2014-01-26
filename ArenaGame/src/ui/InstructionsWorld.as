package ui 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class InstructionsWorld extends World
	{
		
		public function InstructionsWorld() 
		{
			add(new Label(50, 50, "Instructions", { size:"64" } ));
			add(new Label(100, 150, "Move with WASD or the Arrow Keys. Click to attack."));
			add(new Label(100, 200, "You can use your sword for melee attacks, or a bow for ranged attacks. " +
									"Press SPACE to switch between them.", {width:"500", wordWrap:"true"}));
			add(new Button(50, FP.height - 100, "Back", function():void {FP.world = new MenuWorld()}));
		}
		
	}

}