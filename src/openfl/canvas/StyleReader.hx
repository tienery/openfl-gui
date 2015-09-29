package openfl.canvas;
import haxe.Json;
import openfl.Assets;

class StyleReader
{

	/**
	 * When JSON-formatted files are parsed, its result is placed in this object.
	 * This variable should not be modified, unless you know what you are doing.
	 */
	public var classes:Dynamic;
	
	/**
	 * Create a new `StyleReader` that reads a JSON-formatted file and parses it.
	 * @param	stylesFile		The JSON-formatted file to look for.
	 */
	public function new(stylesFile:String) 
	{
		classes = Json.parse(Assets.getText(stylesFile));
		
	}
	
	/**
	 * This `StyleReader` is used by all objects when drawn.
	 */
	public static var CURRENT:StyleReader;
	
}