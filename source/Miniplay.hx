package;

import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.util.FlxTimer;
import lime.app.Application;
import openfl.display.Stage;

using StringTools;

class Miniplay {

    inline static public function postEvent(event:String = "", value:Int = 0, ?stringValue:String = "")
	{
        trace("Miniplay: Post event: "+event+" "+value+" "+stringValue);
        try {
            MiniplayHaxeAPI.onEvent(event, value, stringValue);
        } catch (e) {
            trace("Miniplay: Error, native MiniplayHaxeAPI not available");
        }
	}

	inline static public function postScore(song:String, score:Int = 0, ?diff:Int = 0)
	{
        trace("Miniplay: Post score "+song+" "+score+" "+diff);
        try {
            MiniplayHaxeAPI.onScore(song, score, diff);
        } catch (e) {
            trace("Miniplay: Error, native MiniplayHaxeAPI not available");
        }
	}

	inline static public function postWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 0)
    {
        trace("Miniplay: Post week score "+week+" "+score+" "+diff);
        try {
            MiniplayHaxeAPI.onWeekScore(week, score, diff);
        } catch (e) {
            trace("Miniplay: Error, native MiniplayHaxeAPI not available");
        }
    }

}

/* NATIVE CALLS */
@:native("MiniplayHaxeAPI")
extern class MiniplayHaxeAPI {

    static function onEvent(event:String = "", value:Int = 0, ?stringValue:String = "") :Void;

	static function onScore(song:String, score:Int = 0, ?diff:Int = 0):Void;

	static function onWeekScore(week:Int = 1, score:Int = 0, ?diff:Int = 0):Void;

}