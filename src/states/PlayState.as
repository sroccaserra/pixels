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
        _levelMap.addToState(this);
        _levelMap.follow();

        _player = new Player(_levelMap.getSpawnPoint());
        this.add(_player);
        FlxG.follow(_player, 4);
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
