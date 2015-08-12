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
import openfl.display.Sprite;
import openfl.events.FocusEvent;
import openfl.geom.Rectangle;
import openfl.gui.styles.FontStyle;
import openfl.gui.styles.Style;
import openfl.text.TextFieldType;
import openfl.events.Event;
import openfl.gui.styles.TextBoxStyle;
import openfl.events.MouseEvent;
import openfl.events.TextEvent;
import openfl.text.TextFieldAutoSize;

class TextBox extends Control
{

	@:noCompletion private var _hasFocus:Bool;
	@:noCompletion private var _txtField:TextControl;

	/**
	 * Create an interactive text box.
	 * @param	defaultValue	The default value of the text box.
	 * @param	width			The width of the text box.
	 * @param	height			The height of the text box.
	 * @param	font			The embedded resource or name of the font to use.
	 * @param	fontStyle		The style of the font, including size, color and underline.
	 * @param	embedded		Whether to use embedded resources or device fonts.
	 */
	public function new(defaultValue:String, width:Float = 100, height:Float = 20, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		_totalWidth = width;
		_totalHeight = height;
		
		_txtField = new TextControl(defaultValue, font, fontStyle, embedded);
		_txtField.autoSize = TextFieldAutoSize.NONE;
		_txtField.width = width - 4;
		_txtField.multiline = true;
		_txtField.selectable = true;
		_txtField.type = TextFieldType.INPUT;
		_txtField.x = 2;
		_txtField.y = 1;
		
		addChild(_txtField);
		
		_txtField.addEventListener(MouseEvent.MOUSE_WHEEL, function(e)
		{
			if (e.delta > 0)
				_txtField.scrollV++;
			else if (e.delta < 0)
				_txtField.scrollV--;
		});
		
		addEventListener(FocusEvent.FOCUS_IN, function(e)
		{
			_hasFocus = true;
			redraw();
		});
		
		addEventListener(FocusEvent.FOCUS_OUT, function(e)
		{
			_hasFocus = false;
			redraw();
		});
		
		addEventListener(Event.ADDED_TO_STAGE, function(e)
		{
			redraw();
		});
	}

//Public functions

	override public function onStyleChanged(style:Style):Void 
	{
		redraw();
	}

//Private functions

	private function redraw()
	{
		var casted:TextBoxStyle = null;
		if (Std.is(style, TextBoxStyle))
			casted = cast (style, TextBoxStyle);
		
		graphics.clear();
		if (casted != null)
		{
			if (_hasFocus) 
			{
				graphics.lineStyle(casted.lineThickness, casted.outlineColorOnOver);
				graphics.beginFill(casted.fillColorOnOver);
				_txtField.textColor = casted.textColorOnOver;
			}
			else
			{
				graphics.lineStyle(casted.lineThickness, casted.outlineColor);
				graphics.beginFill(casted.fillColor);
				_txtField.textColor = casted.textColor;
			}
		}
		else
		{
			if (_hasFocus) 
			{
				graphics.lineStyle(1, 0x000000);
				graphics.beginFill(0xFFFFFF);
				_txtField.textColor = 0x000000;
			}
			else
			{
				graphics.lineStyle(1, 0x999999);
				graphics.beginFill(0xFFFFFF);
				_txtField.textColor = 0x999999;
			}
		}
		
		graphics.drawRect(0, 0, totalWidth, totalHeight);
	}

//Properties

	@:noCompletion private var _totalWidth:Float;
	/**
	 * Specifies the width of the text box. This will redraw
	 * the bounds of the text box.
	 */
	public var totalWidth(get, set):Float;

	@:noCompletion function get_totalWidth() return _totalWidth;
	@:noCompletion function set_totalWidth(val)
	{
		_totalWidth = val;
		_txtField.width = val - 4;
		redraw();
		return _totalWidth;
	}

	@:noCompletion private var _totalHeight:Float;
	/**
	 * Specifies the height of the text box. This will redraw
	 * the bounds of the text box.
	 */
	public var totalHeight(get, set):Float;

	@:noCompletion function get_totalHeight() return _totalHeight;
	@:noCompletion function set_totalHeight(val) 
	{
		_totalHeight = val;
		redraw();
		return _totalHeight;
	}
	
	/**
	 * Gets or sets the text within the control.
	 */
	public var text(get, set):String;
	@:noCompletion function get_text() return _txtField.text;
	@:noCompletion function set_text(val) return _txtField.text = val;

}