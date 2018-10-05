//
//  MON_SceneKitViewController.swift
//  IOT-Manager
//
//  Created by Ryan Saffer on 23/9/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import ModelIO

class MON_SceneKitViewController: UIViewController {
    
    let scene = SCNScene(named: "art.scnassets/powerline.scn")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.showsStatistics = true
        
//        heatUp(withDuration: 10.0)
    }
    
    func heatUp(withDuration duration: TimeInterval) {
        
        let powerline = scene.rootNode.childNodes[0].childNodes[0]
        let material = powerline.geometry!.firstMaterial!
        
        let highlightAction = SCNAction.customAction(duration: duration) { (node, elapsedTime) in
            
            material.emission.contents = UIColor.red
        }
        
        let unHighlightAction = SCNAction.customAction(duration: duration) { (node, elapsedTime) in
            
            material.emission.contents = UIColor.black
        }
        
        let pulseSequence = SCNAction.sequence([highlightAction, unHighlightAction])
        let infiniteLoop = SCNAction.repeatForever(pulseSequence)
        powerline.runAction(infiniteLoop)
    }
    
}
