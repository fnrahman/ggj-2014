package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Sword extends Entity 
	{
		
		public var pixelMasks : Array;
		
		[Embed(source = "res/sword_hitbox_strip.png")] private const SWORD_PIXELMAP:Class;
		public var hitboxMap:Spritemap = new Spritemap(SWORD_PIXELMAP, 256, 256);
		public var pixelMaps : Array = new Array(36);
		
		public var parent : Combatant;
		
		public var swinging : Boolean = false;
		public var anti_type : String;
		
		public function Sword(parent:Combatant) 
		{
			super(parent.x, parent.y);
			this.x = parent.x;
			this.y = parent.y;

			this.pixelMasks = new Array(36);
			this.parent = parent;
			
			hitboxMap.originX = 129; hitboxMap.originY = 142;

			for (var i:int = 0; i < 36; i++) {
				hitboxMap.frame = i;
				pixelMaps[i] = new Pixelmask(hitboxMap.getBuffer(), -128, -128);
			}
			this.mask = pixelMaps[0];
			if (parent is Player) {
				type = "sword";
				anti_type = "enemy";
			}
			else {
				type = "enemy_sword";
				anti_type = "player";
			}
		}
		
		override public function update():void 
		{
			super.update();
			this.x = parent.x;
			this.y = parent.y;
			var index : int = (parent.angle % 360) / 10;
			hitboxMap.frame = index;
			//mask = pixelMasks[index];

			if (this.swinging && this.type == "sword" && this.collide(anti_type, x, y)) {
				FP.console.log("Hit enemy");
				this.swinging = false;
			}
			//Eventually this statement will be unnecessary
			else if (this.type == "enemy_sword" && this.collide(anti_type, x, y)) {
				FP.console.log("Enemy hit you!");
			}

			
			
			
		}
		
	}

}