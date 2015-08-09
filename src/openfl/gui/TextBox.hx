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

//TODO (tienery): Needs completion
class TextBox extends Sprite
{

	private var _lblField:Label;
	private var _hasFocus:Bool;
	
	private var _totalWidth:Float;
	public var totalWidth(get, set):Float;
	
	function get_totalWidth() return _totalWidth;
	function set_totalWidth(val) return _totalWidth = val;
	
	private var _totalHeight:Float;
	public var totalHeight(get, set):Float;
	
	function get_totalHeight() return _totalHeight;
	function set_totalHeight(val) 
	{
		_totalHeight = val;
		
	}
	
	/**
	 * 
	 * @param	defaultValue
	 * @param	width
	 * @param	height
	 * @param	font
	 * @param	fontStyle
	 * @param	embedded
	 */
	public function new(defaultValue:String, width:Float = 100, height:Float = 20, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		graphics.lineStyle(1, 0x555555);
		graphics.drawRect(0, 0, width, height);
		
		_totalWidth = width;
		
		
		_lblField = new Label(defaultValue, font, fontStyle, embedded);
		_lblField.selectable = true;
		_lblField.x = 2;
		_lblField.y = 2;
	}
	
	private function redraw()
	{
		if (_hasFocus)
		{
			
		}
	}
	
}