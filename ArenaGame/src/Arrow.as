package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class Arrow extends Entity
	{
		[Embed(source = "res/arrow.png")]private const ARROW: Class;
		
		public var currentAngle: Number;
		public var speed: Number;
		
		public function Arrow(x:int, y:int , angle:int) 
		{
			this.x = x;
			this.y = y;
			graphic = img = ARROW;
			currentAngle = angle;
			speed = 5.0;
		}
		
		override public function update():void 
		{
			x += speed * Math.cos(angle * Math.PI / 180);
			y += speed * Math.sin(angle * Math.PI / 180);
		}
	}

}