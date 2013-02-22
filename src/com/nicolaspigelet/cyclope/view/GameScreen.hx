package com.nicolaspigelet.cyclope.view;

import com.eclecticdesignstudio.motion.Actuate;

import com.nicolaspigelet.cyclope.Config;
import com.nicolaspigelet.cyclope.view.components.game.VisualField;
import com.nicolaspigelet.cyclope.view.components.game.characters.Cyclope;
import com.nicolaspigelet.cyclope.view.components.game.characters.Human;

import nme.events.Event;
import nme.events.TextEvent;
import nme.text.TextField;

/**
 * @author nico
 */
class GameScreen extends Screen
{
	public static var SCREEN_ID : String = "GAME";

	private var visualField : VisualField;
	private var cyclope : Cyclope;
	private var humans : Array<Human>;
	private var humansNumber : Int = 3;

	public function new() 
	{
		super();
		
		initCharacters();
		initGameLoop();

		visible = false;
	}

	private function initCharacters() : Void
	{
		cyclope = new Cyclope();
		cyclope.x = (Config.STAGE_WIDTH - cyclope.width) * 0.5;
		cyclope.y = (Config.STAGE_HEIGHT - cyclope.height) * 0.5;
		addChild(cyclope);

		humans = new Array<Human>();
		var human : Human;
		for ( i in 0...humansNumber ) {

			human = new Human(i);
			human.x = i * 60 + 20;
			human.y = Config.STAGE_HEIGHT - 60;
			addChild(human);
			humans.push(human);

			human.addEventListener( Human.MOVE, onHumanMove );
		}
	}

	private function initGameLoop() : Void {

		visualField = new VisualField();
		visualField.x = Config.STAGE_WIDTH * 0.5;
		visualField.y = Config.STAGE_HEIGHT * 0.5;
		addChild( visualField );

		addEventListener( Event.ENTER_FRAME, onEnterFrame );
	}

	private function onEnterFrame ( e:Event ) : Void {

		visualField.update();
	}

	private function onHumanMove ( e:TextEvent ) : Void {

		var human = cast (e.target, Human);
		var newX = Config.STAGE_WIDTH - Std.parseFloat(e.text) * 60 - 60;
		Actuate.tween (human, 1, { x: newX } );

	}
	
	override public function start() : Void {
		
		visible = true;
		
	}


	/* Utils */
	public inline static function radToDeg(rad:Float):Float
	{
	    return 180 / Math.PI * rad;
	}

	public inline static function degToRad(deg:Float):Float
	{
    	return Math.PI / 180 * deg;
	}
	
}