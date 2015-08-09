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

package openfl.gui.dialogs;
import openfl.display.Sprite;

//TODO
class Dialog extends Sprite
{

	/**
	 * A dialog, separate from Control drawing calls, that acts as an overlaying element in the
	 * current context, and becomes top-most and causes all underlying display objects to
	 * become inactive until the dialog disappears. It can be fixed or resized just like an ordinary
	 * native window, moveable and minimized.
	 * 
	 * While a dialog is minimized, it no longer takes precedence on any underlying objects and they
	 * become active until the dialog is reshown.
	 * 
	 * If `this` dialog is shown while another dialog is shown, `this` dialog takes precedence and
	 * results in the previous dialog becoming inactive, including any underlying objects.
	 */
	public function new() 
	{
		super();
	}
	
}