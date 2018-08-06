//
//  MON_DashboardViewController.swift
//  IOT-Manager
//
//  Created by Ryan Saffer on 6/8/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation
import SAPFiori

class MON_DashboardViewController: FUIFormTableViewController {
    
    private var entities = IOTEntity.all
    
    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }
    
    // MARK: - UITableViewDelegate
    
    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.entities.count
    }
    
    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.entities[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }
    
    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }
    
    // CollectionType selection helper
    
    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.entities[at.row] {
        case .allData:
            let tIot5272a0aa64cec578f2f9StoryBoard = UIStoryboard(name: "TIot5272a0aa64cec578f2f9", bundle: nil)
            masterViewController = tIot5272a0aa64cec578f2f9StoryBoard.instantiateViewController(withIdentifier: "TIot5272a0aa64cec578f2f9Master")
            masterViewController.navigationItem.title = "TIot5272a0aa64cec578f2f9"
        case .none:
            masterViewController = UIViewController()
        default:
            return
        }
        
        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }
    
    

}
