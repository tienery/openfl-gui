package openfl.canvas;
import haxe.Json;
import openfl.Assets;

class StyleReader
{

	public var classes:Dynamic;
	
	public function new(stylesFile:String) 
	{
		classes = Json.parse(Assets.getText(stylesFile));
		
	}
	
	
	public static var CURRENT:StyleReader;
	
}