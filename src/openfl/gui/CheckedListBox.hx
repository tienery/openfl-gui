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
import openfl.geom.Rectangle;
import openfl.gui.CheckedListBox.CheckBoxNode;
import openfl.gui.styles.FontStyle;
import openfl.events.MouseEvent;
import openfl.events.Event;

//TODO
class CheckedListBox extends Control
{

	/**
	 * Represents a list of Check Boxes as nodes to this CheckedListBox.
	 */
	public var items:List<CheckBoxNode>;
	
	private var _scrollPosX:Float;
	public var scrollPosX(get, set):Float;
	function get_scrollPosX() return _scrollPosX;
	function set_scrollPosX(val) return _scrollPosX = val;
	
	private var _scrollPosY:Float;
	public var scrollPosY(get, set):Float;
	function get_scrollPosY() return _scrollPosY;
	function set_scrollPosY(val) return _scrollPosY = val;
	
	private var _actualWidth:Float;
	public var actualWidth(get, set):Float;
	function get_actualWidth() return _actualWidth;
	function set_actualWidth(val)
	{
		scrollRect = new Rectangle(scrollPosX, scrollPosY, val, actualHeight);
		return _actualWidth = val;
	}
	
	private var _actualHeight:Float;
	public var actualHeight(get, set):Float;
	function get_actualHeight() return _actualHeight;
	function set_actualHeight(val) 
	{
		scrollRect = new Rectangle(scrollPosX, scrollPosY, actualWidth, val);
		return _actualHeight = val;
	}
	
	/**
	 * A series of CheckBoxes contained within a list.
	 */
	public function new(width:Float, height:Float, values:Array<CheckBoxNodeItems>, defaultFont:String = "Arial", embedded:Bool = false) 
	{
		super();
		
		items = new List<CheckBoxNode>();
		
		scrollRect = new Rectangle(0, 0, width, height);
		
		getItem(values, defaultFont, embedded);
		
		addEventListener(MouseEvent.MOUSE_WHEEL, function(e)
		{
			if (e.delta > 0)
				scrollPosY -= 3;
			else if (e.delta < 0)
				scrollPosY += 3;
		});
	}
	
//Functions
	
	@:noCompletion private function getItem(values:Array<CheckBoxNodeItems>, defaultFont:String, embedded:Bool, checkForSub:Bool = false)
	{
		var _items = new List<CheckBoxNode>();
		for (i in 0...values.length)
		{
			var node = new CheckBoxNode(values[i].text, false, defaultFont, FontStyle.DEFAULT, embedded);
			if (values[i].items.length > 0)
			{
				
			}
			_items.add(node);
		}
	}
	
	
}

class CheckBoxNode extends CheckBox
{
	
	/**
	 * Creates a CheckBox that acts as a node for a CheckedListBox. Can contain children, and CheckBox's in this
	 * form can also become indeterminate.
	 * @param	value		The text value of the check box.
	 * @param	checked		The default check state.
	 * @param	font		The embedded resource or device font to use.
	 * @param	fontStyle	The style of the font, including size, color and underline.
	 * @param	embedded	Whether to use embedded resources for the font.
	 */
	public function new(value:String, checked:Bool = false, font:String = "Arial", fontStyle:FontStyle = null, embedded:Bool = false)
	{
		super(value, checked, font, fontStyle, embedded);
		
		__items = new List<CheckBoxNode>();
		_defaultFontName = font;
		_defaultFontStyle = fontStyle;
		_defaultEmbedded = embedded;
		
		redraw();
	}
	
//Functions

	/**
	 * Add a child to this node.
	 * @param	value		The text value of the check box.
	 * @param	checked		The default check state.
	 */
	public function addItem(value:String, checked:Bool = false)
	{
		__items.add(new CheckBoxNode(value, checked, _defaultFontName, _defaultFontStyle, _defaultEmbedded));
	}

	private override function redraw()
	{
		var items:List<CheckBoxNode> = getAllChildNodes(this);
		var partial = false;
		for (item in 0...items.length)
		{
			if (!items[item].checked)
				partial = true;
		}
		__indeterminate = partial;
		
		super.redraw();
	}
	
	private function getAllChildNodes(node:CheckBoxNode):List<CheckBoxNode>
	{
		var items = new List<CheckBoxNode>();
		for (i in 0...node.__items.length)
		{
			items.add(node.__items[i]);
			var children = getAllChildNodes(node.__items[i]);
			for (j in 0...children.length)
			{
				items.add(children[j]);
			}
		}
		return items;
	}
	
//Properties

	@:noCompletion private var __items:List<CheckBoxNode>;
	@:noCompletion private var _defaultFontName:String;
	@:noCompletion private var _defaultFontStyle:FontStyle;
	@:noCompletion private var _defaultEmbedded:Bool;
	
}

typedef CheckBoxNodeItems = { var text:String; var items:Array<CheckBoxNodeItems>; }