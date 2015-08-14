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
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.gui.styles.ButtonStyle;
import openfl.gui.styles.FontStyle;
import openfl.gui.styles.Style;
import openfl.text.TextFieldAutoSize;
import openfl.events.MouseEvent;
import openfl.events.Event;

//TODO
class Button extends Control
{

	/**
	 * A button containing text and separate visual states for mouse interactivity.
	 */
	public function new(value:String, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		_txtField = new TextControl(value, font, fontStyle, embedded);
		_txtField.x = 2;
		_txtField.y = 2;
		
		_autoSize = true;
		_iconLocation = "";
		
		addChild(_txtField);
		
		addEventListener(MouseEvent.MOUSE_OVER, function(e)
		{
			_isOver = true;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_DOWN, function(e)
		{
			_isDown = true;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_OUT, function(e)
		{
			_isOver = false;
			_isDown = false;
			redraw();
		});
		
		addEventListener(MouseEvent.MOUSE_UP, function(e)
		{
			_isDown = false;
			redraw();
		});
		
		addEventListener(Event.ADDED_TO_STAGE, function(e)
		{
			redraw();
		});
	}

//Private functions

	override public function onStyleChanged(style:Style):Void 
	{
		redraw();
	}

	private function redraw()
	{
		if (numChildren >= 2)
			removeChildAt(10);
		
		var img:BitmapData = null;
		if (iconLocation != "") 
		{
			//native/neko will crash if the location is invalid
			try
			{
				img = Assets.getBitmapData(iconLocation);
			}
			catch (msg:String)
			{
				
			}
		}
		
		var totalWidth:Float = 0;
		var totalHeight:Float = 0;
		
		if (img != null)
		{
			totalWidth = img.width;
			totalHeight = img.height;
			
			_txtField.wordWrap = true;
			_txtField.width = boundingWidth - totalWidth - 4;
			var bmp:Bitmap = new Bitmap(img);
			
			switch (imageAlign)
			{
				case "left":
					_txtField.y = totalHeight / 2 - _txtField.height / 2;
					_txtField.x = totalWidth + 4;
					totalWidth += _txtField.width + 4;
					bmp.x = 2;
					bmp.y = 2;
				case "right":
					_txtField.y = totalHeight / 2 - _txtField.height / 2;
					_txtField.x = 2;
					totalWidth += _txtField.width + 4;
					bmp.x = totalWidth - bmp.width - 2;
					bmp.y = 2;
				case "top":
					_txtField.y = totalHeight + 4;
					_txtField.x = totalWidth / 2 - _txtField.width / 2;
					totalHeight += _txtField.height + 4;
					bmp.x = 2;
					bmp.y = 2;
				case "bottom":
					_txtField.y = 2;
					_txtField.x = totalWidth / 2 - _txtField.width / 2;
					totalHeight += _txtField.height + 4;
					bmp.x = 2;
					bmp.y = totalHeight - bmp.height - 2;
			}
			
			addChildAt(bmp, 10);
		}
		else
		{
			_txtField.wordWrap = false;
			
			totalHeight = _boundingHeight = _txtField.height + 4;
			totalWidth = _boundingWidth = _txtField.width + 4;
			
			if (autoSize)
			{
				if (_boundingWidth < _txtField.width + 4)
					totalWidth = _txtField.width + 4;
				if (_boundingHeight < _txtField.height + 4)
					totalHeight = _txtField.height + 4;
			}
		}
		
		
		
		var casted:ButtonStyle = null;
		if (Std.is(style, ButtonStyle))
			casted = cast (style, ButtonStyle);
		
		graphics.clear();
		if (casted != null)
		{
			if (_isDown)
			{
				graphics.lineStyle(casted.lineThickness, casted.outlineColorOnDown);
				graphics.beginFill(casted.fillColorOnDown);
				_txtField.textColor = casted.textColorOnDown;
			}
			else if (_isOver)
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
			if (_isDown)
			{
				graphics.lineStyle(1, 0x333333);
				graphics.beginFill(0x222222);
				_txtField.textColor = 0xFFFFFF;
			}
			else if (_isOver)
			{
				graphics.lineStyle(1, 0x999999);
				graphics.beginFill(0x888888);
				_txtField.textColor = 0x000000;
			}
			else
			{
				graphics.lineStyle(1, 0x666666);
				graphics.beginFill(0x555555);
				_txtField.textColor = 0xFFFFFF;
			}
		}
		
		graphics.drawRect(0, 0, totalWidth, totalHeight);
	}

//Properties

	@:noCompletion private var _txtField:TextControl;
	@:noCompletion private var _isOver:Bool;
	@:noCompletion private var _isDown:Bool;

	@:noCompletion private var _autoSize:Bool;
	/**
	 * Gets or sets whether or not the button will automatically size
	 * based on the bounds of the inner text. If an icon exists,
	 * autoSize is ignored.
	 */
	public var autoSize(get, set):Bool;
	@:noCompletion function get_autoSize() return _autoSize;
	@:noCompletion function set_autoSize(val)
	{
		_autoSize = val;
		redraw();
		return _autoSize;
	}

	/**
	 * Gets or sets the text value of the Button.
	 */
	public var text(get, set):String;
	@:noCompletion function get_text() return _txtField.text;
	@:noCompletion function set_text(val) return _txtField.text = val;
	
	@:noCompletion private var _boundingWidth:Float;
	/**
	 * Gets or sets the width of the button. This will redraw
	 * the bounds of the button. This is automatically set if autoSize
	 * is on.
	 */
	public var boundingWidth(get, set):Float;

	@:noCompletion function get_boundingWidth() return _boundingWidth;
	@:noCompletion function set_boundingWidth(val)
	{
		_boundingWidth = val;
		redraw();
		return _boundingWidth;
	}

	@:noCompletion private var _boundingHeight:Float;
	/**
	 * Gets or sets the height of the button. This will redraw
	 * the bounds of the button. This is automatically set if autoSize
	 * is on.
	 */
	public var boundingHeight(get, set):Float;

	@:noCompletion function get_boundingHeight() return _boundingHeight;
	@:noCompletion function set_boundingHeight(val) 
	{
		_boundingHeight = val;
		redraw();
		return _boundingHeight;
	}

	@:noCompletion private var _iconLocation:String;
	/**
	 * Gets or sets the path of the icon to show. If this is empty, or
	 * the path is invalid, no icon will be displayed.
	 */
	public var iconLocation(get, set):String;

	@:noCompletion function get_iconLocation() return _iconLocation;
	@:noCompletion function set_iconLocation(val)
	{
		_iconLocation = val;
		redraw();
		return _iconLocation;
	}

	@:noCompletion private var _imageAlign:String;
	/**
	 * Gets or sets the alignment of the icon, if any. Valid values are:
	 * "left", "right", "top", "bottom". The bounds of the button will resize
	 * to match that of the image and text.
	 */
	public var imageAlign(get, set):String;

	@:noCompletion function get_imageAlign() return _imageAlign;
	@:noCompletion function set_imageAlign(val)
	{
		_imageAlign = val;
		redraw();
		return _imageAlign;
	}

}