package com.nicolaspigelet.cyclope;

import com.nicolaspigelet.cyclope.controller.GameController;
import nme.display.Sprite;
import nme.events.Event;
import nme.text.TextField;
import nme.Lib;

/**
 * @author nico
 */
class Main extends Sprite 
{

	private var gameController : GameController;

	public function new() 
	{
		super();

		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		#if iphone
		Lib.current.stage.removeEventListener(Event.RESIZE, init);
		#else
		removeEventListener(Event.ADDED_TO_STAGE, init);
		#end
		
		// init static vars
		Config.STAGE_WIDTH = Lib.current.stage.stageWidth;
		Config.STAGE_HEIGHT = Lib.current.stage.stageHeight;

		// init game
		gameController = new GameController();
		gameController.initialize();
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
