//
//  GameProtocol.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 23/01/2022.
//

// protocol is a contract
// very similar to interface
protocol GameProtocol{
    
    // prevent an objet from leaving the screen or detect that it has done so
    func CheckBounds()
    
    // resert our gameobject offscreen
    func Reset()
    
    // init props of our game objects
    func Start()
    
    // update every frame (60fps = 16.66ms)
    func Update()
}
