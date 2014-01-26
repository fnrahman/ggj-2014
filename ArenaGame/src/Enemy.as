package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	
	public class Enemy extends Combatant
	{
		[Embed(source = "res/rectangle.png")] public const RECTANGLE:Class;
		
		//States
		public static const SEEK : int = 0, DESTROY : int = 1;
		
		public var target : Player;
		public var sword_border:Number = 160;
		public var bow_border:Number = 300;
		public function Enemy(x:Number=0, y:Number=0) 
		{
			super(x, y);
			type = "enemy";
			graphic = sprMan;
			this.x = x;
			this.y = y;
			this.speed = 2;
			this.aim = 20;

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
		
		private var swing_sword : Number = 0;
		public function swordAttack() : void {
			swing_sword += FP.elapsed;
			if (swing_sword < 0.5) return;
			swing_sword = 0;
			if (FP.distance(target.x, target.y, this.x, this.y) < sword_border && this.canAttack) {
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
			if (FP.distance(target.x, target.y, this.x, this.y) > bow_border) {
				world.add(new Arrow(x, y, angle + ((2 * Math.random() * aim)  - aim), this));
				sprMan.play("shoot", true);
			}
		}
		private var seek_update:Number = 0;
		private var timeToSeek:Number = 0.25;
		private var target_angle:Number = 0;
		private var turning_angle:Number = 10;
		private var motion_angle:Number = angle;
		public function seek():void {
			seek_update += FP.elapsed;
			if (seek_update > timeToSeek) {
				seek_update -= timeToSeek;
				var creepy_angle : Number = (FP.angle(x, y, target.x, target.y)) % 360;
				target_angle = ((2 * Math.random() * aim)  - aim) + creepy_angle;
				timeToSeek = Math.random();
			}
			var sign:Number = (target_angle - motion_angle);
			var amount:Number = Math.min(turning_angle, Math.abs(sign));
			if (sign >= 0) {
				motion_angle += amount;
			} else if (sign < 0) {
				motion_angle -= amount;
			}
			
			x += (speed * Math.cos(motion_angle * Math.PI / 180));
			y -= (speed * Math.sin(motion_angle * Math.PI / 180));
			//FP.console.log(actual_angle);
			angle = FP.angle(x, y, target.x, target.y);
		}
	}
}