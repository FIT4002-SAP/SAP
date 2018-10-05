//
//  IOTEntity.swift
//  IOT-Manager
//
//  Created by Ryan Saffer on 6/8/18.
//  Copyright © 2018 SAP. All rights reserved.
//

import Foundation

enum IOTEntity: String {
    case allData            = "All Data"
    case cSensorAcc         = "Accelerometer"
    case cSensorBarometric  = "Barometric"
    case cSensorGyro        = "Gyroscope"
    case cSensorHumidity    = "Humidity"
    case cSensorMag         = "Magnetometer"
    case cSensorObjectTemp  = "Object Temperature"
    case cSensorOptical     = "Optical"
    case cSensorAmbientTemp = "Ambient Temperature"
    case model              = "View Model of Tower"
    case none               = ""
    
    static let all = [
        allData,
        cSensorAcc,
        cSensorBarometric,
        cSensorGyro,
        cSensorHumidity,
        cSensorMag,
        cSensorObjectTemp,
        cSensorOptical,
        cSensorAmbientTemp,
        model
        ]
}
