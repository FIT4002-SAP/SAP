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

class MON_DataHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SAPFioriLoadingIndicator {
    
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var chartCollectionView: UICollectionView!
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var iotservice: Iotservice<OnlineODataProvider> {
        return self.appDelegate.iotservice
    }
    
    private var data: [String] = [String]()
    private var timestamps: [String] = [String]()
    var entityType: IOTEntity?
    
    var cardData = ChartCardData.items[0]
    
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
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChartCardData.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            let cardCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FUIChartCardCollectionViewCell.reuseIdentifier,
                for: indexPath) as! FUIChartCardCollectionViewCell
            
            let cardData = ChartCardData.items[indexPath.item]
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

extension MON_DataHistoryViewController: FUIChartViewDataSource {
    
    // Required. Asks your data source object for the number of series in the chart.
    func numberOfSeries(in: FUIChartView) -> Int {
        return cardData.seriesData.count
    }
    
    // Required. Asks your data source object for the number of values for the given series.
    func chartView(_ chartView: FUIChartView, numberOfValuesInSeries seriesIndex: Int) -> Int {
        return cardData.seriesData.count
    }
    
    // Required. Asks your data source object for a value for a given series, value index and axis.
    func chartView(_ chartView: FUIChartView, valueForSeries series: Int, category categoryIndex: Int,
                   dimension dimensionIndex: Int) -> Double? {
        return cardData.seriesData[categoryIndex]
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
            let shortMonths = ["J", "F", "M", "A", "M", "J", "J", "A", "S", "O", "N", "D"]
            return shortMonths[categoryIndex]
    }
}

struct ChartCardData {
    var title: String?
    var subtitle: String?
    var trendImage: UIImage?
    var trendTitle: String?
    var statusText: String?
    var kpiItems: [FUIKPIViewItem]
    var seriesTitle: [FUIText]
    var chartType: FUIChartType!
    var seriesData: [Double]
    
    static var items: [ChartCardData] {
        
        let up = FUIIconLibrary.analytics.trendUp.withRenderingMode(.alwaysTemplate)
        let kpiCurrency = FUIKPIUnitItem(string: "$")
        let kpiMetric = FUIKPIMetricItem(string: "171.1")
        let kpiUnit = FUIKPIUnitItem(string: "M")
        let multiRevenue: [Double] =  [90, 100, 88, 110, 105, 143, 131, 173, 139, 152, 141, 150]
        
        return [
            ChartCardData(title: "Revenue by Month", subtitle: "in M USD", trendImage: up,
                          trendTitle: "17.9%", statusText: "Exceeded",
                          kpiItems: [kpiCurrency, kpiMetric, kpiUnit],
                          seriesTitle: ["Hardware"], chartType: .line, seriesData: multiRevenue),
            
        ]
    }
}
