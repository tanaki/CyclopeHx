package com.nicolaspigelet.cyclope.view;

import com.nmemvc.view.IView;
import nme.display.Sprite;

/**
 * @author nico
 */
class Screen extends Sprite
{

	public static var SCREEN_ID : String = "SCREEN";
	
	public function new() 
	{
		super();
		visible = false;
	}
	
	public function start() : Void {
		visible = true;
	}
	
	public function pause() : Void {
		visible = false;
	}
	
	public function destroy() : Void {
		visible = false;
	}
	
}