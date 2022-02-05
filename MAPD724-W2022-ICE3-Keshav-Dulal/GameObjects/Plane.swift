//
//  Plane.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 24/01/2022.
//

import GameplayKit
import SpriteKit

class Plane : GameObject
{
    //initializer
    init()
    {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle
    
    override func CheckBounds()
    {
        // constrain on the left boundary
        if(position.x <= -310)
        {
            position.x = -310
        }
        
        // constrain on the right boundary
        if(position.x >= 310)
        {
            position.x = 310
        }
    }
    
    // Initialization
    override func Start()
    {
        // sea0 -> island1 -> plane2 -> clouds3
        zPosition = 2
        
    }
    
    override func Update()
    {
        CheckBounds()
    }
    
    func TouchMove(newPos: CGPoint)
    {
        position = newPos
    }
}
