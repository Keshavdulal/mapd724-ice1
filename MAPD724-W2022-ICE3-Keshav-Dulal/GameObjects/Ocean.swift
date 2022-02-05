//
//  Ocean.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 24/01/2022.
//

import GameplayKit
import SpriteKit

class Ocean : GameObject
{
    
    // constructor
    init(){
        super.init(imageString: "ocean", initialScale:2.0)
        Start()
    }
    
    required init?(coder aDecoder:NSCoder){
        fatalError("init(Coder:) has not been implemented")
    }
    
    // lifecycle function
    override func CheckBounds(){
        if(position.y <= -700){
            Reset()
        }
    }
    
    override func Reset(){
        position.y = 700
    }
    
    // initialization
    override func Start(){
        zPosition = 0
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
