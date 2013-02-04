package com.nicolaspigelet.cyclope.controller;

import com.nmemvc.controller.IController;

import com.nicolaspigelet.cyclope.events.ScreenEvent;

/**
 * @author nico
 */
class GameController implements IController {

	public function new () {
		super();

	}

	public function initialize () : Void {

		initView();
		initModel();
	}

	private function initView() : Void {
		
		homeScreen = new HomeScreen();
		gameScreen = new GameScreen();
		
		addChild(homeScreen);
		addChild(gameScreen);
		
		homeScreen.initialize();
		homeScreen.addEventListener( ScreenEvent.CHANGE, onChangeScreen );
	}

	private function onChangeScreen ( e:ScreenEvent ) : Void {

		trace(e.getScreenID());
	}

	private function initModel() : Void {


	}
}