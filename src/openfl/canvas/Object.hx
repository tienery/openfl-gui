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
import openfl.display.BitmapData;
import openfl.display.GradientType;
import openfl.display.Graphics;
import openfl.display.InterpolationMethod;
import openfl.display.LineScaleMode;
import openfl.display.CapsStyle;
import openfl.display.JointStyle;
import openfl.display.SpreadMethod;
import openfl.geom.Point;
import openfl.geom.Matrix;
import openfl.Assets;

class Object
{

	private var _x:Float;
	public var x(get, set):Float;
	function get_x() return _x;
	function set_x(val) return _x = val;
	
	private var _y:Float;
	public var y(get, set):Float;
	function get_y() return _y;
	function set_y(val) return _y = val;
	
	private var _width:Float;
	public var width(get, set):Float;
	function get_width() return _width;
	function set_width(val) return _width = val;
	
	private var _height:Float;
	public var height(get, set):Float;
	function get_height() return _height;
	function set_height(val) return _height = val;
	
	public var top(get, never):Float;
	function get_top() return y;
	
	public var left(get, never):Float;
	function get_left() return x;
	
	public var right(get, never):Float;
	function get_right() return x + width;
	
	public var bottom(get, never):Float;
	function get_bottom() return y + height;
	
	public var topLeft(get, never):Point;
	function get_topLeft() return new Point(x, y);
	
	public var topMiddle(get, never):Point;
	function get_topMiddle() return new Point(width / 2 + x, y);
	
	public var topRight(get, never):Point;
	function get_topRight() return new Point(right, y);
	
	public var centerLeft(get, never):Point;
	function get_centerLeft() return new Point(x, height / 2 + y);
	
	public var centerMiddle(get, never):Point;
	function get_centerMiddle() return new Point(width / 2 + x, height / 2 + y);
	
	public var centerRight(get, never):Point;
	function get_centerRight() return new Point(right, height / 2 + y);
	
	public var bottomLeft(get, never):Point;
	function get_bottomLeft() return new Point(x, bottom);
	
	public var bottomMiddle(get, never):Point;
	function get_bottomMiddle() return new Point(width / 2 + x, bottom);
	
	public var bottomRight(get, never):Point;
	function get_bottomRight() return new Point(right, bottom);
	
	private var _lineColor:Color;
	public var lineColor(get, set):Color;
	function get_lineColor() return _lineColor;
	function set_lineColor(val:Color)
	{
		_lineAlpha = val.alpha;
		return _lineColor = val;
	}
	
	private var _lineThickness:Float;
	public var lineThickness(get, set):Float;
	function get_lineThickness() return _lineThickness;
	function set_lineThickness(val) return _lineThickness = val;
	
	private var _lineAlpha:Float;
	public var lineAlpha(get, set):Float;
	function get_lineAlpha() return _lineAlpha;
	function set_lineAlpha(val) return _lineAlpha = val;
	
	private var _linePixelHinting:Bool;
	public var linePixelHinting(get, set):Bool;
	function get_linePixelHinting() return _linePixelHinting;
	function set_linePixelHinting(val) return _linePixelHinting = val;
	
	private var _lineScaleMode:LineScaleMode;
	public var lineScaleMode(get, set):LineScaleMode;
	function get_lineScaleMode() return _lineScaleMode;
	function set_lineScaleMode(val) return _lineScaleMode = val;
	
	private var _lineCapsStyle:CapsStyle;
	public var lineCapsStyle(get, set):CapsStyle;
	function get_lineCapsStyle() return _lineCapsStyle;
	function set_lineCapsStyle(val) return _lineCapsStyle = val;
	
	private var _lineJointStyle:JointStyle;
	public var lineJointStyle(get, set):JointStyle;
	function get_lineJointStyle() return _lineJointStyle;
	function set_lineJointStyle(val) return _lineJointStyle = val;
	
	private var _lineMiterLimit:Float;
	public var lineMiterLimit(get, set):Float;
	function get_lineMiterLimit() return _lineMiterLimit;
	function set_lineMiterLimit(val) return _lineMiterLimit = val;
	
	private var _lineGradientType:GradientType;
	public var lineGradientType(get, set):GradientType;
	function get_lineGradientType() return _lineGradientType;
	function set_lineGradientType(val) return _lineGradientType = val;
	
	private var _lineGradientColors:Array<Color>;
	public var lineGradientColors(get, set):Array<Color>;
	function get_lineGradientColors() return _lineGradientColors;
	function set_lineGradientColors(val) return _lineGradientColors = val;
	
