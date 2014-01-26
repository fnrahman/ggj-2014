package  
{
	import net.flashpunk.Sfx;
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
		
		[Embed(source = "res/15_Thousand_People.mp3")] private const CROWD:Class;
		
		public var sfxCrowd:Sfx;
		
		public function ArenaWorld() 
		{
			FP.screen.color = 0xC0C0C0;
			
			player = new Player(FP.halfWidth, FP.halfHeight);
			trace("Good swipes: " + MatchData.successfulSwipes);
			trace("Strength: " + MatchData.strength);
			MatchData.strength += MatchData.successfulSwipes * 5;

			player.strength = MatchData.strength;
			
			
			
			player.aim = MatchData.aim;
			
			player.speed = MatchData.speed;
			player.hp = enemyHealth[Main.currentRound-1];
			add(player);
			
			enemy = new Enemy(FP.halfWidth / 2, FP.halfHeight / 2); 
			enemy.strength = MatchData.strength;
			enemy.aim = MatchData.aim;
			enemy.speed = MatchData.speed;
			trace("Start ROUND " + Main.currentRound);
			enemy.hp = enemyHealth[Main.currentRound-1];
			add(enemy);
			
			trace("HPs: " + enemy.hp);
			var yourHP:HPLabel = new HPLabel(0, 0, player, "Your");
			var cpuHP:HPLabel = new HPLabel(0, 0, enemy, "Enemy");
			cpuHP.x = FP.width - cpuHP.width;
			add(yourHP);
			add(cpuHP);
			
			sfxCrowd = new Sfx(CROWD);
			sfxCrowd.loop();
			sfxCrowd.play(0.5);
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
				sfxCrowd.stop();
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