//
//  Island.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 24/01/2022.
//

import GameplayKit
import SpriteKit

class Island : GameObject
{
    
    // constructor
    init(){
        // reference to the assets in assets.xcassets
        super.init(imageString: "island", initialScale:2.0)
        Start()
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(Coder:) has not been implemented")
    }
    
    // lifecycle function
    // overriding lifecycle functions inherited from GameObject -> GameProtocol
    override func CheckBounds(){
        if(position.y <= -700){
            Reset()
        }
    }
    
    override func Reset(){
        // starting position - data collected from GameScene.skx
        position.y = 730
                
        // X - get a pseudo random number between -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
            // range = 0 to 616
            // if min result is 0 -> subtract 313 -> actual min value is -313
            // if max result is 616 -> subtract 313 -> actual max value 313
            // smart!
        
        position.x = CGFloat(randomX)
        
        // long rant on collision detection
        // tldr - don't allow users to cheat on re-colliding with island
        // wait for island to go out of frame
        isColliding = false
              
                
            
    }
    
    // initialization
    override func Start(){
        
        Reset()
        
        zPosition = 1
        
        // vertical speed should be same as ocean (don't want them to look moving)
        verticalSpeed = 5.0
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
