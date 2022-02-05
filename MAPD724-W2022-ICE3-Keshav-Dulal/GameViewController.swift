//
//  GameViewController.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 23/01/2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
        
        // initialize the lives and score
        CollisionManager.gameViewController = self // make reference to CollisionManager
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        
    }

       override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // update scores and lives using ScoreManager
    func updateScoreLabel() -> Void{
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void{
        LivesLabel.text = "Lives \(ScoreManager.Lives)"
    }
}
