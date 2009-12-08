//-*- compile-command: "rake" -*-
package {

import org.flixel.FlxGame;

import states.*;

[SWF(width = "576", height = "432", backgroundColor = "#000000")]

public class Roxel extends FlxGame
{
    public function Roxel() {
        super(288, 216, PlayState, 2);
    }
}
}
