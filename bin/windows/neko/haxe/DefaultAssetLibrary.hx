package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.system.ThreadPool;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var threadPool:ThreadPool;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		path.set ("font/OpenSans-Bold.ttf", "font/OpenSans-Bold.ttf");
		type.set ("font/OpenSans-Bold.ttf", AssetType.FONT);
		path.set ("font/OpenSans-BoldItalic.ttf", "font/OpenSans-BoldItalic.ttf");
		type.set ("font/OpenSans-BoldItalic.ttf", AssetType.FONT);
		path.set ("font/OpenSans-ExtraBold.ttf", "font/OpenSans-ExtraBold.ttf");
		type.set ("font/OpenSans-ExtraBold.ttf", AssetType.FONT);
		path.set ("font/OpenSans-ExtraBoldItalic.ttf", "font/OpenSans-ExtraBoldItalic.ttf");
		type.set ("font/OpenSans-ExtraBoldItalic.ttf", AssetType.FONT);
		path.set ("font/OpenSans-Italic.ttf", "font/OpenSans-Italic.ttf");
		type.set ("font/OpenSans-Italic.ttf", AssetType.FONT);
		path.set ("font/OpenSans-Light.ttf", "font/OpenSans-Light.ttf");
		type.set ("font/OpenSans-Light.ttf", AssetType.FONT);
		path.set ("font/OpenSans-LightItalic.ttf", "font/OpenSans-LightItalic.ttf");
		type.set ("font/OpenSans-LightItalic.ttf", AssetType.FONT);
		path.set ("font/OpenSans-Regular.ttf", "font/OpenSans-Regular.ttf");
		type.set ("font/OpenSans-Regular.ttf", AssetType.FONT);
		path.set ("font/OpenSans-Semibold.ttf", "font/OpenSans-Semibold.ttf");
		type.set ("font/OpenSans-Semibold.ttf", AssetType.FONT);
		path.set ("font/OpenSans-SemiboldItalic.ttf", "font/OpenSans-SemiboldItalic.ttf");
		type.set ("font/OpenSans-SemiboldItalic.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "font/OpenSans-Bold.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-BoldItalic.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-ExtraBold.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-ExtraBoldItalic.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-Italic.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-Light.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-LightItalic.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-Regular.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-Semibold.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		id = "font/OpenSans-SemiboldItalic.ttf";
		path.set (id, id);
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = ApplicationMain.config.assetsPrefix;
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if openfl
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_bold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_bolditalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_extrabold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_extrabolditalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_italic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_light_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_lightitalic_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_semibold_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__font_opensans_semibolditalic_ttf);
		
		#end
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("font/OpenSans-Bold.ttf", __ASSET__font_opensans_bold_ttf);
		type.set ("font/OpenSans-Bold.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-BoldItalic.ttf", __ASSET__font_opensans_bolditalic_ttf);
		type.set ("font/OpenSans-BoldItalic.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-ExtraBold.ttf", __ASSET__font_opensans_extrabold_ttf);
		type.set ("font/OpenSans-ExtraBold.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-ExtraBoldItalic.ttf", __ASSET__font_opensans_extrabolditalic_ttf);
		type.set ("font/OpenSans-ExtraBoldItalic.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-Italic.ttf", __ASSET__font_opensans_italic_ttf);
		type.set ("font/OpenSans-Italic.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-Light.ttf", __ASSET__font_opensans_light_ttf);
		type.set ("font/OpenSans-Light.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-LightItalic.ttf", __ASSET__font_opensans_lightitalic_ttf);
		type.set ("font/OpenSans-LightItalic.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-Regular.ttf", __ASSET__font_opensans_regular_ttf);
		type.set ("font/OpenSans-Regular.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-Semibold.ttf", __ASSET__font_opensans_semibold_ttf);
		type.set ("font/OpenSans-Semibold.ttf", AssetType.FONT);
		
		className.set ("font/OpenSans-SemiboldItalic.ttf", __ASSET__font_opensans_semibolditalic_ttf);
		type.set ("font/OpenSans-SemiboldItalic.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	private function createThreadPool ():Void {
		
		threadPool = new ThreadPool (0, 2);
		threadPool.doWork.add (function (id, data) {
			
			data.result = data.getMethod (id);
			threadPool.sendComplete (data.handler, data);
			
		});
		threadPool.onComplete.add (function (id, data) {
			
			data.handler (data.result);
			
		});
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				handler (audioBuffer);
				
			});
			
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getAudioBuffer (id));
			
		}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			createThreadPool ();
			
		}
		
		threadPool.queue (id, { handler: handler, getMethod: getBytes });
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				handler (Image.fromImageElement (image));
				
			}
			image.src = path.get (id);
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		if (threadPool == null) {
			
			createThreadPool ();
			
		}
		
		threadPool.queue (id, { handler: handler, getMethod: getImage });
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || html5)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				handler (loader.data);
				
			});
			
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}
		
		#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		#end
		
	}
	
	
}


