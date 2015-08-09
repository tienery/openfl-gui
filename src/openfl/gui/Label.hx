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

import openfl.gui.FontStyle;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFieldAutoSize;
import openfl.Assets;

//TODO (tienery): Implement a TextControl for this class to extend to be considered
//a control.
class Label extends TextField
{

	/**
	 * A TextControl representing a single-line, unselectable label.
	 * @param	value		The value that shows when this label is first created.
	 * @param	font		The location of the embedded font (excluding format), or the name of the font if the font is not being embedded.
	 * @param	fontStyle	The style of the font, including color, underline and size.
	 * @param	embedded	Applies embedding to the TextField if this is true.
	 */
	public function new(value:String, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		//TODO (tiener): Set text format for when embedded is false
		if (fontStyle == null)
			defaultTextFormat = new TextFormat(Assets.getFont(font + ".ttf").fontName, fontStyle.size, fontStyle.color, null, null, fontStyle.underline);
		else
			defaultTextFormat = new TextFormat(Assets.getFont(font + ".ttf").fontName, 11, 0x000000, null, null, false);
			
		autoSize = TextFieldAutoSize.LEFT;
		embedFonts = embedded;
		text = value;
		selectable = false;
		multiline = false;
	}
	
}