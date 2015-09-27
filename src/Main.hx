package;

import openfl.canvas.Rectangle;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.gui.Button;
import openfl.gui.CheckBox;
import openfl.gui.RadioButton;
import openfl.gui.styles.ButtonStyle;
import openfl.gui.styles.CheckBoxStyle;
import openfl.gui.styles.FontStyle;
import openfl.gui.Control;
import openfl.gui.styles.TextBoxStyle;
import openfl.gui.TextBox;
import openfl.gui.TextControl;
import openfl.canvas.Color;
import openfl.canvas.StyleReader;
import openfl.display.GradientType;
import openfl.Lib;

class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		//labelExample();
		//textBoxExample();
		//buttonExample();
		//checkboxExample();
		//radioButtonExample();
		
		StyleReader.CURRENT = new StyleReader("info/defaultStyles.json");
		
		var rect:Rectangle = new Rectangle(30, 30, 100, 100, "inheritTest");
		rect.draw(graphics, true);
		
		//graphics.lineStyle(2, Color.red().value);
		//graphics.lineGradientStyle(GradientType.LINEAR, [Color.red().value, Color.darkSeaGreen().value], [1, 1], [0, 1]);
		//graphics.beginFill(Color.darkSeaGreen().value);
		//graphics.drawRect(30, 30, 100, 100);
		
		addChild(new FPS(2, 2, 0xFF0000));
	}
	
	private function labelExample()
	{
		var label = new TextControl("This is an example", "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		label.textColor = 0xFFFFFF;
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
		var chb = new CheckBox("This is an example.", false, "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		
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
	
	private function radioButtonExample()
	{
		var rdb1 = new RadioButton("Example A", true, "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		var rdb2 = new RadioButton("Example B", false, "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		var rdb3 = new RadioButton("Example C", false, "font/OpenSans-Regular", FontStyle.DEFAULT, true);
		
		var style = new ButtonStyle();
		style.fillColor = 0x001616;
		style.fillColorOnDown = 0x000505;
		style.fillColorOnOver = 0x002222;
		style.lineThickness = 1;
		style.outlineColor = 0x006799;
		style.outlineColorOnDown = 0x005454;
		style.outlineColorOnOver = 0x00A5B9;
		style.textColor = 0x006799;
		style.textColorOnOver = 0x00A5B9;
		style.textColorOnDown = 0x005454;
		
		rdb1.style = rdb2.style = rdb3.style = style;
		
		rdb1.x = 50;
		rdb1.y = 50;
		rdb2.x = 50;
		rdb2.y = 75;
		rdb3.x = 50;
		rdb3.y = 100;
		
		addChild(rdb1);
		addChild(rdb2);
		addChild(rdb3);
	}

}
