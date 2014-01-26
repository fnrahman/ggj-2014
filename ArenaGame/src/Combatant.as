package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * This class is what connects the good with the bad
	 */
	public class Combatant extends Entity 
	{
		//dat spritemap tho;
		[Embed(source = "res/sheet.png")]private const Man: Class;
		[Embed(source = "res/head.png")] private const HIT_CIRCLE:Class;
		public var sprMan: Spritemap = new Spritemap(Man, 256, 256);
		
		public var currentWeapon: Spritemap;
		
		public var angle : Number = 0;
		
		//Stats
		public var speed : Number = 0;
		public var aim : Number = 0; //Angle of cone of precision
		public var strength : Number = 0;
		
		public var currentWeaponIndex: Number; //even=swordman; odd=bowman
		public var sword : Sword;
		
		public var canAttack:Boolean = true;
		
		public function Combatant(x:Number = 0, y:Number = 0, graphic:Graphic = null, mask:Mask = null) 
		{
			super(x, y, graphic, mask);
			this.x = x;
			this.y = y;
			this.sword = new Sword(this);
			
			sprMan.add("shoot", [4, 5, 6, 7, 7, 6, 5, 4 ], .25, false);
			sprMan.add("attack", [0, 1, 2, 3, 3, 2, 1, 0], .25, false);
			sprMan.add("idleSword", [0 ], .25, false);
			sprMan.add("idleBow", [4], .25, false);
			graphic = sprMan;
			
			
			this.angle = 0;

			this.mask = new Pixelmask(HIT_CIRCLE, -25, -25);
			
			sprMan.originX = 121; sprMan.originY = 128;
		}
		
		override public function added():void 
		{
			super.added();
			this.world.add(this.sword);
			this.sword.swinging = false;
			this.sprMan.callback = attackCallback;
			//this.grazeBox = new GrazeBox(this);
			//this.world.add(this.grazeBox);
		}
		
		public function attackCallback() : void {
			this.canAttack = true;
			this.sword.swinging = false;
		}
		
	}

}