//
// TIot5272a0aa64cec578f2f9MasterViewController.swift
// IOT-Manager
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/08/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class TIot5272a0aa64cec578f2f9MasterViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }

    private var entities: [TIOT5272A0AA64CEC578F2F9Type] = [TIOT5272A0AA64CEC578F2F9Type]()
    private let logger = Logger.shared(named: "TIOT5272A0AA64CEC578F2F9TypeMasterViewConterollerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        // Add refreshcontrol UI
        self.refreshControl?.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        self.tableView.addSubview(self.refreshControl!)
        // Cell height settings
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 98
        self.updateTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.entities.count
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tiot5272a0aa64cec578f2f9type = self.entities[indexPath.row]
        let cell = CellCreationHelper.objectCellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "GEN_ID", value: "\(tiot5272a0aa64cec578f2f9type.genId!)")
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }
        let currentEntity = self.entities[indexPath.row]
        self.iotservice.deleteEntity(currentEntity) { error in
            if let error = error {
                self.logger.error("Delete entry failed.", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorDeletingEntryTitle", value: "Delete entry failed", comment: "XTIT: Title of deleting entry error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
            } else {
                self.entities.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }

    // MARK: - Data accessing

    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        let query = DataQuery().selectAll().top(20)
        self.iotservice.fetchTIot5272a0aa64cec578f2f9(matching: query) { tIot5272a0aa64cec578f2f9, error in
            guard let tIot5272a0aa64cec578f2f9 = tIot5272a0aa64cec578f2f9 else {
                completionHandler(error!)
                return
            }
            self.entities = tIot5272a0aa64cec578f2f9
            completionHandler(nil)
        }
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "showDetail" {
            // Show the selected Entity on the Detail view
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            self.logger.info("Showing details of the chosen element.")
            let selectedEntity = self.entities[indexPath.row]
            let detailViewController = segue.destination as! TIot5272a0aa64cec578f2f9DetailViewController
            detailViewController.entity = selectedEntity
            detailViewController.navigationItem.leftItemsSupplementBackButton = true
            detailViewController.navigationItem.title = self.entities[(self.tableView.indexPathForSelectedRow?.row)!].genId ?? ""
            detailViewController.allowsEditableCells = false
            detailViewController.tableUpdater = self
        } else if segue.identifier == "addEntity" {
            // Show the Detail view with a new Entity, which can be filled to create on the server
            self.logger.info("Showing view to add new entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! TIot5272a0aa64cec578f2f9DetailViewController
            detailViewController.title = NSLocalizedString("keyAddEntityTitle", value: "Add Entity", comment: "XTIT: Title of add new entity screen.")
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.createEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.tableUpdater = self
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
                self.tableView.reloadData()
                self.logger.info("Table updated successfully!")
            })
        }
    }

    @objc func refresh() {
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                OperationQueue.main.addOperation({
                    self.refreshControl?.endRefreshing()
                })
            }
        })
    }
}

extension TIot5272a0aa64cec578f2f9MasterViewController: EntitySetUpdaterDelegate {
    func entitySetHasChanged() {
        self.updateTable()
    }
}
