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

package openfl.gui.styles;

class TextBoxStyle extends Style
{

	/**
	 * Adjusts the outline color of the text box when the mouse hovers over the control.
	 */
	public var outlineColorOnOver:Int;
	/**
	 * Adjusts the fill color of the text box when the mouse hovers over the control.
	 */
	public var fillColorOnOver:Int;
	/**
	 * Adjusts the color of text within the text box when the mouse hovers over the control.
	 */
	public var textColorOnOver:Int;
	/**
	 * Adjusts the thickness of the border of the text box.
	 */
	public var lineThickness:Float;
	
	/**
	 * Create a new style for a TextBox or any of its descendants.
	 */
	public function new() 
	{
		super();
	}
	
}