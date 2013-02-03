package com.nicolaspigelet.cyclope.screens;

import nme.text.TextField;

/**
 * @author nico
 */

class GameScreen extends Screen
{
	public static var SCREEN_ID : String = "GAME";

	public function new() 
	{
		super();
		
		initGraphics();
		visible = false;
	}
	
	private function initGraphics() : Void
	{
		trace("init game");
		
		var tf = new TextField();
		tf.text = "GAME ON !";
		tf.x = 20;
		tf.y = 20;
		addChild(tf);
	}
	
	override public function initialize() : Void {
		trace("override");
	}
	
}