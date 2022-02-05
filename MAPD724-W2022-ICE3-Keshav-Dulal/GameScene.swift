
//
//  GameScene.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 23/01/2022.
//

import UIKit // labels
import AVFoundation // sounds
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat? // adapt game to diff screen sizes
var screenHeight: CGFloat? // adapt game to diff screen sizes

class GameScene: SKScene
{
    // instance variables
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
//    var cloud: Cloud?
    var clouds: [Cloud] = []
    
      
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height // how big the screen is
        
        name = "GAME"
        
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        ocean?.position = CGPoint(x: 0, y: 773)
        addChild(ocean!)
                
        // add island to the scene
        island = Island() // instantiate
        addChild(island!)
        
        // add plane to the scene
        plane = Plane()
        plane?.position = CGPoint(x: 0, y: -495)
        addChild(plane!)

        // add cloud to the scene
//        cloud = Cloud()
//        addChild(cloud!)
        
//        add 3 clouds to the scene
        for index in 0...2
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }
        
        
               
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        ocean?.Update()
        island?.Update()
        plane?.Update()
//        cloud?.Update()
        
        // update each cloud in clouds array
        for cloud in clouds{
            cloud.Update()
            
            CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: cloud)
            // here cloud isn't unwrapped because clouds array is unwrapped above
        }
        
    // call CollisionManager
        CollisionManager.SquaredRadiusCheck(scene: self, object1: plane!, object2: island!)
    }
}
