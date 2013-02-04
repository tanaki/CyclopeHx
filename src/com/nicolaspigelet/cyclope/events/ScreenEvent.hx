package com.nicolaspigelet.cyclope.events;

import nme.events.Event;

/**
 * @author nico
 */
class ScreenEvent extends Event
{

	public static var CHANGE : String = "changeScreen";
	
	private var screenID : String;
	
	public function new( label:String, screenID:String, bubbles:Bool = false, cancelable:Bool = false ) 
	{
		super( label, bubbles, cancelable );
		this.screenID = screenID;
	}
	
	public function getScreenID() : String {
		return screenID;
	}
	
}