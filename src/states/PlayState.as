package states
{

import org.flixel.*;
import maps.*;
import characters.Player;

public class PlayState extends FlxState
{
// [Embed(source="../../data/fonts/orbitron-medium.ttf",
//     fontName='orbitron-medium',
//     mimeType='application/x-font')]
//     private var _orbitronMedium:Class;

    public function PlayState() {
        super();

        _levelMap = new LevelMap();
        _levelMap.addToState(this);
        _levelMap.follow();

        _player = new Player(_levelMap.getSpawnPoint());
        this.add(_player);
        FlxG.follow(_player, 4);

        var title:FlxText = new FlxText(0, 0, FlxG.width, 'Trocade');
//        title.font = 'orbitron-medium';
        title.size = 11;
        title.scrollFactor = new FlxPoint(0, 0);
        title.alignment = "center";
        this.add(title);
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
