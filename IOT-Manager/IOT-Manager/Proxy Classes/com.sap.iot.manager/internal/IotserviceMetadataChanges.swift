// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class IotserviceMetadataChanges: ObjectBase {
    override init() {
    }

    class func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        IotserviceMetadata.document = metadata
        IotserviceMetadataChanges.merge1(metadata: metadata)
        try! IotserviceFactory.registerAll()
    }

    private class func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.isRemoved {
            IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type = metadata.entityType(withName: "iotmmsxs.iotservice.T_IOT_5272A0AA64CEC578F2F9Type")
        }
        if !IotserviceMetadata.EntitySets.tIot5272a0aa64cec578f2f9.isRemoved {
            IotserviceMetadata.EntitySets.tIot5272a0aa64cec578f2f9 = metadata.entitySet(withName: "T_IOT_5272A0AA64CEC578F2F9")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.genId.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.genId = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "GEN_ID")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.gDevice.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.gDevice = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "G_DEVICE")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.gCreated.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.gCreated = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "G_CREATED")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cTimestamp.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cTimestamp = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_TIMESTAMP")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensoraccx.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensoraccx = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORACCX")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensoraccy.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensoraccy = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORACCY")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensoraccz.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensoraccz = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORACCZ")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensorbarometric.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensorbarometric = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORBAROMETRIC")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensorgyrox.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensorgyrox = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORGYROX")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensorgyroy.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensorgyroy = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORGYROY")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensorgyroz.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensorgyroz = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORGYROZ")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensorhumidity.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensorhumidity = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORHUMIDITY")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensormagx.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensormagx = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORMAGX")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensormagy.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensormagy = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORMAGY")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensormagz.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensormagz = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORMAGZ")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensorobjecttemp.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensorobjecttemp = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSOROBJECTTEMP")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensoroptical.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensoroptical = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSOROPTICAL")
        }
        if !TIOT5272A0AA64CEC578F2F9Type.cSensortemp.isRemoved {
            TIOT5272A0AA64CEC578F2F9Type.cSensortemp = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORTEMP")
        }
    }
}
