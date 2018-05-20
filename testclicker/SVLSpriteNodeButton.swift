//
//  SVLSpriteNodeButton.swift
//  testclicker
//
//  Created by Ariel Kuhn on 19/5/18.
//  Copyright © 2018 arielkuhn. All rights reserved.
//

import SpriteKit

protocol SVLSpriteNodeButtonDelegate: class {
    func spriteNodeButtonPressed(_ button: SVLSpriteNodeButton)
}

class SVLSpriteNodeButton: SKSpriteNode {
    
    weak var delegate: SVLSpriteNodeButtonDelegate?
    
    func touchDown(atPoint pos : CGPoint) {
        
        alpha = 0.5
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        if contains(pos){
            delegate?.spriteNodeButtonPressed(self)
        }
        
        alpha = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches {self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            
            if parent != nil {
                self.touchUp(atPoint: t.location(in: parent!))
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if parent != nil {
                self.touchUp(atPoint: t.location(in: parent!))
            }
        }
    }
}
