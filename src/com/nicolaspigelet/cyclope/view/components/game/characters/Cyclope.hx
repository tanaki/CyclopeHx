package com.nicolaspigelet.cyclope.view.components.game.characters;

import nme.display.Sprite;

class Cyclope extends Sprite {

	public function new () : Void {
		super();

		graphics.beginFill(0xff0099);
		graphics.drawCircle(40,40,40);
		
	}

}