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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = SCNScene(named: "art.scnassets/tower.scn")!
        
        let scnView = self.view as! SCNView
        scnView.scene = scene
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
    }
    
    
}
