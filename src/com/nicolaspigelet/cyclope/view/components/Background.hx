package com.nicolaspigelet.cyclope.view.components;

import com.nicolaspigelet.cyclope.Config;
import com.nicolaspigelet.cyclope.view.GameScreen;
import com.nicolaspigelet.cyclope.view.HomeScreen;

import nme.display.Sprite;
import nme.Lib;

class Background extends Sprite {

	private var container : Sprite;

	public function new () {

		super();
		container = new Sprite();
		Lib.current.stage.addChild(container);

	}

	public function update ( screenID : String ) : Void {

		switch ( screenID ) {

			case HomeScreen.SCREEN_ID : 
				container.graphics.clear();
				container.graphics.beginFill( Config.BG_COLOR_HOME );
				container.graphics.drawRect(0,0,Config.STAGE_WIDTH, Config.STAGE_HEIGHT);

			case GameScreen.SCREEN_ID :
				container.graphics.clear();
				container.graphics.beginFill( Config.BG_COLOR_GAME );
				container.graphics.drawRect(0,0,Config.STAGE_WIDTH, Config.STAGE_HEIGHT);

		}

	}

}