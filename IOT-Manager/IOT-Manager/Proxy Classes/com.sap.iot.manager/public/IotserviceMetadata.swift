// # Proxy Compiler 17.12.4-8c3504-20180321

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
        public static var tIOT5272A0AA64CEC578F2F9Type: EntityType = IotserviceMetadataParser.parsed.entityType(withName: "iotmmsxs.iotservice.T_IOT_5272A0AA64CEC578F2F9Type")
    }

    public class EntitySets {
        public static var tIot5272a0aa64cec578f2f9: EntitySet = IotserviceMetadataParser.parsed.entitySet(withName: "T_IOT_5272A0AA64CEC578F2F9")
    }
}
