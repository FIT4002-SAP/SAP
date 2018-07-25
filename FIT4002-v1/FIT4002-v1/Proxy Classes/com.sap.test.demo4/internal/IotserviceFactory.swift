// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class IotserviceFactory {
    static func registerAll() throws {
        IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.registerFactory(ObjectFactory.with(create: { TIOTC7A508A0C7743CDDE705Type(withDefaults: false) }, createWithDecoder: { d in try TIOTC7A508A0C7743CDDE705Type(from: d) }))
        IotserviceStaticResolver.resolve()
    }
}
