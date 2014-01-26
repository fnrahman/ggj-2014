package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class Indicator extends Entity
	{
		public var fadeTime:Number = 10;
		public var timer:Number = 0;
		public var text:Text;
		[Embed(source="res/OptimusPrincepsSemiBold.ttf", embedAsCFF="false", fontFamily="Opt Font")] private const MY_FONT:Class;
		public function Indicator(x:int, y:int, damage:int) 
		{
			Text.font = "Opt Font";
			graphic = text = new Text("-" + damage, 0, 0, {size:"32"});
			text.color = 0xFFFF00;
			layer = -100;
			this.x = x + (2*(5) * Math.random() - 5);
			this.y = y + (2*(5) * Math.random() - 5);
		}
		
		override public function update():void 
		{
			y -= 4;
			super.update();
			timer += FP.elapsed;
			if (timer >= fadeTime) {
				world.remove(this);
			}
		}
		
	}

}