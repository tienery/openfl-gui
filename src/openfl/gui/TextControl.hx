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
import openfl.gui.styles.Style;
import openfl.text.TextField;
import openfl.text.AntiAliasType;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;
import openfl.text.GridFitType;
import openfl.text.TextFieldType;

class TextControl extends Control
{
	
	/**
	 * Create a TextControl representing an unselectable TextField.
	 * @param	value		The default value of the control.
	 * @param	font		The embedded asset or name of the font to use.
	 * @param	fontStyle	The style of the font, including size, color and underline.
	 * @param	embedded	Whether to use embedded resources or device fonts.
	 */
	public function new(value:String, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false) 
	{
		super();
		
		_txtField = new TextField();
		
		if (fontStyle != null)
			defaultTextFormat = new TextFormat(embedded ? Assets.getFont(font + ".ttf").fontName : font, 
										fontStyle.size, fontStyle.color, null, null, fontStyle.underline);
		else
			defaultTextFormat = new TextFormat(embedded ? Assets.getFont(font + ".ttf").fontName : font, 
										11, 0x000000, null, null, false);
			
		autoSize = TextFieldAutoSize.LEFT;
		embedFonts = embedded;
		text = value;
		selectable = false;
		multiline = false;
		
		addChild(_txtField);
	}
	
//Properties

	@:noCompletion private var _txtField:TextField;
	
	public var antiAliasType(get, set):AntiAliasType;
	@:noCompletion function get_antiAliasType() return _txtField.antiAliasType;
	@:noCompletion function set_antiAliasType(val) return _txtField.antiAliasType = val;
	
	public var autoSize(get, set):TextFieldAutoSize;
	@:noCompletion function get_autoSize() return _txtField.autoSize;
	@:noCompletion function set_autoSize(val) return _txtField.autoSize = val;
	
	public var background(get, set):Bool;
	@:noCompletion function get_background() return _txtField.background;
	@:noCompletion function set_background(val) return _txtField.background = val;
	
	public var backgroundColor(get, set):Int;
	@:noCompletion function get_backgroundColor() return _txtField.backgroundColor;
	@:noCompletion function set_backgroundColor(val) return _txtField.backgroundColor = val;
	
	public var border(get, set):Bool;
	@:noCompletion function get_border() return _txtField.border;
	@:noCompletion function set_border(val) return _txtField.border = val;
	
	public var borderColor(get, set):Int;
	@:noCompletion function get_borderColor() return _txtField.borderColor;
	@:noCompletion function set_borderColor(val) return _txtField.borderColor = val;
	
	public var bottomScrollV(get, null):Int;
	@:noCompletion function get_bottomScrollV() return _txtField.bottomScrollV;
	
	#if !legacy
	public var caretIndex(get, null):Int;
	@:noCompletion function get_caretIndex() return _txtField.caretIndex;
	#end
	
	public var defaultTextFormat(get, set):TextFormat;
	@:noCompletion function get_defaultTextFormat() return _txtField.defaultTextFormat;
	@:noCompletion function set_defaultTextFormat(val) return _txtField.defaultTextFormat = val;
	
	public var displayAsPassword(get, set):Bool;
	@:noCompletion function get_displayAsPassword() return _txtField.displayAsPassword;
	@:noCompletion function set_displayAsPassword(val) return _txtField.displayAsPassword = val;
	
	public var embedFonts(get, set):Bool;
	@:noCompletion function get_embedFonts() return _txtField.embedFonts;
	@:noCompletion function set_embedFonts(val) return _txtField.embedFonts = val;
	
	public var gridFitType(get, set):GridFitType;
	@:noCompletion function get_gridFitType() return _txtField.gridFitType;
	@:noCompletion function set_gridFitType(val) return _txtField.gridFitType = val;
	
	public var htmlText(get, set):String;
	@:noCompletion function get_htmlText() return _txtField.htmlText;
	@:noCompletion function set_htmlText(val) return _txtField.htmlText = val;
	
	#if !legacy
	public var length(get, null):Int;
	@:noCompletion function get_length() return _txtField.length;
	#end
	
	public var maxChars(get, set):Int;
	@:noCompletion function get_maxChars() return _txtField.maxChars;
	@:noCompletion function set_maxChars(val) return _txtField.maxChars = val;
	
	public var maxScrollH(get, null):Int;
	@:noCompletion function get_maxScrollH() return _txtField.maxScrollH;
	
	public var maxScrollV(get, null):Int;
	@:noCompletion function get_maxScrollV() return _txtField.maxScrollV;
	
	public var multiline(get, set):Bool;
	@:noCompletion function get_multiline() return _txtField.multiline;
	@:noCompletion function set_multiline(val) return _txtField.multiline = val;
	
	public var numLines(get, null):Int;
	@:noCompletion function get_numLines() return _txtField.numLines;
	
	#if !legacy
	public var restrict(get, set):String;
	@:noCompletion function get_restrict() return _txtField.restrict;
	@:noCompletion function set_restrict(val) return _txtField.restrict = val;
	#end
	
	public var scrollH(get, set):Int;
	@:noCompletion function get_scrollH() return _txtField.scrollH;
	@:noCompletion function set_scrollH(val) return _txtField.scrollH = val;
	
	public var scrollV(get, set):Int;
	@:noCompletion function get_scrollV() return _txtField.scrollV;
	@:noCompletion function set_scrollV(val) return _txtField.scrollV = val;
	
	public var selectable(get, set):Bool;
	@:noCompletion function get_selectable() return _txtField.selectable;
	@:noCompletion function set_selectable(val) return _txtField.selectable = val;
	
	#if !legacy
	public var selectionBeginIndex(get, null):Int;
	@:noCompletion function get_selectionBeginIndex() return _txtField.selectionBeginIndex;
	
	public var selectionEndIndex(get, null):Int;
	@:noCompletion function get_selectionEndIndex() return _txtField.selectionEndIndex;
	#end
	
	public var sharpness(get, set):Float;
	@:noCompletion function get_sharpness() return _txtField.sharpness;
	@:noCompletion function set_sharpness(val) return _txtField.sharpness = val;
	
	public var text(get, set):String;
	@:noCompletion function get_text() return _txtField.text;
	@:noCompletion function set_text(val) return _txtField.text = val;
	
	public var textColor(get, set):Int;
	@:noCompletion function get_textColor() return _txtField.textColor;
	@:noCompletion function set_textColor(val) return _txtField.textColor = val;
	
	public var textHeight(get, null):Float;
	@:noCompletion function get_textHeight() return _txtField.textHeight;
	
	public var textWidth(get, null):Float;
	@:noCompletion function get_textWidth() return _txtField.textWidth;
	
	public var type(get, set):TextFieldType;
	@:noCompletion function get_type() return _txtField.type;
	@:noCompletion function set_type(val) return _txtField.type = val;
	
	public var wordWrap(get, set):Bool;
	@:noCompletion function get_wordWrap() return _txtField.wordWrap;
	@:noCompletion function set_wordWrap(val) return _txtField.wordWrap = val;
	
}