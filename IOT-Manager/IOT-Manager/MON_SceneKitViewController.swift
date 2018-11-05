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
import SpriteKit

/*
 *  An Enum used if wanting to display an animation, such as an incident.
 */
enum AnimationType {
    case none
    case heat
    case vegetation
}

/*
 *  Controls the SceneKit Model
 *  If opened from dashboard, show model
 *  If opened from incident, animate the incident
 */
class MON_SceneKitViewController: UIViewController {
    
    let scene = SCNScene(named: "art.scnassets/powerline.scn")!
    
    var hudScene: OverlayScene!
    var animationType: AnimationType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.showsStatistics = false
        
        // When the scene is loaded, determine if it was opened from an incident view.
        // If initialising this controller witht the intention to display an incident, set the animationType.
        if (animationType == AnimationType.heat) {
            heatUp(withDuration: 1.0)
            hudScene = OverlayScene(size: self.view.bounds.size)
            hudScene.setLabel(text: "Warning - Tower Overheating 🔥")
            scnView.overlaySKScene = hudScene
        }
        if (animationType == AnimationType.vegetation) {
            displayVegetation(withDuration: 1.0)
            hudScene = OverlayScene(size: self.view.bounds.size)
            hudScene.setLabel(text: "Warning - Vegetation detected on tower 🍃")
            scnView.overlaySKScene = hudScene
        }
    }
    
    func heatUp(withDuration duration: TimeInterval) {
        
        let powerline = scene.rootNode.childNodes[1].childNodes[0]
        let material = powerline.geometry!.material(named: "Base_Body")!
        
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
    
    func displayVegetation(withDuration duration: TimeInterval) {
        
        let powerline = scene.rootNode.childNodes[1].childNodes[0]
        let material = powerline.geometry!.material(named: "Coil_Refl")!
        
        let highlightAction = SCNAction.customAction(duration: duration) { (node, elapsedTime) in
            
            material.emission.contents = UIColor.green
        }
        
        let unHighlightAction = SCNAction.customAction(duration: duration) { (node, elapsedTime) in
            
            material.emission.contents = UIColor.black
        }
        
        let pulseSequence = SCNAction.sequence([highlightAction, unHighlightAction])
        let infiniteLoop = SCNAction.repeatForever(pulseSequence)
        powerline.runAction(infiniteLoop)
    }
    
}
