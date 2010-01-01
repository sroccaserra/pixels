//-*- compile-command: "rake" -*-

package maps {

import org.flixel.*;
import flash.geom.Point;

public class LevelMap {
    public function LevelMap() {
        var tileSize:int = 24;

        _ground = new FlxTilemap();
        _ground.loadMap(FlxTilemap.pngToCSV(LevelOne), LevelOneTiles, tileSize);
    }

    public function addToState(state:FlxState):void {
        state.add(_ground);
    }

    public function getHeight():int {
        return _ground.height;
    }

    public function getWidth():int {
        return _ground.width;
    }

    public function collide(core:FlxCore):void {
        _ground.collide(core);
    }

    public function follow():void {
        _ground.follow();
    }

    public function getSpawnPoint():Point {
        return _spawnPoint;
    }

    [Embed(source="../../data/images/level-01.png")]
    private var LevelOne:Class;
    [Embed(source="../../data/images/level-01-tiles.png")]
    private var LevelOneTiles:Class;

    private var _ground:FlxTilemap;
    private var _spawnPoint:Point = new Point(32, 0);
}
}