	private var _lineGradientAlphas:Array<Float>;
	public var lineGradientAlphas(get, set):Array<Float>;
	function get_lineGradientAlphas() return _lineGradientAlphas;
	function set_lineGradientAlphas(val) return _lineGradientAlphas = val;
	
	private var _lineGradientRatios:Array<Int>;
	public var lineGradientRatios(get, set):Array<Int>;
	function get_lineGradientRatios() return _lineGradientRatios;
	function set_lineGradientRatios(val) return _lineGradientRatios = val;
	
	private var _lineGradientMatrix:Matrix;
	public var lineGradientMatrix(get, set):Matrix;
	function get_lineGradientMatrix() return _lineGradientMatrix;
	function set_lineGradientMatrix(val) return _lineGradientMatrix = val;
	
	private var _lineGradientSpreadMethod:SpreadMethod;
	public var lineGradientSpreadMethod(get, set):SpreadMethod;
	function get_lineGradientSpreadMethod() return _lineGradientSpreadMethod;
	function set_lineGradientSpreadMethod(val) return _lineGradientSpreadMethod = val;
	
	private var _lineInterpolationMethod:InterpolationMethod;
	public var lineInterpolationMethod(get, set):InterpolationMethod;
	function get_lineInterpolationMethod() return _lineInterpolationMethod;
	function set_lineInterpolationMethod(val) return _lineInterpolationMethod = val;
	
	private var _lineFocalPointRatio:Float;
	public var lineFocalPointRatio(get, set):Float;
	function get_lineFocalPointRatio() return _lineFocalPointRatio;
	function set_lineFocalPointRatio(val) return _lineFocalPointRatio = val;
	
	private var _lineBitmapData:BitmapData;
	public var lineBitmapData(get, set):BitmapData;
	function get_lineBitmapData() return _lineBitmapData;
	function set_lineBitmapData(val) return _lineBitmapData = val;
	
	private var _lineBitmapMatrix:Matrix;
	public var lineBitmapMatrix(get, set):Matrix;
	function get_lineBitmapMatrix() return _lineBitmapMatrix;
	function set_lineBitmapMatrix(val) return _lineBitmapMatrix = val;
	
	private var _lineBitmapRepeat:Bool;
	public var lineBitmapRepeat(get, set):Bool;
	function get_lineBitmapRepeat() return _lineBitmapRepeat;
	function set_lineBitmapRepeat(val) return _lineBitmapRepeat = val;
	
	private var _lineBitmapSmooth:Bool;
	public var lineBitmapSmooth(get, set):Bool;
	function get_lineBitmapSmooth() return _lineBitmapSmooth;
	function set_lineBitmapSmooth(val) return _lineBitmapSmooth = val;
	
	private var _fillColor:Color;
	public var fillColor(get, set):Color;
	function get_fillColor() return _fillColor;
	function set_fillColor(val:Color)
	{
		_fillAlpha = val.alpha;
		return _fillColor = val;
	}
	
	private var _fillAlpha:Float;
	public var fillAlpha(get, set):Float;
	function get_fillAlpha() return _fillAlpha;
	function set_fillAlpha(val) return _fillAlpha = val;
	
	private var _fillGradientType:GradientType;
	public var fillGradientType(get, set):GradientType;
	function get_fillGradientType() return _fillGradientType;
	function set_fillGradientType(val) return _fillGradientType = val;
	
	private var _fillGradientColors:Array<Color>;
	public var fillGradientColors(get, set):Array<Color>;
	function get_fillGradientColors() return _fillGradientColors;
	function set_fillGradientColors(val) return _fillGradientColors = val;
	
	private var _fillGradientAlphas:Array<Float>;
	public var fillGradientAlphas(get, set):Array<Float>;
	function get_fillGradientAlphas() return _fillGradientAlphas;
	function set_fillGradientAlphas(val) return _fillGradientAlphas = val;
	
	private var _fillGradientRatios:Array<Int>;
	public var fillGradientRatios(get, set):Array<Int>;
	function get_fillGradientRatios() return _fillGradientRatios;
	function set_fillGradientRatios(val) return _fillGradientRatios = val;
	
	private var _fillGradientMatrix:Matrix;
	public var fillGradientMatrix(get, set):Matrix;
	function get_fillGradientMatrix() return _fillGradientMatrix;
	function set_fillGradientMatrix(val) return _fillGradientMatrix = val;
	
	private var _fillGradientSpreadMethod:SpreadMethod;
	public var fillGradientSpreadMethod(get, set):SpreadMethod;
	function get_fillGradientSpreadMethod() return _fillGradientSpreadMethod;
	function set_fillGradientSpreadMethod(val) return _fillGradientSpreadMethod = val;
	
