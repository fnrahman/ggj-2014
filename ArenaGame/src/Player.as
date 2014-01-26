package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	
	
	public class Player extends Combatant
	{
		[Embed(source = "res/swing.png")]private const SWORDMAN: Class;
		public var sprSwordMan:Spritemap = new Spritemap(SWORDMAN, 256, 256);
	
		[Embed(source = "res/rectangle.png")] private const RECTANGLE:Class;


		[Embed(source = "res/sword_hitbox_strip.png")] private const SWORD_PIXELMAP:Class;
		[Embed(source = "res/pullbow_strip.png")]private const Bowman: Class;
		[Embed(source = "res/sheet.png")]private const Man: Class;
		public var sprMan: Spritemap = new Spritemap(Man, 256, 256);
		public var sprBowman:Spritemap = new Spritemap(Bowman, 256, 256);
		public var speed : Number;

		public var currentWeapon: Spritemap;
		public var current: Number; //even=swordman; odd=bowman
		public var hitboxMap:Spritemap = new Spritemap(SWORD_PIXELMAP, 256, 256);
		public var pixelMaps : Array = new Array(36);

		public var sword : Sword;

		
		public function Player(x:int, y:int) 
		{
			super(x, y);
			Input.define("UP", Key.UP, Key.W);
			Input.define("DOWN", Key.DOWN, Key.S);
			Input.define("LEFT", Key.LEFT, Key.A);
			Input.define("RIGHT", Key.RIGHT, Key.D);
			this.x = x;
			this.y = y;
			speed = 5.0;


			current = 0;
			
			sprMan.add("shoot", [4, 5, 6, 7, 7, 6, 5, 4 ], .25, false);
			sprMan.add("attack", [0, 1, 2, 3, 3, 2, 1, 0], .25, false);
			sprMan.add("idleSword", [0 ], .25, false);
			sprMan.add("idleBow", [4], .25, false);
			
			this.angle = 0;
			
			
			graphic = sprMan;

			this.angle = 0;
			this.sword = new Sword(this);
			
			sprMan.originX = 129; sprMan.originY = 142;
			
			
			//(graphic as Image).centerOO();
			
		}
		
		
		override public function update():void 
		{
			//this.world.add(sword);
			if (Input.check("UP")) { y -= speed; }
			if (Input.check("DOWN")) { y += speed; }
			if (Input.check("LEFT")) { x -= speed; }
			if (Input.check("RIGHT")) { x += speed; }
			if (Input.released(Key.SPACE)) {
				current++;
				if (current % 2 == 0)
				{
					sprMan.play("idleSword",false );
				}
				else
				{
					
					sprMan.play("idleBow", false);
				}
			}
		
			
			
		
			if (Input.mouseReleased) {
				if (current % 2 == 0) {
					
				sprMan.play("attack", true);
				}else 
				{
				sprMan.play("shoot", true);
				}
			}

			
			sprMan.angle = FP.angle(x, y, Input.mouseX, Input.mouseY) + 270;
			this.angle = FP.angle(x, y, Input.mouseX, Input.mouseY) + 270;
			
			
			
			if (Input.mouseReleased && sword.collide("enemy", x, y)) {
				FP.screen.color = 0xF0FF0F;
			}
			else {
				FP.screen.color = 0xFFFFFF;
			}
			
			super.update();
		}
		
	}
	
}