package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Combatant
	{
		[Embed(source = "res/rectangle.png")] public const RECTANGLE:Class;
		
		//States
		public static const SEEK : int = 0, DESTROY : int = 1;
		
		public var target : Player;
		public function Enemy(x:Number=0, y:Number=0) 
		{
			super(x, y);
			type = "enemy";
			graphic = sprMan;
			this.x = x;
			this.y = y;
			this.speed = 2;
			this.aim = 0;

			//(graphic as Image).centerOO();
			//this.mask = new Pixelmask(RECTANGLE, -16, -32);
		}
		
		override public function added():void 
		{
			super.added();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (!this.target) this.target = this.world.getInstance("player") as Player;
			if (!this.target) {
				trace("Can't find target");
				return; //player still has not been added to the player
			}
			seek();
			swordAttack();
			bowAttack();
			sprMan.angle = this.angle;
			//this.angle = FP.angle(x, y, target.x, target.y) + 270;
		}
		
		private var seek_update : Number = 0;
		public function seek():void {
			seek_update += FP.elapsed;
			if (seek_update < 0.01) return;
			seek_update = 0;
			var creepy_angle : Number = (FP.angle(x, y, target.x, target.y)) % 360;
			var actual_angle : Number = ((2 * Math.random() * aim)  - aim) + creepy_angle;
			var multiplier : int = Math.tan(actual_angle * Math.PI / 180) > 0 ? -1 : -1;
			this.x -= multiplier * (this.speed * Math.cos(actual_angle * Math.PI / 180));
			this.y += multiplier * (this.speed * Math.sin(actual_angle * Math.PI / 180));
			this.angle = actual_angle;
			//FP.console.log(actual_angle);
		}
		
		private var swing_sword : Number = 0;
		public function swordAttack() : void {
			swing_sword += FP.elapsed;
			if (swing_sword < 0.5) return;
			swing_sword = 0;
			if (FP.distance(target.x, target.y, this.x, this.y) < 70 && this.canAttack) {
				FP.console.log("Trying to swing my sword");
				this.sword.swinging = true;
				this.sprMan.play("attack", true);
			}
		}
		
		private var shoot_bow : Number = 0;
		public function bowAttack() : void {
			shoot_bow += FP.elapsed;
			if (shoot_bow < 1) return;
			shoot_bow = 0;
			if (FP.distance(target.x, target.y, this.x, this.y) > 200) {
				world.add(new Arrow(x, y, this));
				sprMan.play("shoot", true);
			}
		}
		
	}

}