	private var _fillInterpolationMethod:InterpolationMethod;
	public var fillInterpolationMethod(get, set):InterpolationMethod;
	function get_fillInterpolationMethod() return _fillInterpolationMethod;
	function set_fillInterpolationMethod(val) return _fillInterpolationMethod = val;
	
	private var _fillFocalPointRatio:Float;
	public var fillFocalPointRatio(get, set):Float;
	function get_fillFocalPointRatio() return _fillFocalPointRatio;
	function set_fillFocalPointRatio(val) return _fillFocalPointRatio = val;
	
	private var _fillBitmapData:BitmapData;
	public var fillBitmapData(get, set):BitmapData;
	function get_fillBitmapData() return _fillBitmapData;
	function set_fillBitmapData(val) return _fillBitmapData = val;
	
	private var _fillBitmapMatrix:Matrix;
	public var fillBitmapMatrix(get, set):Matrix;
	function get_fillBitmapMatrix() return _fillBitmapMatrix;
	function set_fillBitmapMatrix(val) return _fillBitmapMatrix = val;
	
	private var _fillBitmapRepeat:Bool;
	public var fillBitmapRepeat(get, set):Bool;
	function get_fillBitmapRepeat() return _fillBitmapRepeat;
	function set_fillBitmapRepeat(val) return _fillBitmapRepeat = val;
	
	private var _fillBitmapSmooth:Bool;
	public var fillBitmapSmooth(get, set):Bool;
	function get_fillBitmapSmooth() return _fillBitmapSmooth;
	function set_fillBitmapSmooth(val) return _fillBitmapSmooth = val;
	
	public function new(styleName:String = "")
	{
		fillGradientType = GradientType.LINEAR;
		lineGradientType = GradientType.LINEAR;
		lineGradientColors = [];
		lineGradientAlphas = [];
		lineGradientRatios = [];
		fillGradientRatios = [];
		fillGradientAlphas = [];
		fillGradientColors = [];
		
		if (StyleReader.CURRENT != null)
		{
			getStyle(styleName);
		}
	}
	
	private function getStyle(styleName:String)
	{
		var found = false;
		var cl:Dynamic = null;
		
		cl = Reflect.field(StyleReader.CURRENT.classes, styleName);
		if (cl != null) 
			found = true;
		
		if (found)
		{
			trace(cl.inherits);
			if (cl.inherits != null)
			{
				getStyle(cl.inherits);
			}
			
			applyStyle(cl);
		}
	}
	
