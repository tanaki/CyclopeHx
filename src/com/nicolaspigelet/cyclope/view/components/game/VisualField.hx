package com.nicolaspigelet.cyclope.view.components.game;

import com.nicolaspigelet.cyclope.Config;

import nme.display.Sprite;

/**
 * @author nico
 */
class VisualField extends Sprite 
{

	private var radius : Int = 40;
	private var offset : Int = 0;

	public function new() 
	{
		super();

	}

	public function update () : Void {

		graphics.clear();
		graphics.beginFill(0xff0000, 0.5);
		graphics.moveTo( 0, 0 );

		var pointX = -Config.STAGE_WIDTH * 0.5 + offset;

		graphics.lineTo( pointX - radius, Config.STAGE_HEIGHT * 0.5 );
		graphics.lineTo( pointX + radius, Config.STAGE_HEIGHT * 0.5 );

		offset++;
	}
}
