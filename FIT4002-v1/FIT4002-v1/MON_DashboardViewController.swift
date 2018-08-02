//
//  MONDashboardViewController.swift
//  FIT4002-v1
//
//  Created by Ryan Saffer on 1/8/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import UIKit

class MON_DashboardViewController: UIViewController {

    var iotID: CollectionType!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dataViewSelected(_ sender: UIButton) {
        
        var masterViewController: UIViewController
        switch self.iotID {
        case .tIotC7a508a0c7743cdde705:
            let tIotC7a508a0c7743cdde705StoryBoard = UIStoryboard(name: "TIotC7a508a0c7743cdde705", bundle: nil)
            masterViewController = tIotC7a508a0c7743cdde705StoryBoard.instantiateViewController(withIdentifier: "TIotC7a508a0c7743cdde705Master")
            masterViewController.navigationItem.title = "Data View"
        case .none:
            return
        case .some(_):
            return
        }
        
        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
