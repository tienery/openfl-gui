package;

import openfl.display.Sprite;
import openfl.gui.FontStyle;
import openfl.gui.Control;
import openfl.gui.styles.TextBoxStyle;
import openfl.gui.TextBox;
import openfl.gui.TextControl;
import openfl.Lib;

class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		//labelExample();
		textBoxExample();
	}
	
	private function labelExample()
	{
		var label = new TextControl("This is an example", "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		label.x = Lib.current.stage.stageWidth - label.width - 10;
		label.y = Lib.current.stage.stageHeight - label.height - 10;
		label.anchor = Control.ANCHOR_BOTTOM | Control.ANCHOR_RIGHT;
		addChild(label);
	}
	
	private function textBoxExample()
	{
		var tb = new TextBox("Placeholder text", 100, 20, "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		tb.x = 80;
		tb.y = 30;
		
		var style = new TextBoxStyle();
		style.textColor = 0x006799;
		style.textColorOnOver = 0x00A5B9;
		style.outlineColor = 0x006799;
		style.outlineColorOnOver = 0x00A5B9;
		style.fillColorOnOver = 0x002222;
		style.fillColor = 0x001616;
		
		tb.style = style;
		
		addChild(tb);
	}

}
