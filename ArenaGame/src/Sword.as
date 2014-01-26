package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
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
		public var damage: Number;
		
		[Embed(source="res/Cheer.mp3")] private const CHEER:Class;
		public var sfxCheer:Sfx;
		
		public function Sword(parent:Combatant) 
		{
			super(parent.x, parent.y);
			this.x = parent.x;
			this.y = parent.y;
			
			this.damage = parent.strength;

			this.pixelMasks = new Array(36);
			this.parent = parent;
			
			hitboxMap.originX = 121; hitboxMap.originY = 128;

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
			sfxCheer = new Sfx(CHEER);
		}
		
		override public function update():void 
		{
			super.update();
			this.x = parent.x;
			this.y = parent.y;
			var index : int = (parent.angle % 360) / 10;
			hitboxMap.frame = index;
			//mask = pixelMasks[index];

			var combatant:Combatant = this.collide(anti_type, x, y) as Combatant;
			
			if (this.swinging && this.type == "sword" && combatant) {
				FP.console.log("Hit enemy");
				this.swinging = false;
				(parent as Player).successfulSwipes += 1;
				combatant.hp -= parent.strength;
				if (combatant.hp < 0) combatant.hp = 0;
				world.add(new Indicator(combatant.x, combatant.y, parent.strength));
				sfxCheer.stop();
				sfxCheer.play();

			}
			//Eventually this statement will be unnecessary
			else if (this.swinging && this.type == "enemy_sword" && combatant) {
				this.swinging = false;
				FP.console.log("Enemy hit you!");
				combatant.hp -= parent.strength;
				if (combatant.hp < 0) combatant.hp = 0;
				world.add(new Indicator(combatant.x, combatant.y, parent.strength));
				sfxCheer.stop();
				sfxCheer.play();

			}
			else if (this.type == "enemy_sword" && this.collide("grazeBox", x, y)) {
				//FP.console.log("Enemy grazed you!");
			}

			
			
			
		}
		
	}

}