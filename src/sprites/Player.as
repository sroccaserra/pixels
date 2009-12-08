//-*- compile-command: "rake" -*-
package sprites
{
import org.flixel.*;


public class Player extends FlxSprite
{
    [Embed(source="../../data/images/pixelMen.png")]
    private var playerImage:Class;

    private var _jumpPower:int;

    public function Player(x:int, y:int) {
        super(playerImage, x, y, true, true);
        addAnimation("idle", [0]);
        addAnimation("walk", [1, 2], 6);
        addAnimation("jump", [1]);

        // Physics
        var runSpeed:uint = 20;
        drag.x = runSpeed*8;
        acceleration.y = 420;
        _jumpPower = 200;
    }

    override public function update():void {
        move();
        animate();
        // Reset
        if (y >= 280)
        {
            reset();
        }
        super.update();
    }

    private function move():void {
        acceleration.x = 0;
        if(FlxG.keys.LEFT)
        {
            facing = LEFT;
            acceleration.x -= drag.x;
        }
        else if(FlxG.keys.RIGHT)
        {
            facing = RIGHT;
            acceleration.x += drag.x;
        }
        if(FlxG.keys.justPressed("X") && !velocity.y)
        {
            velocity.y = -_jumpPower;
        }
    }

    private function animate():void {
        if(velocity.y != 0)
        {
            play("jump");
        }
        else if(velocity.x == 0)
        {
            play("idle");
        }
        else
        {
            play("walk");
        }
    }

    private function reset():void {
        x = 16;
        y = 16;
        velocity.x = 0;
        velocity.y = 0;
    }
}
}
