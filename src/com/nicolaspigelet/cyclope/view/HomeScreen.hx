package com.nicolaspigelet.cyclope.screens;

import com.nicolaspigelet.cyclope.events.ScreenEvent;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.events.TouchEvent;


/**
 * @author nico
 */
class HomeScreen extends Screen
{
	public static var SCREEN_ID : String = "HOME";
	
	private var btn : Sprite;
	
	public function new() 
	{
		super();
		
		initGraphics();
		visible = false;
	}
	
	private function initGraphics() : Void {
		
		btn = new Sprite();
		btn.graphics.beginFill(0xff0000);
		btn.graphics.drawRect(0,0,40,40);
		
		btn.x = (Config.STAGE_WIDTH - btn.width) * 0.5;
		btn.y = (Config.STAGE_HEIGHT - btn.height) * 0.5;
		btn.buttonMode = true;
		addChild(btn);
	}
	
	override public function initialize() : Void {
		
		trace("override");
		visible = true;
		
		#if mobile
		btn.addEventListener( TouchEvent.TOUCH_END, onTouchBtn );
		#else
		btn.addEventListener( MouseEvent.CLICK, onTouchBtn );
		#end
	}
	
	private function onTouchBtn ( e:Dynamic ) : Void {
		
		dispatchEvent( new ScreenEvent(ScreenEvent.CHANGE, GameScreen.SCREEN_ID) );
	}
	
}