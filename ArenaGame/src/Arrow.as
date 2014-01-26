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
		
		public function Arrow(x:int, y:int , parent:Combatant)
		{
			
			this.parent = parent;
			this.x = x;
			this.y = y;
			graphic = img = new Image(ARROW);
			img.originX = 86;
			img.originY = 49;
			setOrigin(48, 11);
			setHitbox(3, 3, 1, 1);
			currentAngle = parent.angle;
			trace("Angle = " + currentAngle);
			img.angle = currentAngle;
			speed = 10.0;
			this.layer = 10;
			
			type = (parent is Player) ? "arrow" : "enemy_arrow";
			anti_type = (parent is Player) ? "enemy" : "player";
		}
		
		override public function update():void 
		{
			x += speed * Math.cos((currentAngle) * Math.PI / 180);
			y -= speed * Math.sin((currentAngle) * Math.PI / 180);
			
			if (x < (0-img.width) || x > (FP.width+img.width) || y < (0-img.height) || y > (FP.height+img.height)) {
				world.remove(this);
			}
			
			if (collide(anti_type, x, y)) {
				FP.console.log("Shot the enemy");
				world.remove(this);
			}
		}
	}

}