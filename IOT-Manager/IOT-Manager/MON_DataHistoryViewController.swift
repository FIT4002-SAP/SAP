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

class MON_DataHistoryViewController: UIViewController {
    
    struct ChartCardData {
        var title: String?
        var subtitle: String?
        var trendImage: UIImage?
        var trendTitle: String?
        var statusText: String?
        var kpiItems: [FUIKPIViewItem]
        var seriesTitle: [FUIText]
        var chartType: FUIChartType!
        var seriesData: [[Double]]
    }
    
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var chartCollectionView: UICollectionView!
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }
    
    private var data: [[Double]] = [[Double]]()
    private var timestamps: [String] = [String]()
    var entityType: IOTEntity?
    
    var cardData: ChartCardData!
    
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
        
        let flowLayout = FUICollectionViewLayout.horizontalScroll
        flowLayout.itemSize = CGSize(width: 370, height: 192) // Card size according design guideline
        chartCollectionView.collectionViewLayout = flowLayout
        chartCollectionView.register(FUIChartCardCollectionViewCell.self,
                                forCellWithReuseIdentifier: FUIChartCardCollectionViewCell.reuseIdentifier)
        chartCollectionView.dataSource = self
        chartCollectionView.delegate = self
        
        updateTable()
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
            
            // Create a chart card with default values, and edit them depending on the sensor selected
            var tempCard = ChartCardData(title: "Data History",
                                         subtitle: "",
                                         trendImage: FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate),
                                         trendTitle: "Trend Title",
                                         statusText: "",
                                         kpiItems: [FUIKPIUnitItem(string: ""), FUIKPIMetricItem(string: ""), FUIKPIUnitItem(string: "")],
                                         seriesTitle: [""],
                                         chartType: FUIChartType.line,
                                         seriesData: [[0]])
            
            // if sensor only has 1 value, only use xData
            var xData = [Double]()
            var yData = [Double]()
            var zData = [Double]()
            
            for entity in tIot5272a0aa64cec578f2f9 {
                switch self.entityType! {
                case .cSensorAcc:
                    xData.append(entity.cSensoraccx!)
                    yData.append(entity.cSensoraccy!)
                    zData.append(entity.cSensoraccz!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Accelerometer History"
                    tempCard.seriesTitle = ["X", "Y", "Z"]
                case .cSensorBarometric:
                    xData.append(entity.cSensorbarometric!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Barometric History"
                    tempCard.seriesTitle = ["Barometer (hPa)"]
                case .cSensorGyro:
                    xData.append(entity.cSensorgyrox!)
                    yData.append(entity.cSensorgyroy!)
                    zData.append(entity.cSensorgyroz!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Gyroscope History"
                    tempCard.seriesTitle = ["X", "Y", "Z"]
                case .cSensorHumidity:
                    xData.append(entity.cSensorhumidity!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Humidity History"
                    tempCard.seriesTitle = ["Humidity (%)"]
                case .cSensorMag:
                    xData.append(entity.cSensormagx!)
                    yData.append(entity.cSensormagy!)
                    zData.append(entity.cSensormagz!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Magnometer History"
                    tempCard.seriesTitle = ["X", "Y", "Z"]
                case .cSensorObjectTemp:
                    xData.append(entity.cSensorobjecttemp!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Object Temperature History"
                    tempCard.seriesTitle = ["Temp (C)"]
                case .cSensorOptical:
                    xData.append(entity.cSensoroptical!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Optical History"
                    tempCard.seriesTitle = ["Optical (LUX)"]
                case .cSensorAmbientTemp:
                    xData.append(entity.cSensortemp!)
                    self.timestamps.append((entity.cTimestamp?.toString())!)
                    tempCard.subtitle = "Ambient Temperature History"
                    tempCard.seriesTitle = ["Temperature (C)"]
                default:
                    break
                }
            }
            
            // finally, put all the data together
            switch self.entityType! {
            case .cSensorAcc, .cSensorGyro, .cSensorMag:
                self.data = [xData, yData, zData]
            default:
                self.data = [xData]
            }
            
            tempCard.seriesData = self.data
            self.cardData = tempCard
            
            completionHandler(nil)
        }
    }
}

// MARK: - Table view data source

extension MON_DataHistoryViewController: UITableViewDataSource, SAPFioriLoadingIndicator {
    
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        if self.data.count == 0 {
            return 0
        }
        else {
            return self.data[0].count
        }
    }

    func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return false
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cellOutput: String = ""
        switch self.entityType! {
        case IOTEntity.cSensorAcc:
            cellOutput = "X: \(String(self.data[0][indexPath.row])) Y: \(String(self.data[1][indexPath.row])) Z: \(String(self.data[2][indexPath.row]))"
        case IOTEntity.cSensorBarometric:
            cellOutput = "\(String(self.data[0][indexPath.row])) hPa"
        case IOTEntity.cSensorGyro:
            cellOutput = "X: \(String(self.data[0][indexPath.row])) Y: \(String(self.data[1][indexPath.row])) Z: \(String(self.data[2][indexPath.row]))"
        case IOTEntity.cSensorHumidity:
            cellOutput = "\(String(self.data[0][indexPath.row])) %"
        case IOTEntity.cSensorMag:
            cellOutput = "X: \(String(self.data[0][indexPath.row])) Y: \(String(self.data[1][indexPath.row])) Z: \(String(self.data[2][indexPath.row]))"
        case IOTEntity.cSensorObjectTemp:
            cellOutput = "\(String(self.data[0][indexPath.row])) C"
        case IOTEntity.cSensorOptical:
            cellOutput = "\(String(self.data[0][indexPath.row])) LUX"
        case IOTEntity.cSensorAmbientTemp:
            cellOutput = "\(String(self.data[0][indexPath.row])) C"
        default:
            break
        }
        
        let cell = CellCreationHelper.objectCellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: self.timestamps[indexPath.row], value: cellOutput)
        cell.isMomentarySelection = false
        // TODO: disable arrow on side of cell
        return cell
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

// MARK: - Collection view data source

extension MON_DataHistoryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let cardCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FUIChartCardCollectionViewCell.reuseIdentifier,
                for: indexPath) as! FUIChartCardCollectionViewCell
            
            if cardData == nil {
                OperationQueue.main.addOperation {
                    self.chartCollectionView.reloadData()
                }
                return cardCell
            }
            
            cardCell.title.text = cardData.title
            cardCell.subtitle.text = cardData.subtitle
            cardCell.status.text = cardData.statusText
            cardCell.seriesTitles = cardData.seriesTitle
            cardCell.kpiItems = cardData.kpiItems
            cardCell.chartView.chartType = .line
            cardCell.chartView.categoryAxis.labelLayoutStyle = .allOrNothing // default is .range
            cardCell.chartView.dataSource = self
            
            return cardCell
    }
}

