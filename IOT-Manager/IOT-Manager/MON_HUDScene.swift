//
//  MON_HUDScene.swift
//  IOT-Manager
//
//  Created by Ryan Saffer on 19/10/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import SpriteKit


/*
 *  This class can be used as an overlay in a scene.
 *  It is being used as a HUD to overlay text onto the powerline.
 *  Use this overlay whend the model is opened from an incident.
 */
 
class OverlayScene: SKScene {
    
    var labelNode: SKLabelNode!
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = UIColor.clear
        
        labelNode = SKLabelNode(text: "Init Text")
        labelNode.fontName = "AppleSDGothicNeo-Regular"
        labelNode.fontColor = UIColor.black
        labelNode.fontSize = 32
        labelNode.position = CGPoint(x: size.width/2, y: 80)
        
        self.addChild(labelNode)
    }
    
    func setLabel(text: String) {
        labelNode.text = text
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
