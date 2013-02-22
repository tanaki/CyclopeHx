package;

// import com.eclecticdesignstudio.motion.Actuate;
// import com.eclecticdesignstudio.motion.easing.Elastic;

import com.bit101.components.HSlider;

import nme.display.Bitmap;
import nme.display.Sprite;
import nme.display.Shape;
import nme.display.StageAlign;
import nme.display.StageScaleMode;

import nme.events.Event;
import nme.geom.Point;

import nme.text.TextField;
import nme.Assets;


class CollisionTest extends Sprite {
	
	private var eye : Sprite;
	private var triangle : Sprite;
	private var angleSlider : HSlider;
	private var rotationSlider : HSlider;
	
	private var ANGLE : Float = 1;
	private var RADIUS : Float = 300;

	public function new () {
		
		super ();
		
		addEventListener( Event.ADDED_TO_STAGE, onAddedToStage );
	}

	private function onAddedToStage ( e : Event ) : Void {

		removeEventListener( Event.ADDED_TO_STAGE, onAddedToStage );

		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		initGame();
		initSlider();

		addEventListener( Event.ENTER_FRAME, onEnterFrame );
	}

	private function onEnterFrame ( e:Event ) : Void {

		var A = new Point( eye.x, eye.y );
		var B = new Point( eye.x, triangle.y + 20 );
		var C = new Point( triangle.x, triangle.y + 20 );

		var triangleAngle = radToDeg( Math.atan( Point.distance( C,B ) / Point.distance( A,B ) ) );
		var offset = triangleAngle - (eye.rotation - 90);

		if ( Math.abs(offset) < 5 ) {
			trace( "COLLISION" );
		} else {
			trace("--");
		}

	}

	private function initGame() : Void {

		var floor = new Shape();
		floor.graphics.beginFill(0x000000);
		floor.graphics.drawRect(0,0,800,10);
		floor.x = 0;
		floor.y = 270;

		addChild(floor);

		triangle = new Sprite();
		triangle.x = 50;
		triangle.y = 250;

		addChild(triangle);

		eye = new Sprite();
		eye.x = 250;
		eye.y = 150;

		addChild(eye);

		drawElements();
	}

	private function drawElements () : Void {

		triangle.graphics.clear();
		triangle.graphics.beginFill(0xcccccc);
		triangle.graphics.lineTo(10,20);
		triangle.graphics.lineTo(-10,20);
		triangle.graphics.endFill();


		eye.graphics.clear();
		eye.graphics.beginFill(0xff0099, 0.2);
		eye.graphics.drawCircle(0,0,10);
		eye.graphics.moveTo( 0, 0 );
		eye.graphics.lineTo( RADIUS, 0 );
		eye.graphics.lineTo( Math.cos(degToRad(ANGLE)) * RADIUS, Math.sin(degToRad(ANGLE)) * RADIUS );
		eye.graphics.endFill();

	}

	private function initSlider() : Void {

		var container:Sprite = new Sprite();
		container.x = 10;
		container.y = 350;
		addChild(container);


		rotationSlider = new HSlider( container, 0, 0, onSlider );
		rotationSlider.minimum = 140;
		rotationSlider.maximum = 160;
		eye.rotation = rotationSlider.minimum;

		angleSlider = new HSlider( container, 0, 20, onSlider );
		angleSlider.minimum = 1;
		angleSlider.maximum = 180;
		angleSlider.value = ANGLE;
	}

	private function onSlider ( e:Event ) : Void {

		eye.rotation = rotationSlider.value;
		ANGLE = angleSlider.value;
		drawElements(  );
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