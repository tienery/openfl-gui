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
import openfl.gui.styles.FontStyle;


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
		
	}
	
//Private functions

	private function redraw()
	{
		
	}
	
//Properties

	@:noCompletion private var _txtField:TextControl;
	
}