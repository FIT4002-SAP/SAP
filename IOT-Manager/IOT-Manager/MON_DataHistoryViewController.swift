//
//  MON_DataHistoryViewController.swift
//  IOT-Manager
//
//  Created by Ryan Saffer on 6/8/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation
import SAPFiori
import SAPOData
import SAPCommon

class MON_DataHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SAPFioriLoadingIndicator {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }
    
    private var data: [String] = [String]()
    private var timestamps: [String] = [String]()
    var entityType: IOTEntity?
    
    private let logger = Logger.shared(named: "MON_DataHistoryViewControllerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)
        
        self.historyTableView.rowHeight = UITableViewAutomaticDimension
        self.historyTableView.estimatedRowHeight = 44
        updateTable()
    }
    
    // MARK: - Table view data source
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CellCreationHelper.objectCellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: self.timestamps[indexPath.row], value: self.data[indexPath.row])
        cell.isMomentarySelection = false
        // TODO: disable arrow on side of cell
        return cell
    }
    
    // MARK: - Data accessing
    
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        let query = DataQuery().selectAll()
        self.iotservice.fetchTIot5272a0aa64cec578f2f9(matching: query) { tIot5272a0aa64cec578f2f9, error in
            guard let tIot5272a0aa64cec578f2f9 = tIot5272a0aa64cec578f2f9 else {
                completionHandler(error!)
                return
            }
            
            for entity in tIot5272a0aa64cec578f2f9 {
                switch self.entityType! {
                case IOTEntity.cSensorAcc:
                    self.data.append("X: \(String(entity.cSensoraccx!)) Y: \(String(entity.cSensoraccy!)) Z: \(String(entity.cSensoraccz!))")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorBarometric:
                    self.data.append("\(String(entity.cSensorbarometric!)) hPa")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorGyro:
                    self.data.append("X: \(String(entity.cSensorgyrox!)) Y: \(String(entity.cSensorgyroy!)) Z: \(String(entity.cSensorgyroz!))")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorHumidity:
                    self.data.append("\(String(entity.cSensorhumidity!)) %")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorMag:
                    self.data.append("X: \(String(entity.cSensormagx!)) Y: \(String(entity.cSensormagy!)) Z: \(String(entity.cSensormagz!))")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorObjectTemp:
                    self.data.append("\(String(entity.cSensorobjecttemp!)) C")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorOptical:
                    self.data.append("\(String(entity.cSensoroptical!)) LUX")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                case IOTEntity.cSensorAmbientTemp:
                    self.data.append("\(String(entity.cSensortemp!)) C")
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                default:
                    break
                }
            }
            completionHandler(nil)
        }
    }
    
    // MARK: - Table update
    
    func updateTable() {
        self.showFioriLoadingIndicator()
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                self.hideFioriLoadingIndicator()
            }
        })
    }
    
    private func loadData(completionHandler: @escaping () -> Void) {
        self.requestEntities { error in
            defer {
                completionHandler()
            }
            if let error = error {
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                self.logger.error("Could not update table. Error: \(error)", error: error)
                return
            }
            OperationQueue.main.addOperation({
                self.historyTableView.reloadData()
                self.logger.info("Table updated successfully!")
            })
        }
    }
    
    @objc func refresh() {
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                OperationQueue.main.addOperation({
                    self.historyTableView.refreshControl?.endRefreshing()
                })
            }
        })
    }
}

extension MON_DataHistoryViewController: EntitySetUpdaterDelegate {
    func entitySetHasChanged() {
        self.updateTable()
    }
}
