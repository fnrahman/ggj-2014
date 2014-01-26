package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Arrow extends Entity
	{
		[Embed(source = "res/arrow.png")]private const ARROW: Class;
		
		public var currentAngle: Number;
		public var speed: Number;
		private var parent:Combatant;
		private var img:Image;
		private var anti_type : String;
		
		private var x_start : int, y_start : int;
		
		public var damage : Number;
		
		public function Arrow(x:int, y:int, shootAngle:Number, parent:Combatant)
		{
			
			this.parent = parent;
			this.x = this.x_start = x;
			this.y = this.y_start = y;
			graphic = img = new Image(ARROW);
			img.originX = 86;
			img.originY = 49;
			setOrigin(48, 11);
			setHitbox(3, 3, 1, 1);
			currentAngle = shootAngle;
			img.angle = currentAngle;
			speed = 10.0;
			this.layer = 10;
			
			this.damage = parent.strength * 0.33333;
			
			
			
			type = (parent is Player) ? "arrow" : "enemy_arrow";
			anti_type = (parent is Player) ? "enemy" : "player";
		}
		
		override public function update():void 
		{
			x += speed * Math.cos((currentAngle) * Math.PI / 180);
			y -= speed * Math.sin((currentAngle) * Math.PI / 180);
			
			if (x < (0 - img.width) || x > (FP.width + img.width) || y < (0 - img.height) || y > (FP.height + img.height)) {
				if (parent is Player) {
					var temp1 : Player = parent as Player;
					temp1.averageShotDistance += FP.distance(x_start, y_start, x, y);
					temp1.averageShotDistance /= temp1.numShots;
				}
				world.remove(this);
			}
			var combatant:Combatant = collide(anti_type, x, y) as Combatant;
			if (combatant) {
				combatant.hp -= parent.strength;
				world.add(new Indicator(combatant.x, combatant.y, damage));
				FP.console.log("Shot the " + type);
				if (parent is Player) {
					(parent as Player).successfulShots += 1;
					var temp2 : Player = parent as Player;
					temp2.averageShotDistance += FP.distance(x_start, y_start, x, y);
					temp2.averageShotDistance /= temp2.numShots;
				}
				world.remove(this);
			}
		}
	}

}