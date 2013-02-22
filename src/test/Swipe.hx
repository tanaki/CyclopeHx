package com.nicolaspigelet.cyclope;

import com.bit101.components.PushButton;

import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.events.TouchEvent;
import nme.Lib;

class Main extends Sprite {

	inline private static var X_THRESHOLD : Float = 50;
	inline private static var TIME_THRESHOLD : Float = 0.3;

	private var isTouching : Bool = false;
	private var startX : Float;
	private var startY : Float;
	private var startTime : Float;
	private var stopTime : Float;
	private var deltaX : Float;

	public function new () {

		super();

		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e):Void 
	{
		#if iphone
		Lib.current.stage.removeEventListener(Event.RESIZE, init);
		#else
		removeEventListener(Event.ADDED_TO_STAGE, init);
		#end

		// Entry point
		#if mobile
		Lib.current.stage.addEventListener( TouchEvent.TOUCH_BEGIN, onBegin );
		#else
		Lib.current.stage.addEventListener( MouseEvent.MOUSE_DOWN, onBegin );
		#end
	}

	private function onBegin ( e : Dynamic ) : Void {

		// Prevent from multitouch
		if ( isTouching ) return;
		isTouching = true;
    	deltaX = 0;
    	startTime = haxe.Timer.stamp();

		#if mobile
		startX = e.localX;
		startY = e.localY;

		Lib.current.stage.removeEventListener( TouchEvent.TOUCH_BEGIN, onBegin );
		Lib.current.stage.addEventListener( TouchEvent.TOUCH_MOVE, onMove );
		Lib.current.stage.addEventListener( TouchEvent.TOUCH_END, onStop );
		#else
		startX = mouseX;
		startY = mouseY;
		
		Lib.current.stage.removeEventListener( MouseEvent.MOUSE_DOWN, onBegin );
		Lib.current.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMove );
		Lib.current.stage.addEventListener( MouseEvent.MOUSE_UP, onStop );
		#end
	}

	private function onMove ( e:TouchEvent ) : Void {

		var currentX : Float;
		#if mobile
		currentX = e.localX;
		#else
		currentX = mouseX;
		#end

		deltaX = currentX - startX;
	}

	private function onStop ( e:TouchEvent ) : Void {

		isTouching = false;
		stopTime = haxe.Timer.stamp();

		if ( Math.abs( deltaX ) > X_THRESHOLD && stopTime - startTime < TIME_THRESHOLD ) {
			if ( deltaX > 0 ) {
				trace("direction 1");
			} else {
				trace("direction 2");
			}
		}

		#if mobile
		Lib.current.stage.removeEventListener( TouchEvent.TOUCH_MOVE, onMove );
		Lib.current.stage.removeEventListener( TouchEvent.TOUCH_END, onStop );
		Lib.current.stage.addEventListener( TouchEvent.TOUCH_BEGIN, onBegin );
		#else
		Lib.current.stage.removeEventListener( MouseEvent.MOUSE_MOVE, onMove );
		Lib.current.stage.removeEventListener( MouseEvent.MOUSE_UP, onStop );
		Lib.current.stage.addEventListener( MouseEvent.MOUSE_DOWN, onBegin );
		#end
	}
}