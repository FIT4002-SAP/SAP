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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex = self.tableView.indexPath(for: sender as! UITableViewCell)
        if segue.identifier == "dataHistoryCellSelected" {
            let vc = segue.destination as! MON_DataHistoryViewController
            switch selectedIndex?.row {
            case 1:
                vc.entityType = .cSensorAcc
                vc.navigationItem.title = "Accelerometer History"
            case 2:
                vc.entityType = .cSensorBarometric
                vc.navigationItem.title = "Barometric History"
            case 3:
                vc.entityType = .cSensorGyro
                vc.navigationItem.title = "Gyroscope History"
            case 4:
                vc.entityType = .cSensorHumidity
                vc.navigationItem.title = "Humidity History"
            case 5:
                vc.entityType = .cSensorMag
                vc.navigationItem.title = "Magnometer History"
            case 6:
                vc.entityType = .cSensorObjectTemp
                vc.navigationItem.title = "Object Temperature History"
            case 7:
                vc.entityType = .cSensorOptical
                vc.navigationItem.title = "Optical History"
            case 8:
                vc.entityType = .cSensorAmbientTemp
                vc.navigationItem.title = "Ambient Temperature History"
            default:
                break
            }
        }
        else if segue.identifier == "allDataCellSelected" {
            let vc = segue.destination as! TIot5272a0aa64cec578f2f9MasterViewController
            vc.navigationItem.title = "TIot5272a0aa64cec578f2f9"
        }
        else if segue.identifier == "viewModelCellSelected" {
            let vc = segue.destination as! MON_SceneKitViewController
            vc.navigationItem.title = "Model"
        }
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
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "allDataCellSelected", sender: self.tableView.cellForRow(at: indexPath))
        case 9:
            performSegue(withIdentifier: "viewModelCellSelected", sender: self.tableView.cellForRow(at: indexPath))
        default:
            performSegue(withIdentifier: "dataHistoryCellSelected", sender: self.tableView.cellForRow(at: indexPath))
        }
    }
}
