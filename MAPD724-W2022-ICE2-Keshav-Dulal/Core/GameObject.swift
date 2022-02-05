//
//  GameObject.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 23/01/2022.
//

import GameplayKit
import SpriteKit

class GameObject : SKSpriteNode, GameProtocol
{
    // public instance members
    var width: CGFloat?
    var height: CGFloat?

    // defining useful numbers before hand minimizes computation during gameplay
    var horizontalSpeed: CGFloat? // dx
    var verticalSpeed: CGFloat? // dy
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat? // uniform scale
    var isCollding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution? // preselected pseudo random nos
    
    
    // constructor / initializer
    init(imageString: String, initialScale: CGFloat)
    {
        // initialize the game object with an image
        let texture = SKTexture(imageNamed: imageString) // bitmap
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isCollding = false
        name = imageString
        randomSource = GKARC4RandomSource() // random no seed
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // LifeCycle Functions
    func CheckBounds(){
        
    }
    
    func Reset(){
        
    }
    
    func Start(){
        
    }
    
    func Update(){
        
    }

}
