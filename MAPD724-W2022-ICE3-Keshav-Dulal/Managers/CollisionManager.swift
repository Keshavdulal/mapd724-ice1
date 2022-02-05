import SpriteKit
import GameplayKit

// global static class
// nothing to do with my gamescene or GameViewController
class CollisionManager {
    
    // important reference -> to have updates from GameViewController
    public static var gameViewController: GameViewController?
     
    // utility function
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat {
        // squareDistance is the distance between the centers (red line)
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        
        // sq roots and power functions are computationally expensive
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquaredRadiusCheck(scene: SKScene, object1: GameObject, object2: GameObject) -> Void{
        let P1 = object1.position // plane
        let P2 = object2.position // island
        
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        
        let Radii = P1Radius + P2Radius
        
        if(SquaredDistance(point1: P1, point2: P2) < Radii * Radii){
            // we have a collision here
            
            if(!object2.isColliding!){
                switch(object2.name){
                case "island":
                    // print("Collided with island")
                    
                    // play sound
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    
                    // increase score
                    ScoreManager.Score += 100
                    gameViewController?.updateScoreLabel()
                    break
                
                case "cloud":
                    //print("Collided with cloud")
                    
                    // play sound
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    
                    // take lives
                    ScoreManager.Lives -= 1
                    gameViewController?.updateLivesLabel()
                    break
                     
                default:
                    break
                }
                
                // collision is only possible once
                object2.isColliding = true
                 
            }
        }
            
    }
    
}
