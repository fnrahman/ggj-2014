package  
{
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import HPLabel;
	public class ArenaWorld extends World
	{
		private var player:Player;
		private var enemy:Enemy;
		private var winTimer:Number = 0;
		private var winConstant:Number = 2;
		public var enemyHealth: Array = new Array (100, 160, 240, 300, 350);
		
		
		public function ArenaWorld() 
		{
			FP.screen.color = 0xC0C0C0;
			
			player = new Player(FP.halfWidth, FP.halfHeight);
			MatchData.strength += MatchData.successfulSwipes * 5;
			player.strength = MatchData.strength;
			
			if (MatchData.numShots != 0) {
				MatchData.aim -= MatchData.successfulShots / (.12 * MatchData.numShots);
				if (MatchData.aim < 2) {
				MatchData.aim = 2;	
				}
			}
			
			player.aim = MatchData.aim;
			MatchData.speed += MatchData.distanceMoved * .0001;
			player.speed = MatchData.speed;
			player.hp = enemyHealth[MatchData.roundNum];
			add(player);
			
			enemy = new Enemy(FP.halfWidth / 2, FP.halfHeight / 2); 
			enemy.strength = MatchData.strength;
			enemy.aim = MatchData.aim;
			enemy.speed = MatchData.speed;
			enemy.hp = enemyHealth[MatchData.roundNum];
			add(enemy);
			var yourHP:HPLabel = new HPLabel(0, 0, player, "Your");
			var cpuHP:HPLabel = new HPLabel(0, 0, enemy, "Enemy");
			cpuHP.x = FP.width - cpuHP.width;
			add(yourHP);
			add(cpuHP);
			
		}
		
		override public function update():void 
		{
			var roundOver:Boolean = false;
			if (enemy.hp <= 0 ) {
				MatchData.playerWin = true;
				roundOver = true;
				MatchData.roundNum++;
			
			} else if (player.hp <= 0) {
				MatchData.playerWin = false;
				roundOver = true;
				MatchData.roundNum = 0;
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
					MatchData.speed = player.speed;
					MatchData.aim = player.aim;
					MatchData.strength = player.strength;
					FP.world = new AfterMatchWorld();
				}
				
			} else {
				super.update();
			}
		}
	}

}