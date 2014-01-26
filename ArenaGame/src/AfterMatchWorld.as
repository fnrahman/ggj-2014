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
			var speedChange: Number = 0;
			var strengthChange: Number = 0;
			var aimChange: Number = 0;
			FP.screen.color = 0x000000;
			var headerString:String;
			var nextString:String;
			var nextFunction:Function;
			if (MatchData.playerWin) {
				headerString = "You have survived Round " + Main.currentRound;
				nextString = "Next Round";
				nextFunction = function():void {
					Main.currentRound += 1;
					FP.world = new ArenaWorld();
					trace("MOVE TO ROUND " + Main.currentRound);
				}
				if (MatchData.numShots != 0) {
					aimChange = MatchData.successfulShots / (.12 * MatchData.numShots);
					MatchData.aim -= aimChange;
					if (MatchData.aim < 2) {
						MatchData.aim = 2;	
					}
				}
				speedChange =MatchData.distanceMoved * .0001;
				MatchData.speed += speedChange;
				strengthChange = (MatchData.successfulSwipes * 5) + (2 * MatchData.successfulShots);
				MatchData.strength +=strengthChange;
			} else {
				headerString = "Game Over";
				nextString = "Main Menu";
				nextFunction = function():void {
					FP.world = new MenuWorld();
					Main.currentRound = 1;
				}
			}
			var header:Label = new Label(100, 100, headerString, { align:"center", size:"36", width:"600", wordWrap:"true" } );
			header.x = FP.halfWidth - header.halfWidth;
			var nextBtn:Button = new Button(FP.halfWidth, FP.height - 100, nextString, nextFunction, { size:"32", align:"center" } );
			nextBtn.x = FP.halfWidth - nextBtn.halfWidth;
			var shotAccuracy:Label = new Label(100, 160,"Shot Accuracy: " + MatchData.successfulShots +"/" + MatchData.numShots , { align:"center", size:"24", width:"600", wordWrap:"true" } );
			var swordAccuracy:Label = new Label(100, 200,"Sword Accuracy: " + MatchData.successfulSwipes +"/" + MatchData.numSwipes , { align:"center", size:"24", width:"600", wordWrap:"true" } );
			var speed:Label = new Label(100, 240,"Speed: " + "+" + speedChange , { align:"center", size:"24", width:"600", wordWrap:"true" } );
			var strength:Label = new Label(100, 280,"Strength: " + "+" + strengthChange , { align:"center", size:"24", width:"600", wordWrap:"true" } );
			var aim:Label = new Label(100, 320,"Aim: " + "+" + aimChange , { align:"center", size:"24", width:"600", wordWrap:"true" } );
			var weaponSwitch: Label= new Label(100, 360, "Weapon Switches: " + MatchData.numSwitches,  { align:"center", size:"24", width:"600", wordWrap:"true" } );
			
			add(header);
			add(shotAccuracy);
			add(swordAccuracy);
			add(speed);
			add(strength);
			add(aim);
			add(weaponSwitch);
			add(nextBtn);
		}
		
	}

}