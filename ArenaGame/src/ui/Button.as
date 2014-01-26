package ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	public class Button extends Entity
	{
		public var str:String;
		public var txt:Text;
		public var normalColor:uint = 0xFFFFFF;
		public var hoverColor:uint = 0x000000;
		private var callback:Function;
		private var options:Object = { size:32, color:"white" };
		[Embed(source = "../res/OptimusPrincepsSemiBold.ttf", embedAsCFF="false", fontFamily="Opt Font")] private const MY_FONT:Class;
		public function Button(x:int, y:int, str:String,  callback:Function=null, options:Object=null) 
		{
			if (options != null) {
				this.options = options;
			}
			Text.font = "Opt Font";
			graphic = txt = new Text(str, 0, 0, this.options );
			this.x = x;
			this.y = y;
			this.width = txt.width;
			this.height = txt.height;
			txt.color = normalColor;
			this.callback = callback;
		}
		
		override public function update():void 
		{
			super.update();
			if (collidePoint(x,y,Input.mouseX, Input.mouseY)) {
				txt.color = hoverColor;
				if (Input.mouseReleased) {
					if (callback != null) {
						callback();
					}
				}
				
			} else {
				txt.color = normalColor;
			}
		}
		
	}

}