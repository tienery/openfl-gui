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

/**
 * ...
 * @author tienery
 */
class FontStyle
{
	
	public var size:
		#if flash
		Float
		#else
		Int
		#end
		;
	public var color:Int;
	public var underline:Bool;
	
	public function new(size:
		#if flash
		Float
		#else
		Int
		#end
			, color:Int, underline:Bool) 
	{
		this.size = size;
		this.color = color;
		this.underline = underline;
	}
	
	private static var _default:FontStyle;
	public static var DEFAULT(get, null):FontStyle;
	
	static function get_DEFAULT()
	{
		if (_default == null)
			_default = new FontStyle(11, 0x000000, false);
			
		return _default;
	}
	
	private static var _heading:FontStyle;
	public static var HEADING(get, null):FontStyle;
	
	static function get_HEADING()
	{
		if (_heading == null)
			_heading = new FontStyle(16, 0x000000, false);
			
		return _heading;
	}
	
	private static var _link:FontStyle;
	public static var LINK(get, null):FontStyle;
	
	static function get_LINK()
	{
		if (_link == null)
			_link = new FontStyle(11, 0x000000, true);
			
		return _link;
	}
}