package com.nicolaspigelet.cyclope;

import com.nicolaspigelet.cyclope.events.ScreenEvent;
import com.nicolaspigelet.cyclope.screens.GameScreen;
import com.nicolaspigelet.cyclope.screens.HomeScreen;
import com.nicolaspigelet.cyclope.screens.Screen;
import nme.display.Sprite;
import nme.events.Event;
import nme.text.TextField;
import nme.Lib;

/**
 * @author nico
 */

class Main extends Sprite 
{
	private var gameScreen : GameScreen;
	private var homeScreen : HomeScreen;
	
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

		// init screens
		homeScreen = new HomeScreen();
		gameScreen = new GameScreen();
		
		addChild(homeScreen);
		addChild(gameScreen);
		
		homeScreen.initialize();
		homeScreen.addEventListener( ScreenEvent.CHANGE, onChangeScreen );
	}
	
	private function onChangeScreen(e:ScreenEvent):Void 
	{
		switch (e.getScreenID()) {
			
			case GameScreen.SCREEN_ID :
				// TODO
			
		}
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
