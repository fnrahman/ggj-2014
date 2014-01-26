package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	public class HPLabel extends Entity
	{
		
		private var text:Text;
		private var owner:String;
		private var str:String = "Sword";
		private var parent:Combatant;
		
		public function HPLabel(x:int, y:int, parent:Combatant, owner:String) 
		{
			this.owner = owner;
			this.parent = parent;
			graphic = text = new Text(owner + " HP: " + parent.hp, 0, 0, { size:32, color:"0x000000" } );
			this.width = text.width;
			this.height = text.height;
			this.x = x;
			this.y = y;
		}
		
		override public function update():void 
		{
			super.update();
			text.text = owner + " HP: " + parent.hp;
		}
		
	}

}