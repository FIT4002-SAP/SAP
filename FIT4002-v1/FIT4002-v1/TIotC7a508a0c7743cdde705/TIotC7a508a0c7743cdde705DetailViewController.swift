//
// TIotC7a508a0c7743cdde705DetailViewController.swift
// FIT4002-v1
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 25/07/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class TIotC7a508a0c7743cdde705DetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }

    private var validity = [String: Bool]()
    private var _entity: TIOTC7A508A0C7743CDDE705Type?
    var allowsEditableCells = false
    var entity: TIOTC7A508A0C7743CDDE705Type {
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

    private let logger = Logger.shared(named: "TIotC7a508a0c7743cdde705MasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: EntityUpdaterDelegate?
    var tableUpdater: EntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

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
            let detailViewController = dest.viewControllers[0] as! TIotC7a508a0c7743cdde705DetailViewController
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
            return self.cellForGenId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.genId)
        case 1:
            return self.cellForGDevice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.gDevice)
        case 2:
            return self.cellForGCreated(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.gCreated)
        case 3:
            return self.cellForCTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cTimestamp)
        case 4:
            return self.cellForCSensorgyrox(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensorgyrox)
        case 5:
            return self.cellForCSensorgyroy(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensorgyroy)
        case 6:
            return self.cellForCSensorgyroz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensorgyroz)
        case 7:
            return self.cellForCSensoraccx(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensoraccx)
        case 8:
            return self.cellForCSensoraccy(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensoraccy)
        case 9:
            return self.cellForCSensoraccz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensoraccz)
        case 10:
            return self.cellForCSensorbarometric(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOTC7A508A0C7743CDDE705Type.cSensorbarometric)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: self.allowsEditableCells)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 11
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForGenId(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.genId ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if TIOTC7A508A0C7743CDDE705Type.genId.isOptional || newValue != "" {
                currentEntity.genId = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGDevice(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
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
                if TIOTC7A508A0C7743CDDE705Type.gDevice.isOptional || newValue != "" {
                    currentEntity.gDevice = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGCreated(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
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

    private func cellForCTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
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
                if let validValue = Int64(newValue) {
                    currentEntity.cTimestamp = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensorgyrox(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensorgyrox {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensorgyrox = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensorgyrox = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensorgyroy(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensorgyroy {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensorgyroy = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensorgyroy = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensorgyroz(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensorgyroz {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensorgyroz = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensorgyroz = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensoraccx(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensoraccx {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensoraccx = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensoraccx = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensoraccy(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensoraccy {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensoraccy = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensoraccy = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensoraccz(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensoraccz {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensoraccz = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensoraccz = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensorbarometric(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOTC7A508A0C7743CDDE705Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensorbarometric {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensorbarometric = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensorbarometric = validValue
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

    func createEntityWithDefaultValues() -> TIOTC7A508A0C7743CDDE705Type {
        let newEntity = TIOTC7A508A0C7743CDDE705Type()
        // Fill the mandatory properties with default values
        newEntity.genId = CellCreationHelper.defaultValueFor(TIOTC7A508A0C7743CDDE705Type.genId)

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

extension TIotC7a508a0c7743cdde705DetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! TIOTC7A508A0C7743CDDE705Type
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
