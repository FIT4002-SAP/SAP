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
        public static var tIOTC7A508A0C7743CDDE705Type: EntityType = IotserviceMetadataParser.parsed.entityType(withName: "iotmmsxs.iotservice.T_IOT_C7A508A0C7743CDDE705Type")
    }

    public class EntitySets {
        public static var tIotC7a508a0c7743cdde705: EntitySet = IotserviceMetadataParser.parsed.entitySet(withName: "T_IOT_C7A508A0C7743CDDE705")
    }
}
