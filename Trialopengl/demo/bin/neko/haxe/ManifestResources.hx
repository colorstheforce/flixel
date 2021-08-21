package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_dejavusans_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_ubuntu_r_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_audio_wing_flap_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_1x_atlas_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_1x_atlas_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_1x_background_jpg extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_textures_1x_compressed_texture_atf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_1x_desyrel_fnt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_1x_desyrel_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_dejavusans_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_ubuntu_r_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)


@:keep @:noCompletion #if display private #end class __ASSET__assets_fonts_dejavusans_ttf extends lime.text.Font { public function new () { __fontPath = ManifestResources.rootPath + "assets/fonts/DejaVuSans.ttf"; name = "DejaVu Sans"; super (); }}
@:keep @:noCompletion #if display private #end class __ASSET__assets_fonts_ubuntu_r_ttf extends lime.text.Font { public function new () { __fontPath = ManifestResources.rootPath + "assets/fonts/Ubuntu-R.ttf"; name = "Ubuntu"; super (); }}


#else

@:keep @:expose('__ASSET__assets_fonts_dejavusans_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_dejavusans_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/DejaVuSans.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "DejaVu Sans"; super (); }}
@:keep @:expose('__ASSET__assets_fonts_ubuntu_r_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_ubuntu_r_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/Ubuntu-R.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Ubuntu"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_dejavusans_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_dejavusans_ttf extends openfl.text.Font { public function new () { name = "DejaVu Sans"; super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_ubuntu_r_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_ubuntu_r_ttf extends openfl.text.Font { public function new () { name = "Ubuntu"; super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_dejavusans_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_dejavusans_ttf extends openfl.text.Font { public function new () { __fontPath = ManifestResources.rootPath + "assets/fonts/DejaVuSans.ttf"; name = "DejaVu Sans"; super (); }}
@:keep @:expose('__ASSET__OPENFL__assets_fonts_ubuntu_r_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_ubuntu_r_ttf extends openfl.text.Font { public function new () { __fontPath = ManifestResources.rootPath + "assets/fonts/Ubuntu-R.ttf"; name = "Ubuntu"; super (); }}

#end

#end
#end

#end
