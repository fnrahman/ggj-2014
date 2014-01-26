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
	
		//[Embed(source = "res/head.png")] private const HIT_CIRCLE:Class;
		
		//[Embed(source = "res/sheet.png")]private const Man: Class;
		//public var sprMan: Spritemap = new Spritemap(Man, 256, 256);

		//public var currentWeapon: Spritemap;
		
		
		//Stat tracking
		public var numSwipes : int;
		public var successfulSwipes : int;
		public var numShots : int;
		public var successfulShots : int;
		public var distanceMoved : int;
		public var numSwitches : int;
		public var averageShotDistance : Number = 0;
		
		public var grazeBox : GrazeBox;
		
		
		public function Player(x:int, y:int) 
		{
			aim = 30; // CHANGE THIS LATER
			super(x, y);
			type = "player";
			name = "player";
			Input.define("UP", Key.UP, Key.W);
			Input.define("DOWN", Key.DOWN, Key.S);
			Input.define("LEFT", Key.LEFT, Key.A);
			Input.define("RIGHT", Key.RIGHT, Key.D);
			
			speed = 5.0;
			angle = 0;


			currentWeaponIndex = 0;
			
			//sprMan.add("shoot", [4, 5, 6, 7, 7, 6, 5, 4 ], .25, false);
			//sprMan.add("attack", [0, 1, 2, 3, 3, 2, 1, 0], .25, false);
			//sprMan.add("idleSword", [0 ], .25, false);
			//sprMan.add("idleBow", [4], .25, false);
			
			graphic = sprMan;

			//this.angle = 0;

			//this.mask = new Pixelmask(HIT_CIRCLE, -25, -25);
			
			//sprMan.originX = 125; sprMan.originY = 142;
			
		}
		
		override public function update():void 
		{
			if (Input.check("UP")) { y -= speed; distanceMoved += speed; }
			if (Input.check("DOWN")) { y += speed; distanceMoved += speed;  }
			if (Input.check("LEFT")) { x -= speed; distanceMoved += speed;  }
			if (Input.check("RIGHT")) { x += speed; distanceMoved += speed;  }
			if (Input.released(Key.SPACE)) {
				currentWeaponIndex++;
				numSwitches++;
				if (currentWeaponIndex % 2 == 0)
				{
					sprMan.play("idleSword",false );
				}
				else
				{
					
					sprMan.play("idleBow", false);
				}
				test = 0;
			}
		

			if (Input.mouseReleased && this.canAttack) {
				canAttack = false;
				if (currentWeaponIndex % 2 == 0) {
					
					sprMan.play("attack", true);
					sword.swinging = true;
					numSwipes += 1;
				}else 
				{
					//world.add(new Arrow(x, y, angle + ((2 * Math.random() * aim)  - aim),this));
					sprMan.play("shoot", true);
					test++;
					numShots += 1;
					
				}
			}

			this.angle = FP.angle(x, y, Input.mouseX, Input.mouseY);
			sprMan.angle = this.angle;
			
			FP.console.log(successfulSwipes);
			
			super.update();
		}
		
	}
	
}