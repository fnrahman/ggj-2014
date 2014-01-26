package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	public class ModeLabel extends Entity
	{
		
		private var text:Text;
		private var str:String = "Sword";
		public function ModeLabel(x:int = 0, y:int = 0) 
		{
			graphic = text = new Text(str, x, y, { size:16, color:"black" } );
			graphic.scrollX = 0;
			graphic.scrollY = 0;
		}
		
		public function swordMode():void {
			text.text = "Sword";
		}
		
		public function bowMode():void {
			text.text = "Bow";
		}
		
	}

}