//
//  SKScene_tile.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/28.
//

class SKScene_tile: SKScene{
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        let set = SKTileSet(named: "cp_blue")!
        let n = SKTileMapNode(tileSet: set, columns: 10, rows: 10, tileSize: CGSize(width: 20, height: 20))
        n.position = CGPoint(x: frame.minX, y: frame.midY)
        addChild(n)
    }
}
