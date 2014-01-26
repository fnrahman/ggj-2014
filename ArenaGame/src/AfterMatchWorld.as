package  
{
	import net.flashpunk.World;
	import ui.Button;
	import ui.Label;
	import net.flashpunk.FP;
	import ui.MenuWorld;
	
	public class AfterMatchWorld extends World
	{
		
		public function AfterMatchWorld() 
		{
			FP.screen.color = 0x000000;
			var headerString:String;
			var nextString:String;
			var nextFunction:Function;
			if (MatchData.playerWin) {
				headerString = "You have survived Round " + Main.currentRound;
				nextString = "Next Round";
				nextFunction = function():void {
					FP.world = new ArenaWorld();
					Main.currentRound++;
				}
			} else {
				headerString = "Game Over";
				nextString = "Main Menu";
				nextFunction = function():void {
					FP.world = new MenuWorld();
					Main.currentRound = 1;
				}
			}
			var header:Label = new Label(100, 100, headerString, { align:"center", size:"32", width:"600", wordWrap:"true" } );
			header.x = FP.halfWidth - header.halfWidth;
			var nextBtn:Button = new Button(FP.halfWidth, FP.height - 100, nextString, nextFunction, { size:"32", align:"center" } );
			nextBtn.x = FP.halfWidth - nextBtn.halfWidth;
			
			add(header);
			add(nextBtn);
		}
		
	}

}