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
import openfl.events.Event;
import openfl.gui.styles.Style;

class Control extends Sprite
{
	
	/**
	 * The Control is the base class for all GUI components.
	 */
	public function new() 
	{
		super();
		
		_dock = 0;
		_anchor = ANCHOR_TOP | ANCHOR_LEFT;
		
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
//Public functions and behaviour
	
	public function onStyleChanged(style:Style):Void
	{
		
	}

	
//Private functions and behaviour

	@:noCompletion private function init(e:Event)
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		Lib.current.stage.addEventListener(Event.RESIZE, onStageResize);
	}
	
	@:noCompletion private function onStageResize(e:Event)
	{	
		if (flagComparison(anchor, ANCHOR_RIGHT))
			x = stage.stageWidth - _right - width;
		if (flagComparison(anchor, ANCHOR_BOTTOM))
			y = stage.stageHeight - _bottom - height;
	}
	
	@:noCompletion private function recalc()
	{
		var totalTop:Float = 0;
		var totalRight:Int = 0;
		var totalLeft:Int = 0;
		var totalBottom:Int = 0;
		for (i in 0...parent.numChildren)
		{
			if (Std.is(parent.getChildAt(i), Control))
			{	
				var obj = cast (parent.getChildAt(i), Control);
				if (obj.dock == DOCK_TOP)
				{
					obj.y = totalTop;
					totalTop += obj.height;
				}
				else if (obj.dock == DOCK_LEFT)
				{
					
				}
			}
		}
	}
	
	@:noCompletion private function flagComparison(original:Int, current:Int)
	{
		return current & original != 0;
	}
	
//Properties
	
	@:noCompletion private var _bottom:Float;
	@:noCompletion private var _right:Float;
	
	@:noCompletion private var _anchor:Int;
	/**
	 * Represents the anchor point that this control will stay relative to
	 * when its parent control (or stage) is resized.
	 */
	public var anchor(get, set):Int;
	
	@:noCompletion function get_anchor() return _anchor;
	@:noCompletion function set_anchor(val)
	{
		if (flagComparison(val, ANCHOR_RIGHT)) {
			_right = Lib.current.stage.stageWidth - x + width;
		}
		if (flagComparison(val, ANCHOR_BOTTOM))
			_bottom = Lib.current.stage.stageHeight - y + height;
			
		return _anchor = val;
	}
	
	@:noCompletion private var _dock:Int;
	/**
	 * Docks the control to top, bottom, left, right or filled.
	 * The control is restricted to being resized based on its filter.
	 * If the control is filled, then the parent controls its resize.
	 */
	public var dock(get, set):Int;
	
	@:noCompletion function get_dock() return _dock;
	@:noCompletion function set_dock(val) return _dock = val;
	
	@:noCompletion private var _contextMenu:ContextMenuStrip;
	/**
	 * The context menu that appears when this control is right-clicked
	 * within its bounds.
	 */
	public var contextMenuStrip(get, set):ContextMenuStrip;
	
	@:noCompletion function get_contextMenuStrip() return _contextMenu;
	@:noCompletion function set_contextMenuStrip(val) return _contextMenu = val;
	
	@:noCompletion private var _style:Style;
	public var style(get, set):Style;
	
	@:noCompletion function get_style() return _style;
	@:noCompletion function set_style(val)
	{
		onStyleChanged(val);
		return _style = val;
	}
	
	
	@:noCompletion private var _toolTip:ToolTip;
	/**
	 * The tooltip format to display when the mouse hovers over this
	 * control for a short period.
	 */
	public var toolTip(get, set):ToolTip;
	
	@:noCompletion function get_toolTip() return _toolTip;
	@:noCompletion function set_toolTip(val) return _toolTip = val;
	
	@:noCompletion private var _toolTipValue:Dynamic;
	/**
	 * The data values of the tooltip to show when the mouse
	 * hovers over this control.
	 */
	public var toolTipValue(get, set):Dynamic;
	
	@:noCompletion function get_toolTipValue() return _toolTipValue;
	@:noCompletion function set_toolTipValue(val) return _toolTipValue = val;
	
	
//Static variables
	
	public static inline var ANCHOR_NONE:Int = 0;
	public static inline var ANCHOR_TOP:Int = 1;
	public static inline var ANCHOR_LEFT:Int = 2;
	public static inline var ANCHOR_RIGHT:Int = 4;
	public static inline var ANCHOR_BOTTOM:Int = 8;
	
	public static inline var DOCK_NONE:Int = 0;
	public static inline var DOCK_TOP:Int = 1;
	public static inline var DOCK_LEFT:Int = 2;
	public static inline var DOCK_RIGHT:Int = 3;
	public static inline var DOCK_BOTTOM:Int = 4;
	public static inline var DOCK_FILL:Int = 5;
	
}