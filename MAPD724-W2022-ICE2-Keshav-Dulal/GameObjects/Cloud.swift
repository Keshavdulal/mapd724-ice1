//
//  Cloud.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 24/01/2022.
//

import GameplayKit
import SpriteKit

class Cloud : GameObject
{
    
    // constructor
    init(){
        // reference to the assets in assets.xcassets
        super.init(imageString: "cloud", initialScale:1.0)
        Start()
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(Coder:) has not been implemented")
    }
    
    // lifecycle function
    // overriding lifecycle functions inherited from GameObject -> GameProtocol
    override func CheckBounds(){
        if(position.y <= -756){
            Reset()
        }
    }
    
    override func Reset(){
        // starting position - data collected from GameScene.skx
//        position.y = 756
        
        // randomize speed
        verticalSpeed = CGFloat((randomSource?.nextUniform())! * 5.0) + 5.0
        
        // randomize horizontal drift
        horizontalSpeed = CGFloat((randomSource?.nextUniform())! * -4.0) + 2.0
                
        // X - get a pseudo random number between -262 to 262
        let randomX:Int = (randomSource?.nextInt(upperBound: 524))! - 262
        position.x = CGFloat(randomX)
        
        let randomY:Int = (randomSource?.nextInt(upperBound: 20))! + 726
        position.y = CGFloat(randomY)
        
        
        // long rant on collision detection
        // tldr - don't allow users to cheat on re-colliding with island
        // wait for island to go out of frame
        isCollding = false
              
                
            
    }
    
    // initialization
    override func Start(){
        
        Reset()
        
        zPosition = 3
        alpha = 0.5 // 50% transparency
    }
    
    override func Update(){
        // move object & then check boundary
        Move()
        CheckBounds()
    }
    
    func Move(){
        position.y -= verticalSpeed!
    }
}
