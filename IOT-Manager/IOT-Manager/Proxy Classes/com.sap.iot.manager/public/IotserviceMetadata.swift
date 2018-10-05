// # Proxy Compiler 18.3.2-b9f583-20180614

import Foundation
import SAPOData

public class IotserviceMetadata {
    public static var document: CSDLDocument = IotserviceMetadata.resolve()

    private static func resolve() -> CSDLDocument {
        try! IotserviceFactory.registerAll()
        IotserviceMetadataParser.parsed.hasGeneratedProxies = true
        return IotserviceMetadataParser.parsed
    }

    public class EntityTypes {
        public static var tIOT35970B0909FFB71C3F4FType: EntityType = IotserviceMetadataParser.parsed.entityType(withName: "iotmmsxs.iotservice.T_IOT_35970B0909FFB71C3F4FType")

        public static var tIOT5272A0AA64CEC578F2F9Type: EntityType = IotserviceMetadataParser.parsed.entityType(withName: "iotmmsxs.iotservice.T_IOT_5272A0AA64CEC578F2F9Type")
    }

    public class EntitySets {
        public static var tIot35970b0909ffb71c3f4f: EntitySet = IotserviceMetadataParser.parsed.entitySet(withName: "T_IOT_35970B0909FFB71C3F4F")

        public static var tIot5272a0aa64cec578f2f9: EntitySet = IotserviceMetadataParser.parsed.entitySet(withName: "T_IOT_5272A0AA64CEC578F2F9")
    }
}
