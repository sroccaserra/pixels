//-*- compile-command: "rake" -*-
package {

import org.flixel.FlxGame;

import states.*;

[SWF(width = "576", height = "432", backgroundColor = "#ffffff")]

public class Pixels extends FlxGame
{
    public function Pixels() {
        super(288, 216, PlayState, 2);
    }
}
}