extension MON_DataHistoryViewController: EntitySetUpdaterDelegate {
    func entitySetHasChanged() {
        self.updateTable()
    }
}

extension MON_DataHistoryViewController: FUIChartViewDataSource {
    
    // Required. Asks your data source object for the number of series in the chart.
    func numberOfSeries(in: FUIChartView) -> Int {
        return cardData.seriesData.count
    }
    
    // Required. Asks your data source object for the number of values for the given series.
    func chartView(_ chartView: FUIChartView, numberOfValuesInSeries seriesIndex: Int) -> Int {
        return cardData.seriesData[0].count
    }
    
    // Required. Asks your data source object for a value for a given series, value index and axis.
    func chartView(_ chartView: FUIChartView, valueForSeries series: Int, category categoryIndex: Int,
                   dimension dimensionIndex: Int) -> Double? {
        return cardData.seriesData[series][categoryIndex]
    }
    
    // Optional. Asks your data source object for a formatted label for a given dimension value.
    func chartView(_ chartView: FUIChartView, formattedStringForValue value: Double, axis: FUIChartAxisId)
        -> String? {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .none
            numberFormatter.maximumFractionDigits = 0
            return numberFormatter.string(from: value as NSNumber)
    }
    
    // Optional. Asks your data source object for a category axis label at the given index.
    func chartView(_ chartView: FUIChartView, titleForCategory categoryIndex: Int, inSeries seriesIndex: Int)
        -> String? {
            return self.timestamps[categoryIndex]
    }
}
