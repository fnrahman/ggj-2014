package ui 
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class InstructionsWorld extends World
	{
		
		public function InstructionsWorld() 
		{
			FP.screen.color = 0x000000;
			var instr:Label = new Label(0, 50, "Instructions", { size:"64", align:"center" } );
			instr.x = FP.halfWidth - instr.halfWidth;
			
			var i3:Label = new Label(0, 150, "You must fight for your life in THE ARENA. If you can survive 5 ROUNDS, you are promised your freedom.", 
			                         { width:"500", wordWrap:"true", align:"center" } );
			i3.x = FP.halfWidth - i3.halfWidth;
			
			var i1:Label = new Label(0, 225, "Move with WASD or the Arrow Keys. Click to attack.", {align:"center"});
			i1.x = FP.halfWidth - i1.halfWidth;
			
			var i2:Label = new Label(0, 275, "You can use your sword for melee attacks, or a bow for ranged attacks. " +
									"Press SPACE to switch between them.", { width:"500", wordWrap:"true", align:"center" } );
			i2.x = FP.halfWidth - i2.halfWidth;
			
			var i4:Label = new Label(0, 350, "As you progress through your matches, your abilities will increase. " +
								             "Do not let your guard down--your enemies shall progress as well, in the same ways you do...",
											  { width:"500", wordWrap:"true", align:"center" } );
			i4.x = FP.halfWidth - i4.halfWidth;
										 
			
			var backBtn:Button = new Button(0, FP.height - 100, "Back", function():void { FP.world = new MenuWorld() } );
			backBtn.x = FP.halfWidth - backBtn.halfWidth;
			
			add(instr);
			add(i1);
			add(i2);
			add(i3);
			add(i4);
			add(backBtn);
		}
		
	}

}