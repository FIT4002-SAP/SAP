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
        if !IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.isRemoved {
            IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type = metadata.entityType(withName: "iotmmsxs.iotservice.T_IOT_C7A508A0C7743CDDE705Type")
        }
        if !IotserviceMetadata.EntitySets.tIotC7a508a0c7743cdde705.isRemoved {
            IotserviceMetadata.EntitySets.tIotC7a508a0c7743cdde705 = metadata.entitySet(withName: "T_IOT_C7A508A0C7743CDDE705")
        }
        if !TIOTC7A508A0C7743CDDE705Type.genId.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.genId = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "GEN_ID")
        }
        if !TIOTC7A508A0C7743CDDE705Type.gDevice.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.gDevice = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "G_DEVICE")
        }
        if !TIOTC7A508A0C7743CDDE705Type.gCreated.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.gCreated = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "G_CREATED")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cTimestamp.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cTimestamp = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_TIMESTAMP")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensorgyrox.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensorgyrox = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORGYROX")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensorgyroy.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensorgyroy = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORGYROY")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensorgyroz.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensorgyroz = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORGYROZ")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensoraccx.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensoraccx = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORACCX")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensoraccy.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensoraccy = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORACCY")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensoraccz.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensoraccz = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORACCZ")
        }
        if !TIOTC7A508A0C7743CDDE705Type.cSensorbarometric.isRemoved {
            TIOTC7A508A0C7743CDDE705Type.cSensorbarometric = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORBAROMETRIC")
        }
    }
}
