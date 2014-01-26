package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	public class ArenaWorld extends World
	{
		private var player:Player;
		private var enemy:Enemy;
		private var winTimer:Number = 0;
		private var winConstant:Number = 2;
		
		public function ArenaWorld() 
		{
			FP.screen.color = 0xC0C0C0;
			
			player = new Player(FP.halfWidth, FP.halfHeight);
			add(player);
			enemy = new Enemy(FP.halfWidth / 2, FP.halfHeight / 2); 
			add(enemy);
			
		}
		
		override public function update():void 
		{
			var roundOver:Boolean = false;
			if (enemy.hp <= 0 ) {
				MatchData.playerWin = true;
				roundOver = true;
			} else if (player.hp <= 0) {
				MatchData.playerWin = false;
				roundOver = true;
			}
			if (roundOver) {
				winTimer += FP.elapsed;
				if (winTimer >= winConstant) {
					MatchData.numSwipes = player.numSwipes;
					MatchData.successfulSwipes = player.successfulSwipes;
					MatchData.numShots = player.numShots;
					MatchData.successfulShots = player.successfulShots;
					MatchData.distanceMoved = player.distanceMoved;
					MatchData.numSwitches = player.numSwitches;
					MatchData.averageShotDistance = player.averageShotDistance;
					FP.world = new AfterMatchWorld();
				}
				
			} else {
				super.update();
			}
		}
	}

}