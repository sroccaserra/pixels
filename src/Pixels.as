//-*- compile-command: "rake" -*-
package {

import mx.rpc.http.HTTPService
import org.flixel.FlxGame;
import states.*;

[SWF(width = "576", height = "432", backgroundColor = "#00000000")]

public class Pixels extends FlxGame
{
    public function Pixels() {
        var service:HTTPService = new HTTPService();
        service.destination = "toto";
        super(288, 216, PlayState, 2);
    }

    public function configurationLoaded():void {

    }
}
}