#if !display
#if flash













#elseif html5

@:keep #if display private #end class __ASSET__font_opensans_bold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Bold"; } } 
@:keep #if display private #end class __ASSET__font_opensans_bolditalic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Bold Italic"; } } 
@:keep #if display private #end class __ASSET__font_opensans_extrabold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Extrabold"; } } 
@:keep #if display private #end class __ASSET__font_opensans_extrabolditalic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Extrabold Italic"; } } 
@:keep #if display private #end class __ASSET__font_opensans_italic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Italic"; } } 
@:keep #if display private #end class __ASSET__font_opensans_light_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Light"; } } 
@:keep #if display private #end class __ASSET__font_opensans_lightitalic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Light Italic"; } } 
@:keep #if display private #end class __ASSET__font_opensans_regular_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans"; } } 
@:keep #if display private #end class __ASSET__font_opensans_semibold_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Semibold"; } } 
@:keep #if display private #end class __ASSET__font_opensans_semibolditalic_ttf extends lime.text.Font { public function new () { super (); name = "Open Sans Semibold Italic"; } } 


#else

@:keep #if display private #end class __ASSET__font_opensans_bold_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Bold.ttf"; name = "Open Sans Bold"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_bolditalic_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-BoldItalic.ttf"; name = "Open Sans Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_extrabold_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-ExtraBold.ttf"; name = "Open Sans Extrabold"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_extrabolditalic_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-ExtraBoldItalic.ttf"; name = "Open Sans Extrabold Italic"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_italic_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Italic.ttf"; name = "Open Sans Italic"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_light_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Light.ttf"; name = "Open Sans Light"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_lightitalic_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-LightItalic.ttf"; name = "Open Sans Light Italic"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_regular_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Regular.ttf"; name = "Open Sans"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_semibold_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Semibold.ttf"; name = "Open Sans Semibold"; super (); }}
@:keep #if display private #end class __ASSET__font_opensans_semibolditalic_ttf extends lime.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-SemiboldItalic.ttf"; name = "Open Sans Semibold Italic"; super (); }}


#if (windows || mac || linux)





#end

#if openfl
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_bold_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Bold.ttf"; name = "Open Sans Bold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_bolditalic_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-BoldItalic.ttf"; name = "Open Sans Bold Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_extrabold_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-ExtraBold.ttf"; name = "Open Sans Extrabold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_extrabolditalic_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-ExtraBoldItalic.ttf"; name = "Open Sans Extrabold Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_italic_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Italic.ttf"; name = "Open Sans Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_light_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Light.ttf"; name = "Open Sans Light"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_lightitalic_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-LightItalic.ttf"; name = "Open Sans Light Italic"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_regular_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Regular.ttf"; name = "Open Sans"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_semibold_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-Semibold.ttf"; name = "Open Sans Semibold"; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__font_opensans_semibolditalic_ttf extends openfl.text.Font { public function new () { __fontPath = #if ios "assets/" + #end "font/OpenSans-SemiboldItalic.ttf"; name = "Open Sans Semibold Italic"; super (); }}

#end

#end
#end

