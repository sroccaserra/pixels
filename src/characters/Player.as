//-*- compile-command: "rake" -*-
package characters
{
import org.flixel.*;

import flash.geom.Point;

public class Player extends FlxSprite
{
    [Embed(source="../../data/images/pixelMen.png")]
    private var PlayerImage:Class;
    [Embed(source="../../data/sounds/jump.mp3")]
    private var JumpSound:Class;

    private var _jumpPower:int;
    private var _spawn:Point;

    public function Player(x:int, y:int) {
        super(PlayerImage, x, y, true, true);
        addAnimation("idle", [0]);
        addAnimation("walk", [1, 2], 6);
        addAnimation("jump", [1]);

        // Physics
        var runSpeed:uint = 20;
        drag.x = runSpeed*8;
        acceleration.y = 420;
        _jumpPower = 200;
        _spawn = new Point();
        _spawn.x = x;
        _spawn.y = y;
    }

    override public function update():void {
        move();
        animate();
        if (y >= 280)
        {
            respawn();
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
            FlxG.play(JumpSound);
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

    private function respawn():void {
        x = _spawn.x;
        y = _spawn.y;
        velocity.x = 0;
        velocity.y = 0;
    }
}
}
