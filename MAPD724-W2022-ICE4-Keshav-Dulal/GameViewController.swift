//
//  GameViewController.swift
//  MAPD724-W2022-ICE1-Keshav-Dulal
//
//  Created by Keshav Dulal on 23/01/2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
    
    // Buttons
    @IBOutlet weak var StartButtonOutlet: UIButton!
    
    // Labels
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var AppTitle: UILabel!
    
    var currentScene: SKScene?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setScene(sceneName: currentScene)
        
        
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        CollisionManager.gameViewController = self // make   reference to CollisionManager
         setScene(sceneName: "StartScene")
        
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
    
    // multiple scene handler
    func setScene(sceneName: String) -> Void{
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene{
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
            
            // Present the scene
            view.presentScene(currentScene)
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
        }
        
    }
    
    func PresentStartScene(){
        AppTitle.isHidden = false
        StartButtonOutlet.isHidden = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
    }

    func PresentEndScene(){
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        setScene(sceneName: "EndScene")
    }
    
    // START
    @IBAction func StartButton_Pressed(_ sender: UIButton) {
        AppTitle.isHidden = true // hide
        StartButtonOutlet.isHidden = true // hide
        ScoreLabel.isHidden = false // show
        LivesLabel.isHidden = false // show
        
        // initialize the lives and score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        
        // Move to Game Scene where user plays/interact with app
        setScene(sceneName: "GameScene")
    }
}


