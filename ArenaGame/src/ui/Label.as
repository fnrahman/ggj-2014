package ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Fayz
	 */
	public class Label extends Entity
	{
		private var text:Text;
		[Embed(source = "../res/OptimusPrincepsSemiBold.ttf", embedAsCFF="false", fontFamily="Opt Font")] private const MY_FONT:Class;
		public function Label(x:int, y:int, str:String, options:Object=null) 
		{
			Text.font = "Opt Font";
			graphic = text = new Text(str, 0, 0, options);
			this.x = x;
			this.y = y;
		}
		
	}

}