package maps {

import org.flixel.*;
import flash.geom.Point;

public class LevelMap {
    public function LevelMap() {
        var groundData:String = FlxTilemap.pngToCSV(LevelOne);
        _ground = new FlxTilemap();
        _ground.loadMap(groundData, GroundTiles, 12);

        var backgroundData:String = FlxTilemap.arrayToCSV(getBackgroundData(), _backgroundTileWidth);
        _background = new FlxTilemap();
        _background.drawIndex = 0;
        _background.scrollFactor.x = 0.5;
        _background.scrollFactor.y = 0.5;
        _background.loadMap(backgroundData, BackgroundTiles, 24);
    }

    public function addToState(state:FlxState):void {
        state.add(_background);
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

    private function getBackgroundData():Array {
        var firstColumn:Array = [4, 4, 4, 4, 3, 2, 2, 0, 1, 1];
        var data:Array = [];
        for (var j:int = 0; j< firstColumn.length; j++)
        {
            for (var i:int = 0; i < 20; i++)
            {
                data.push(firstColumn[j]);
            }
        }
        return data;
    }

    [Embed(source="../../data/images/level-01.png")]
    private var LevelOne:Class;
    [Embed(source="../../data/images/level-01-tiles.png")]
    private var GroundTiles:Class;
    [Embed(source="../../data/images/pixels.png")]
    private var BackgroundTiles:Class;

    private var _ground:FlxTilemap;
    private var _background:FlxTilemap;
    private var _spawnPoint:Point = new Point(32, 0);
    private var _backgroundTileWidth:int = 20;
}
}
