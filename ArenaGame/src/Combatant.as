package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Combatant extends Entity 
	{
		public var angle : Number = 0;
		public function Combatant(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
		}
		
	}

}