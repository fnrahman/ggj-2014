package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class Indicator extends Entity
	{
		public var fadeTime:Number = 2;
		public var timer:Number = 0;
		public var text:Text;
		[Embed(source = "../res/OptimusPrincepsSemiBold.ttf", embedAsCFF="false", fontFamily="Opt Font")] private const MY_FONT:Class;
		public function Indicator(x:int, y:int, damage:int) 
		{
			Text.font = "Opt Font";
			text = new Text("-" + damage, 0, 0);
			text.color = 0xFF0000;
		}
		
		override public function update():void 
		{
			y -= 4;
			super.update();
			timer += FP.elapsed;
			text.alpha(timer / fadeTime);
			if (timer >= fadeTime) {
				world.remove(this);
			}
		}
		
	}

}