package com.nicolaspigelet.cyclope;

import com.nicolaspigelet.cyclope.controller.GameController;

import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

import nme.ui.Multitouch;
import nme.ui.MultitouchInputMode;

/**
 * @author nico
 */
class Main extends Sprite 
{

	private var multiTouchSupported : Bool;
	private var gameController : GameController;

	static public function main() {
		#if iphone
		haxe.Timer.delay( create, 20 );
		#else 
		create();
		#end
	}

	static private function create () {

		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}

	public function new() 
	{
		super();
		
		// init static vars
		Config.STAGE_WIDTH = Lib.current.stage.stageWidth;
		Config.STAGE_HEIGHT = Lib.current.stage.stageHeight;

		multiTouchSupported = Multitouch.supportsTouchEvents;
		if (multiTouchSupported) {
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
		}

		// init game
		gameController = new GameController();
		gameController.initialize();
	}
	
}
