package com.nicolaspigelet.cyclope;

import nme.display.Sprite;
import nme.events.Event;
import nme.text.TextField;
import nme.Lib;

/**
 * @author nico
 */

class Main extends Sprite 
{
	
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

		// entry point
		var tf = new TextField();
		tf.text = "Coucou Pitou !";
		addChild(tf);

		
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
