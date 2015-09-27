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
import openfl.gui.styles.CheckBoxStyle;
import openfl.gui.styles.FontStyle;
import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.gui.styles.Style;

class CheckBox extends Control
{

	/**
	 * An option selector.
	 * @param value		The text value of the check box.
	 * @param checked	The default check state.
	 * @param font		The embedded resource or device font to use.
	 * @param fontStyle	The style of the font, including size, color and underline.
	 * @param embedded	Whether to use embedded resources for the font.
	 */
	public function new(value:String, checked:Bool = false, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		_txtField = new TextControl(value, font, fontStyle, embedded);
		
		addChild(_txtField);
		
		addEventListener(MouseEvent.MOUSE_OVER, function(e)
		{
			_over = true;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_OUT, function(e)
		{
			_over = false;
			_down = false;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_DOWN, function(e)
		{
			_down = true;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_UP, function(e)
		{
			_down = false;
			redraw();
		});
		
		addEventListener(MouseEvent.CLICK, function(e)
		{
			_checked = !_checked;
			redraw();
		});
		
		addEventListener(Event.ADDED_TO_STAGE, function(e)
		{
			redraw();
		});
	}
	
//Functions

	override public function onStyleChanged(style:Style):Void 
	{
		redraw();
	}

	private function redraw()
	{
		var casted:CheckBoxStyle = null;
		if (Std.is(style, CheckBoxStyle))
			casted = cast (style, CheckBoxStyle);
			
		var outlineColor:Int = 0x999999;
		var fillColor:Int = 0x444444;
		var textColor:Int = 0x444444;
		var canStyle:Bool = false;
		var checkStyle:String = "strike";
		
		if (casted != null) {
			canStyle = true;
			checkStyle = casted.checkStyle;
		}
		
		graphics.clear();
		if (_down)
		{
			outlineColor = canStyle ? casted.outlineColorOnDown : outlineColor - 0x222222;
			fillColor = canStyle ? casted.fillColorOnDown : fillColor - 0x222222;
			textColor = canStyle ? casted.textColorOnDown : textColor;
		}
		else if (_over)
		{
			outlineColor = canStyle ? casted.outlineColorOnOver : outlineColor + 0x222222;
			fillColor = canStyle ? casted.fillColorOnOver : fillColor + 0x111111;
			textColor = canStyle ? casted.textColorOnOver : textColor;
		}
		else
		{
			outlineColor = canStyle ? casted.outlineColor : outlineColor;
			fillColor = canStyle ? casted.fillColor : fillColor;
			textColor = canStyle ? casted.textColor : textColor;
		}
		
		graphics.beginFill(fillColor);
		graphics.lineStyle(canStyle ? casted.lineThickness : 1, outlineColor);
		
		graphics.drawRect(0, 0, 20, 20);
		
		graphics.lineStyle(canStyle ? casted.innerLineThickness : 2, outlineColor);
		if (_checked && !__indeterminate)
		{
			switch (checkStyle)
			{
				case "cross":
					graphics.moveTo(1, 1);
					graphics.lineTo(19, 19);
					graphics.moveTo(1, 19);
					graphics.lineTo(19, 1);
				case "strike":
					graphics.moveTo(1, 19);
					graphics.lineTo(19, 1);
				case "tick":
					graphics.moveTo(1, 11);
					graphics.curveTo(4, 14, 7, 18);
					graphics.moveTo(7, 18);
					graphics.lineTo(18, 1);
			}
		}
		else if (__indeterminate)
		{
			graphics.drawRect(2, 2, 16, 16);
		}
		
		_txtField.textColor = textColor;
		
		_txtField.x = 23;
		_txtField.y = height / 2 - _txtField.height / 2;
		
	}
	
//Properties

	@:noCompletion private var _txtField:TextControl;
	@:noCompletion private var _over:Bool;
	@:noCompletion private var _down:Bool;
	
	@:noCompletion private var _checked:Bool;
	/**
	 * Gets or sets the check state of this check box.
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
	 * Gets or sets the text value of this check box.
	 */
	public var text(get, set):String;
	@:noCompletion function get_text() return _txtField.text;
	@:noCompletion function set_text(val) return _txtField.text = val;
	
	@:noCompletion private var __indeterminate:Bool;
	/**
	 * Gets whether or not the check box is partially checked, often used with CheckBoxNode.
	 */
	public var indeterminate(get, null):Bool;
	@:noCompletion function get_indeterminate() return __indeterminate;
	
}