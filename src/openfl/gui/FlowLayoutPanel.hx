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

//TODO
class FlowLayoutPanel extends Control
{
	
	/**
	 * A container that flows controls left-to-right (or vice versa) or top-to-bottom (or vice versa),
	 * based on its respective rows/columns.
	 * 
	 * When controls flow left-to-right, this results in controls flowing downward until reaching the `maxRowHeight`
	 * before flowing left. When controls reach the bottom-right-most corner of the current row, they flow
	 * through into the next row.
	 * 
	 * Controls are effectively docked to the top of each individual row/column as necessary expect where
	 * `maxRowHeight` takes presedence. If `maxRowHeight` is not set, then this is assigned based on the maximum
	 * default width of each control.
	 * 
	 * If there are more controls to fit the panel in either formation, then the panel is clipped and a new row or column
	 * is automatically created, based on `maxWidth` or `maxHeight`, respectively.
	 * 
	 * Column and row boundaries are not visible by default.
	 */
	public function new() 
	{
		super();
	}
	
}