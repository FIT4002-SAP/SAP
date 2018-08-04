// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class IotserviceFactory {
    static func registerAll() throws {
        IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.registerFactory(ObjectFactory.with(create: { TIOT5272A0AA64CEC578F2F9Type(withDefaults: false) }, createWithDecoder: { d in try TIOT5272A0AA64CEC578F2F9Type(from: d) }))
        IotserviceStaticResolver.resolve()
    }
}
