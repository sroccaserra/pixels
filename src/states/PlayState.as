//-*- compile-command: "rake" -*-

package states
{
import org.flixel.*;
import maps.*;
import characters.Player;

public class PlayState extends FlxState
{
    public function PlayState() {
        super();
        _levelMap = new LevelMap();
        _levelMap.addToState(FlxG.state);

        FlxG.followBounds(0, 0, _levelMap.getWidth(), _levelMap.getHeight());

        _player = new Player(32, 16);
        this.add(_player);
        FlxG.follow(_player, 2.5);
    }

    override public function update():void {
        super.update();
        if (_player.y >= _levelMap.getHeight())
        {
            _player.respawn();
        }
        _levelMap.collide(_player);
    }

    private var _player:Player;
    private var _levelMap:LevelMap;
}
}
