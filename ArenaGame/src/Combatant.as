package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * This class is what connects the good with the bad
	 */
	public class Combatant extends Entity 
	{
		public var angle : Number = 0;
		
		//Stats
		public var speed : Number = 0;
		public var aim : Number = 0; //Angle of cone of precision
		public var strength : Number = 0;
		
		public var currentWeaponIndex: Number; //even=swordman; odd=bowman
		public var sword : Sword;
		
		public function Combatant(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
			this.x = x;
			this.y = y;
			this.sword = new Sword(this);
		}
		
		override public function added():void 
		{
			super.added();
			this.world.add(this.sword);
			this.sword.swinging = false;
		}
		
		public function hideSwordHitBox() : void {
			this.sword.swinging = false;
		}
		
	}

}