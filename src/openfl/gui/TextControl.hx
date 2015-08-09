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
import openfl.text.TextField;
import openfl.text.AntiAliasType;
import openfl.text.TextFieldAutoSize;


//TODO (tienery): Complete implementation of the TextControl (don't want
//TextField's to be left out of the scope of GUI components unless the
//user specifically wants TextField's).
class TextControl extends Control
{

	
	@:noCompletion private var _txtField:TextField;
	
	public var antiAliasType(get, set):AntiAliasType;
	function get_antiAliasType() return _txtField.antiAliasType;
	function set_antiAliasType(val) return _txtField.antiAliasType = val;
	
	public var autoSize(get, set):TextFieldAutoSize;
	function get_autoSize() return _txtField.autoSize;
	function set_autoSize(val) return _txtField.autoSize = val;
	
	
	
	public function new() 
	{
		super();
		
		_txtField = new TextField();
	}
	
}