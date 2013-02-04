package com.nicolaspigelet.cyclope.screens;

import com.nmemvc.view.IView;
import nme.display.Sprite;

/**
 * @author nico
 */
class Screen extends Sprite implements IView
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