	private function applyStyle(style:Dynamic)
	{
		//Line Effects
		{
			if (style.lineAlpha != null)
				lineAlpha = style.lineAlpha;
			if (style.lineBitmapDataFile != null)
				lineBitmapData = Assets.getBitmapData(style.lineBitmapDataFile);
			
			if (style.lineBitmapMatrix != null)
			{
				var m = style.lineBitmapMatrix;
			
				if (m != null)
					lineBitmapMatrix = new Matrix(m.a, m.b, m.c, m.d, m.tx, m.ty);
			}
			
			if (style.lineBitmapRepeat != null)
				lineBitmapRepeat = style.lineBitmapRepeat;
			if (style.lineBitmapSmooth != null)
				lineBitmapSmooth = style.lineBitmapSmooth;
			if (style.lineCapsStyle != null)
				lineCapsStyle = CapsStyle.createByName(style.lineCapsStyle);
			
			if (style.lineColor != null)
				lineColor = getColor(style.lineColor);
			
			if (style.lineFocalPointRatio != null)
				lineFocalPointRatio = style.lineFocalPointRatio;
			
			if (style.lineGradientAlphas != null)
				lineGradientAlphas = style.lineGradientAlphas;
			
			if (style.lineGradientColors != null)
				for (i in 0...style.lineGradientColors.length)
					lineGradientColors.push(getColor(style.lineGradientColors[i]));
			
			if (style.lineGradientMatrix != null)
			{
				var m1 = style.lineGradientMatrix;
				if (m1 != null)
					lineGradientMatrix = new Matrix(m1.a, m1.b, m1.c, m1.d, m1.tx, m1.ty);
			}
			
			if (style.lineGradientRatios != null)
				lineGradientRatios = style.lineGradientRatios;
			if (style.lineGradientSpreadMethod != null)
				lineGradientSpreadMethod = SpreadMethod.createByName(style.lineGradientSpreadMethod);
			if (style.lineGradientType != null)
				lineGradientType = GradientType.createByName(style.lineGradientType);
			if (style.lineInterpolationMethod != null)
				lineInterpolationMethod = InterpolationMethod.createByName(style.lineInterpolationMethod);
			if (style.lineJointStyle != null)
				lineJointStyle = JointStyle.createByName(style.lineJointStyle);
			if (style.lineMiterLimit != null)
				lineMiterLimit = style.lineMiterLimit;
			if (style.linePixelHinting != null)
				linePixelHinting = style.linePixelHinting;
			if (style.lineScaleMode != null)
				lineScaleMode = LineScaleMode.createByName(style.lineScaleMode);
			if (style.lineThickness != null)
				lineThickness = style.lineThickness;
		}
		
		//Fill Effects
		{
			if (style.fillAlpha != null)
				fillAlpha = style.fillAlpha;
			if (style.fillBitmapData != null)
				fillBitmapData = Assets.getBitmapData(style.fillBitmapData);
			
			if (style.fillBitmapMatrix)
			{
				var m = style.fillBitmapMatrix;
				if (m != null)
					fillBitmapMatrix = new Matrix(m.a, m.b, m.c, m.d, m.tx, m.ty);
			}
			
			if (style.fillBitmapRepeat != null)
				fillBitmapRepeat = style.fillBitmapRepeat;
			if (style.fillBitmapSmooth != null)
				fillBitmapSmooth = style.fillBitmapSmooth;
			if (style.fillColor != null)
				fillColor = getColor(style.fillColor);
			if (style.fillFocalPointRatio != null)
				fillFocalPointRatio = style.fillFocalPointRatio;
			if (style.fillGradientAlphas != null)
				fillGradientAlphas = style.fillGradientAlphas;
			
			if (style.fillGradientColors != null)
				for (i in 0...style.fillGradientColors.length)
					fillGradientColors.push(getColor(style.fillGradientColors[i]));
			
			if (style.fillGradientMatrix != null)
			{
				var m1 = style.fillGradientMatrix;
				if (m1 != null)
					fillGradientMatrix = new Matrix(m1.a, m1.b, m1.c, m1.d, m1.tx, m1.ty);
			}
			
			if (style.fillGradientRatios != null)
				fillGradientRatios = style.fillGradientRatios;
			if (style.fillGradientSpreadMethod != null)
				fillGradientSpreadMethod = SpreadMethod.createByName(style.fillGradientSpreadMethod);
			if (style.fillGradientType != null)
				fillGradientType = GradientType.createByName(style.fillGradientType);
			if (style.fillInterpolationMethod != null)
				fillInterpolationMethod = InterpolationMethod.createByName(style.fillInterpolationMethod);
		}
	}
	
	private function getColor(value:String):Color
	{
		if (StringTools.startsWith(value, "0x"))
		{
			return Color.colorFromHex(value);
		}
		else
		{
			var result = Color.colorByName(value);
			if (result != null)
				return result;
			else
				return new Color();
		}
	}
	
	public function draw(g:Graphics, applyFill:Bool = false)
	{
		if (lineBitmapData != null)
			g.lineBitmapStyle(lineBitmapData, lineBitmapMatrix, lineBitmapRepeat, lineBitmapSmooth);
		
		if (lineThickness > 0)
			g.lineStyle(lineThickness, lineColor.value, lineAlpha, linePixelHinting, lineScaleMode, lineCapsStyle, lineJointStyle, lineMiterLimit);
		
		if (lineGradientColors.length > 0)
		{
			var colorValues:Array<Int> = [];
			for (c in 0...lineGradientColors.length)
			{
				colorValues.push(lineGradientColors[c].value);
			}
			
			g.lineGradientStyle(lineGradientType, colorValues, lineGradientAlphas, lineGradientRatios, lineGradientMatrix, lineGradientSpreadMethod, lineInterpolationMethod, lineFocalPointRatio);
		}
		
		if (fillBitmapData != null && applyFill)
			g.beginBitmapFill(fillBitmapData, fillBitmapMatrix, fillBitmapRepeat, fillBitmapSmooth);
		
		if (applyFill)
			g.beginFill(fillColor.value, fillAlpha);
		
		if (fillGradientColors.length > 0 && applyFill)
		{
			var colorValues:Array<Int> = [];
			for (c in 0...fillGradientColors.length) 
				colorValues.push(fillGradientColors[c].value);
			
			g.beginGradientFill(fillGradientType, colorValues, fillGradientAlphas, fillGradientRatios, fillGradientMatrix, fillGradientSpreadMethod, fillInterpolationMethod, fillFocalPointRatio);
		}
		
	}
	
}