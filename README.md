This project is no longer being worked on and will be archived.

# openfl-gui
A GUI extension for OpenFL, containing a rich selection of hardware-accelerated and fully customisable controls.

## Patch Notes (v2.0.1-alpha.8)
### Additions

* The `Circle` class has been added.

## Current Features
The following controls can be used:

* TextBox
* TextControl (just a simple label)
* Button (can add images)
* CheckBox
* RadioButton

You can find sample code in Main.hx in the src folder.

For best performance, turn vsync off and hardware on, and turning the fps limit up.
If you are using a laptop with an integrated graphics card, this library may be suboptimal.
This library is ideally optimal on systems with a dedicated graphics card, and these controls are designed to work
alongside other graphics components, bitmaps and game features.
To fully benefit from hardware-acceleration, it is recommended that OpenFL version 3.x is installed and compiled in `next`.

To use this in HTML5, it is recommended to switch the `webgl` flag on compile, such as `openfl build html5 -Dwebgl`.

## Roadmap

As features are completed, they will be shifted up to the "Current Features" in the order that you see them here.

 * CheckedListBox (partially complete - does not work quite yet)
 * ComboBox
 * ListBox
 * NumericUpDown
 * ProgressBar
 * Slider
 * ToolTip
 * ContextMenuStrip
 * MenuStrip

### Advanced Controls

 * FlowLayoutPanel
 * GroupBox
 * TabControl
 * DragDropInterface
 * ListView
 * PropertyGrid
 * StatusStrip
 * ToolStrip
 * TreeView
 * DataGridView

### Utility Controls

 * Calendar
 * PrintDocument

### Dialogs

 * Dialog
 * MessageBox
 * ColorDialog
 * FileDialog*
 * FolderBrowserDialog*
 * FontDialog
 * PageSetupDialog*
 * PrintDialog*

*Will probably look into native controls for this functionality on Windows, Linux and Mac, and a simpler explorer-like
file dialog that you may place into a game.
