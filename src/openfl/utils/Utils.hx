package openfl.utils;

/**
 * ...
 * @author tienery
 */
class Utils
{

	public static function tradFor(condition:Void -> Bool, loopOnMet:Bool = false, callback:Void -> Void = null):Void
	{
		while ((condition()) == loopOnMet)
		{
			callback();
		}
	}
	
}