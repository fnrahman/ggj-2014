package  
{

	public class MatchData
	{
		public static var playerWin:Boolean = false;
		public static var numSwipes : int = 0;
		public static var successfulSwipes : int = 0;
		public static var numShots : int = 0;
		public static var successfulShots :int = 0;
		public static var distanceMoved : int = 0;
		public static var numSwitches : int = 0;
		public static var averageShotDistance : Number = 0;
		public static var strength : Number = 20;
		public static var speed : Number = 5;
		public static var aim: Number = 30;
		
		
		public function MatchData() 
		{
			
		}
		
		public static function reset() : void {
			strength = 20;
			speed = 5;
			aim = 30;
		}
		
	}

}