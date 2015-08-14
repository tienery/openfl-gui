package;

import openfl.display.Sprite;
import openfl.gui.Button;
import openfl.gui.CheckBox;
import openfl.gui.styles.ButtonStyle;
import openfl.gui.styles.CheckBoxStyle;
import openfl.gui.styles.FontStyle;
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
		//textBoxExample();
		//buttonExample();
		checkboxExample();
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
		style.lineThickness = 1;
		
		tb.style = style;
		
		addChild(tb);
	}
	
	private function buttonExample()
	{
		var btn = new Button("Click Me!", "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		btn.x = Math.random() * 848;
		btn.y = Math.random() * 480;
		
		var style = new ButtonStyle();
		style.textColor = 0x006799;
		style.textColorOnOver = 0x00A5B9;
		style.textColorOnDown = 0x005454;
		style.outlineColor = 0x006799;
		style.outlineColorOnOver = 0x00A5B9;
		style.outlineColorOnDown = 0x005454;
		style.fillColor = 0x001616;
		style.fillColorOnOver = 0x002222;
		style.fillColorOnDown = 0x000505;
		style.lineThickness = 1;
		
		btn.style = style;
		
		addChild(btn);
	}
	
	private function checkboxExample()
	{
		var chb = new CheckBox("This is an example.", false);
		
		var style = new CheckBoxStyle();
		style.checkStyle = "tick";
		style.fillColor = 0x001616;
		style.fillColorOnDown = 0x000505;
		style.fillColorOnOver = 0x002222;
		style.innerLineThickness = 2;
		style.lineThickness = 1;
		style.outlineColor = 0x006799;
		style.outlineColorOnDown = 0x005454;
		style.outlineColorOnOver = 0x00A5B9;
		style.textColor = 0x006799;
		style.textColorOnOver = 0x00A5B9;
		style.textColorOnDown = 0x005454;
		
		chb.style = style;
		
		chb.x = 50;
		chb.y = 50;
		
		addChild(chb);
	}

}
