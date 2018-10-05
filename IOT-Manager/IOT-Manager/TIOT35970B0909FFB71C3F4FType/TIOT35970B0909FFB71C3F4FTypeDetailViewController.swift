//
// TIOT35970B0909FFB71C3F4FTypeDetailViewController.swift
// SAP-IOT-V2
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 01/10/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class TIOT35970B0909FFB71C3F4FTypeDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }

    private var validity = [String: Bool]()
    private var _entity: TIOT35970B0909FFB71C3F4FType?
    var allowsEditableCells = false
    var entity: TIOT35970B0909FFB71C3F4FType {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "TIOT35970B0909FFB71C3F4FTypeMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: EntityUpdaterDelegate?
    var tableUpdater: EntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var preventNavigationLoop = false
    var entitySetName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            self.logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! TIOT35970B0909FFB71C3F4FTypeDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.entity = self.entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForGenId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT35970B0909FFB71C3F4FType.genId)
        case 1:
            return self.cellForGDevice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT35970B0909FFB71C3F4FType.gDevice)
        case 2:
            return self.cellForGCreated(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT35970B0909FFB71C3F4FType.gCreated)
        case 3:
            return self.cellForCTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT35970B0909FFB71C3F4FType.cTimestamp)
        case 4:
            return self.cellForCDescription(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT35970B0909FFB71C3F4FType.cDescription)
        case 5:
            return self.cellForCIncidentCode(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT35970B0909FFB71C3F4FType.cIncidentCode)
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 6
    }

    override func tableView(_: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row < 6 {
            return true
        }
        return false
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.preventNavigationLoop {
            return
        }
        switch indexPath.row {
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForGenId(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT35970B0909FFB71C3F4FType, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.genId ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if TIOT35970B0909FFB71C3F4FType.genId.isOptional || newValue != "" {
                currentEntity.genId = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGDevice(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT35970B0909FFB71C3F4FType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.gDevice {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.gDevice = nil
                isNewValueValid = true
            } else {
                if TIOT35970B0909FFB71C3F4FType.gDevice.isOptional || newValue != "" {
                    currentEntity.gDevice = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGCreated(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT35970B0909FFB71C3F4FType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.gCreated {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.gCreated = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.gCreated = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT35970B0909FFB71C3F4FType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cTimestamp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cTimestamp = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.cTimestamp = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCDescription(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT35970B0909FFB71C3F4FType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cDescription {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cDescription = nil
                isNewValueValid = true
            } else {
                if TIOT35970B0909FFB71C3F4FType.cDescription.isOptional || newValue != "" {
                    currentEntity.cDescription = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCIncidentCode(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT35970B0909FFB71C3F4FType, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cIncidentCode {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cIncidentCode = nil
                isNewValueValid = true
            } else {
                if TIOT35970B0909FFB71C3F4FType.cIncidentCode.isOptional || newValue != "" {
                    currentEntity.cIncidentCode = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.iotservice.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Create entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    self.tableUpdater?.entitySetHasChanged()
                }
            })
        }
    }

    func createEntityWithDefaultValues() -> TIOT35970B0909FFB71C3F4FType {
        let newEntity = TIOT35970B0909FFB71C3F4FType()
        // Fill the mandatory properties with default values
        newEntity.genId = CellCreationHelper.defaultValueFor(TIOT35970B0909FFB71C3F4FType.genId)

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.genId == nil || newEntity.genId!.isEmpty {
            self.validity["GEN_ID"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.iotservice.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Update entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
                    self.entityUpdater?.entityHasChanged(self.entity)
                }
            })
        }
    }

    // MARK: - other logic, helper

    @objc func cancel() {
        OperationQueue.main.addOperation({
            self.dismiss(animated: true)
        })
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            return field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
}

extension TIOT35970B0909FFB71C3F4FTypeDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! TIOT35970B0909FFB71C3F4FType
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
