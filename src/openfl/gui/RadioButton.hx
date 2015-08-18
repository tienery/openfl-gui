/*
The MIT License (MIT)

Copyright (c) 2015 tienery and other contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package openfl.gui;
import openfl.gui.styles.ButtonStyle;
import openfl.gui.styles.FontStyle;
import openfl.events.MouseEvent;
import openfl.events.Event;

//TODO
class RadioButton extends Control
{

	/**
	 * A control representing a single-choice from multiple RadioButtons.
	 * 
	 * @param value			The value of the text to display.
	 * @param checked		Determines if the RadioButton is checked by default. If this is set to true while another RadioButton
	 *  is also checked, that button becomes unchecked and this becomes the new checked button.
	 * @param font			The embedded asset or name of the font to use.
	 * @param fontStyle		The style of the font, including size, color and underline.
	 * @param embedded		Whether to use embedded resources or device fonts.
	 */
	public function new(value:String, checked:Bool = false, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		_txtField = new TextControl(value, font, fontStyle, embedded);
		_txtField.y = 0;
		_txtField.x = 23;
		
		_checked = checked;
		
		addChild(_txtField);
		
		addEventListener(MouseEvent.MOUSE_OVER, function(e)
		{
			_over = true;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_DOWN, function(e)
		{
			_down = true;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_OUT, function(e)
		{
			_down = false;
			_over = false;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_UP, function(e)
		{
			_down = false;
			redraw();
		});
		
		addEventListener(MouseEvent.CLICK, function(e)
		{
			for (i in 0...parent.numChildren)
			{
				if (Std.is(parent.getChildAt(i), RadioButton))
				{
					cast (parent.getChildAt(i), RadioButton).checked = false;
				}
			}
			_checked = true;
			redraw();
		});
		
		addEventListener(Event.ADDED_TO_STAGE, function(e)
		{
			redraw();
		});
	}
	
//Functions
	
	private function redraw()
	{
		var casted:ButtonStyle = null;
		if (Std.is(style, ButtonStyle))
			casted = cast (style, ButtonStyle);
		
		var outlineColor:Int = 0x999999;
		var fillColor:Int = 0x444444;
		var textColor:Int = 0x777777;
		var canStyle:Bool = false;
		var lineThickness:Float = 1;
		
		if (casted != null) 
		{
			canStyle = true;
			lineThickness = casted.lineThickness;
		}
		
		if (_down)
		{
			trace(canStyle);
			textColor = canStyle ? casted.textColorOnDown : textColor;
			fillColor = canStyle ? casted.fillColorOnDown : fillColor - 0x222222;
			outlineColor = canStyle ? casted.outlineColorOnDown : outlineColor - 0x222222;
		}
		else if (_over)
		{
			textColor = canStyle ? casted.textColorOnOver : textColor;
			fillColor = canStyle ? casted.fillColorOnOver : fillColor + 0x222222;
			outlineColor = canStyle ? casted.outlineColorOnOver : outlineColor + 0x222222;
		}
		else
		{
			textColor = canStyle ? casted.textColor : textColor;
			fillColor = canStyle ? casted.fillColor : fillColor;
			outlineColor = canStyle ? casted.outlineColor : outlineColor;
		}
		
		graphics.clear();
		graphics.lineStyle(lineThickness, outlineColor);
		graphics.drawCircle(6, 6, 10);
		_txtField.textColor = textColor;
		
		if (_checked)
		{
			graphics.beginFill(outlineColor);
			graphics.drawCircle(6, 6, 5);
		}
	}
	
//Properties
	
	@:noCompletion private var _txtField:TextControl;
	@:noCompletion private var _over:Bool;
	@:noCompletion private var _down:Bool;
	
	@:noCompletion private var _checked:Bool;
	/**
	 * Gets or sets the check state of this radio button.
	 */
	public var checked(get, set):Bool;
	@:noCompletion function get_checked() return _checked;
	@:noCompletion function set_checked(val)
	{
		_checked = val;
		redraw();
		return _checked;
	}
	
	/**
	 * Gets or sets the value of the text field.
	 */
	public var text(get, set):String;
	@:noCompletion function get_text() return _txtField.text;
	@:noCompletion function set_text(val) return _txtField.text = val;
}