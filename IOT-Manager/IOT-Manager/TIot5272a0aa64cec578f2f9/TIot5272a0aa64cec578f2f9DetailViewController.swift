//
// TIot5272a0aa64cec578f2f9DetailViewController.swift
// IOT-Manager
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/08/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData

class TIot5272a0aa64cec578f2f9DetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }

    private var validity = [String: Bool]()
    private var _entity: TIOT5272A0AA64CEC578F2F9Type?
    var allowsEditableCells = false
    var entity: TIOT5272A0AA64CEC578F2F9Type {
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

    private let logger = Logger.shared(named: "TIot5272a0aa64cec578f2f9MasterViewControllerLogger")
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
            let detailViewController = dest.viewControllers[0] as! TIot5272a0aa64cec578f2f9DetailViewController
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
            return self.cellForGenId(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.genId)
        case 1:
            return self.cellForGDevice(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.gDevice)
        case 2:
            return self.cellForGCreated(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.gCreated)
        case 3:
            return self.cellForCTimestamp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cTimestamp)
        case 4:
            return self.cellForCSensoraccx(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensoraccx)
        case 5:
            return self.cellForCSensoraccy(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensoraccy)
        case 6:
            return self.cellForCSensoraccz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensoraccz)
        case 7:
            return self.cellForCSensorbarometric(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensorbarometric)
        case 8:
            return self.cellForCSensorgyrox(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensorgyrox)
        case 9:
            return self.cellForCSensorgyroy(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensorgyroy)
        case 10:
            return self.cellForCSensorgyroz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensorgyroz)
        case 11:
            return self.cellForCSensorhumidity(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensorhumidity)
        case 12:
            return self.cellForCSensormagx(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensormagx)
        case 13:
            return self.cellForCSensormagy(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensormagy)
        case 14:
            return self.cellForCSensormagz(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensormagz)
        case 15:
            return self.cellForCSensorobjecttemp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensorobjecttemp)
        case 16:
            return self.cellForCSensoroptical(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensoroptical)
        case 17:
            return self.cellForCSensortemp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: TIOT5272A0AA64CEC578F2F9Type.cSensortemp)
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: self.allowsEditableCells)
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 18
    }

    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }

    // MARK: - OData property specific cell creators

    private func cellForGenId(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.genId ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if TIOT5272A0AA64CEC578F2F9Type.genId.isOptional || newValue != "" {
                currentEntity.genId = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGDevice(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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
                if TIOT5272A0AA64CEC578F2F9Type.gDevice.isOptional || newValue != "" {
                    currentEntity.gDevice = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForGCreated(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCTimestamp(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensoraccx(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensoraccy(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensoraccz(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensorbarometric(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensorgyrox(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensorgyroy(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensorgyroz(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
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

    private func cellForCSensorhumidity(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensorhumidity {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensorhumidity = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensorhumidity = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensormagx(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensormagx {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensormagx = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensormagx = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensormagy(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensormagy {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensormagy = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensormagy = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensormagz(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensormagz {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensormagz = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensormagz = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensorobjecttemp(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensorobjecttemp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensorobjecttemp = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensorobjecttemp = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensoroptical(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensoroptical {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensoroptical = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensoroptical = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForCSensortemp(tableView: UITableView, indexPath: IndexPath, currentEntity: TIOT5272A0AA64CEC578F2F9Type, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.cSensortemp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.cSensortemp = nil
                isNewValueValid = true
            } else {
                if let validValue = Double(newValue) {
                    currentEntity.cSensortemp = validValue
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

    func createEntityWithDefaultValues() -> TIOT5272A0AA64CEC578F2F9Type {
        let newEntity = TIOT5272A0AA64CEC578F2F9Type()
        // Fill the mandatory properties with default values
        newEntity.genId = CellCreationHelper.defaultValueFor(TIOT5272A0AA64CEC578F2F9Type.genId)

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

extension TIot5272a0aa64cec578f2f9DetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! TIOT5272A0AA64CEC578F2F9Type
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
