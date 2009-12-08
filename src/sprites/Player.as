//-*- compile-command: "rake" -*-
package sprites
{
import org.flixel.FlxSprite;


public class Player extends FlxSprite
{
    [Embed(source="../../data/images/pixelMen.png")]
    private var playerImage:Class;

    public function Player(x:int, y:int) {
        super(playerImage, x, y, true, true);
        addAnimation("idle", [0]);
        addAnimation("walk", [1, 2], 6);
        play("walk");
        acceleration.y = 420;
    }

    override public function update():void {
        super.update();
        x +=0.5 ;
        if (y >= 280)
        {
            x = 16;
            y = 16;
            velocity.y = 0;
        }
    }
}
}
