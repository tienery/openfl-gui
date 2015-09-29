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

package openfl.canvas;
import openfl.display.Graphics;
import openfl.geom.Point;

class Circle extends Object
{

	private var _previousWidth:Float;
	private var _previousHeight:Float;
	
	private var _radius:Float;
	/**
	 * Gets or sets a value defining the radius for this circle. If this value is 0,
	 * then the circle is drawn as an ellipse using the `width` and `height` properties.
	 * Setting the radius to anything greater than 0 will recalculate the `width` and `height`
	 * properties of this control, otherwise these values will revert back to their previously
	 * assigned, if one existed.
	 */
	public var radius(get, set):Float;
	function get_radius() return _radius;
	function set_radius(val)
	{
		if (val > 0)
		{
			_previousWidth = width;
			_previousHeight = height;
			width = height = radius * 2;
		}
		else
		{
			width = _previousWidth;
			height = _previousHeight;
			return _radius = 0;
		}
		return _radius = val;
	}
	
	/**
	 * Gets the circumference of this circle. If it is drawn as an ellipse, it is calculated using Ramanujan's
	 * approximation.
	 */
	public var perimeter(get, never):Float;
	function get_perimeter()
	{
		if (radius > 0)
			return (Math.PI * 2 * radius);
		else
			return (Math.PI * ((3 * width) + (3 * height)) - (Math.sqrt(((3 * width) + height) * (width + (3 * height)))));
	}
	
	/**
	 * Gets the exact `Point` indicating the top-left side of this circle.
	 */
	public var topLeftSide(get, never):Point;
	function get_topLeftSide() return new Point(x - radius, y - radius);
	
	/**
	 * Gets the exact `Point` indicating the top-right side of this circle.
	 */
	public var topRightSide(get, never):Point;
	function get_topRightSide() return new Point(x + radius, y - radius);
	
	/**
	 * Gets the exact `Point` indicating the bottom-left side of this circle.
	 */
	public var bottomLeftSide(get, never):Point;
	function get_bottomLeftSide() return new Point(x - radius, y + radius);
	
	/**
	 * Gets the exact `Point` indicating the bottom-right side of this circle.
	 */
	public var bottomRightSide(get, never):Point;
	function get_bottomRightSide() return new Point(x + radius, y + radius);
	
	/**
	 * Creates a `Circle` from the given point and radius. Styling will be applied if a `styleName` is given.
	 * @param	x			The point along the x-axis that this circle starts drawing from. 
	 * 						This is indicated as the centre of the circle.
	 * @param	y			The point along the y-axis that this circle starts drawing from. 
	 * 						This is indicated as the centre of the circle.
	 * @param	width		The width of this circle, when drawn as an ellipse.
	 * @param	height		The height of this circle, when drawn as an ellipse.
	 * @param	radius		The radius of this circle. If this value is greater than 0, width and height are
	 * 						calculated accordingly, and their previous values are ignored until this value is
	 * 						set to 0.
	 * @param	styleName	The name of the style to use when styling this circle.
	 */
	public function new(x:Float, y:Float, width:Float, height:Float, radius:Float = 0, styleName:String = "")
	{
		super(styleName);
		
		this.x = x;
		this.y = y;
		if (radius > 0)
		{
			_previousWidth = width;
			_previousHeight = height;
			this.width = this.height = radius * 2;
			this.radius = radius;
		}
		else
		{
			this.width = width;
			this.height = height;
		}
	}
	
	/**
	 * This will draw the circle in the given graphics component. If radius is greater than 0, it is drawn
	 * as a circle, otherwise it is drawn as an ellipse.
	 * @param	g			The graphics component to draw this circle to.
	 * @param	applyFill	A value indicating whether or not to apply fill the circle.
	 */
	public override function draw(g:Graphics, applyFill:Bool = false)
	{
		super.draw(g, applyFill);
		
		if (radius > 0)
			g.drawCircle(x, y, radius);
		else
			g.drawEllipse(x, y, width, height);
	}
	
}