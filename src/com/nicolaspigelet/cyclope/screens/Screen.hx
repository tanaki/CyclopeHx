package com.nicolaspigelet.cyclope.screens;

import nme.display.Sprite;

/**
 * @author nico
 */

class Screen extends Sprite
{

	public static var SCREEN_ID : String = "PARENT";
	
	public function new() 
	{
		super();
		visible = false;
	}
	
	public function initialize() : Void {
		visible = true;
	}
	
	public function pause() : Void {
		
	}
	
	public function dispose() : Void {
		visible = false;
	}
	
}