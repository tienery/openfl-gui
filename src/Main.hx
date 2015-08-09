package;

import openfl.display.Sprite;
import openfl.gui.FontStyle;
import openfl.gui.Control;
import openfl.gui.TextControl;
import openfl.Lib;

class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		labelExample();
	}
	
	private function labelExample()
	{
		var label = new TextControl("This is an example", "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		trace(label.width);
		label.x = Lib.current.stage.stageWidth - label.width - 10;
		label.y = Lib.current.stage.stageHeight - label.height - 10;
		label.anchor = Control.ANCHOR_BOTTOM | Control.ANCHOR_RIGHT;
		addChild(label);
	}

}
