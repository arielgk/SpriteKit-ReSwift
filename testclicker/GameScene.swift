//
//  GameScene.swift
//  testclicker
//
//  Created by Ariel Kuhn on 19/5/18.
//  Copyright © 2018 arielkuhn. All rights reserved.
//

import SpriteKit
import GameplayKit
import ReSwift

class GameScene: SKScene,SVLSpriteNodeButtonDelegate, StoreSubscriber  {
    
    typealias StoreSubscriberStateType = AppState

    
    private var addButton:  SVLSpriteNodeButton!
    private var substractButton: SVLSpriteNodeButton!
    private var textLabel: SKLabelNode!

    

    
    override func didMove(to view: SKView) {
        
        mainStore.subscribe(self)
        
        addButton = childNode(withName: "addButton") as! SVLSpriteNodeButton
        addButton.isUserInteractionEnabled = true
        addButton.delegate = self


        substractButton = childNode(withName: "substractButton") as! SVLSpriteNodeButton
        substractButton.isUserInteractionEnabled = true
        substractButton.delegate = self
        
        
        textLabel = childNode(withName: "textLabelNode") as! SKLabelNode
        textLabel.text = String(mainStore.state.counter) ?? "0"

        
    }
    
    func newState(state: AppState) {
        // when the state changes, the UI is updated to reflect the current state
        let counter =  mainStore.state.counter
        
        if(textLabel != nil){
            textLabel.text =  "\(counter)"
        }
        
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if(mainStore.state.counter > 10){
            addButton.alpha = 0
        }else if(mainStore.state.counter <= 10){
            addButton.alpha = 1
        }
    }
    
    func spriteNodeButtonPressed(_ button: SVLSpriteNodeButton) {
        switch button {
        case addButton:
            mainStore.dispatch(CounterActionIncrease());
            let posts : [Post] = [ Post(id:3,name:"bla")]
            
            mainStore.dispatch(PostGetAction(posts: posts))
        case substractButton:
             mainStore.dispatch(CounterActionDecrease());
        default:
            break
        }
        
    }
}
