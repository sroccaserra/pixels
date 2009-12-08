//-*- compile-command: "rake" -*-

package states
{
import org.flixel.*;
import maps.*;
import sprites.Player;

public class PlayState extends FlxState
{
    private var _map:MapPixelMap;
    private var _player:Player;

    public function PlayState() {
        super();
        _map = new MapPixelMap;
        FlxG.state.add(_map.layerPixelBackground);
        FlxG.state.add(_map.layerPixelForeground);

        FlxG.followBounds(_map.boundsMinX, _map.boundsMinY, _map.boundsMaxX, _map.boundsMaxY);

        var message:FlxText = new FlxText(0, 0, 100, 20, "Roxel!!", 0xfff93939);
        add(message);

        _player = new Player(16, 16);
        this.add(_player);
        FlxG.follow(_player, 2.5);
    }

    override public function update():void {
        super.update();
        _map.layerPixelForeground.collide(_player);

    }
}
}
