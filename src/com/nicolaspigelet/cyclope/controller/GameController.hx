package com.nicolaspigelet.cyclope.controller;

import com.nmemvc.controller.IController;

import com.nicolaspigelet.cyclope.events.ScreenEvent;
import com.nicolaspigelet.cyclope.view.GameScreen;
import com.nicolaspigelet.cyclope.view.HomeScreen;
import com.nicolaspigelet.cyclope.view.components.Background;

import nme.Lib;

/**
 * @author nico
 */
class GameController implements IController {

	private var background : Background;
	private var homeScreen : HomeScreen;
	private var gameScreen : GameScreen;

	public function new () {

	}

	public function initialize () : Void {

		initView();
		initModel();
	}

	private function initView() : Void {
		
		background = new Background();
		homeScreen = new HomeScreen();
		gameScreen = new GameScreen();
		
		Lib.current.stage.addChild(background);
		Lib.current.stage.addChild(homeScreen);
		Lib.current.stage.addChild(gameScreen);
		
		homeScreen.start();
		homeScreen.addEventListener( ScreenEvent.CHANGE, onChangeScreen );
		background.update(HomeScreen.SCREEN_ID);
	}

	private function onChangeScreen ( e:ScreenEvent ) : Void {

		switch (e.getScreenID()) {
			
			case GameScreen.SCREEN_ID :
				homeScreen.pause();
				gameScreen.start();
				background.update(GameScreen.SCREEN_ID);

		}
	}

	private function initModel() : Void {


	}
}