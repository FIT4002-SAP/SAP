// # Proxy Compiler 18.3.2-b9f583-20180614

import Foundation
import SAPOData

internal class IotserviceFactory {
    static func registerAll() throws {
        IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.registerFactory(ObjectFactory.with(create: { TIOT35970B0909FFB71C3F4FType(withDefaults: false) }, createWithDecoder: { d in try TIOT35970B0909FFB71C3F4FType(from: d) }))
        IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.registerFactory(ObjectFactory.with(create: { TIOT5272A0AA64CEC578F2F9Type(withDefaults: false) }, createWithDecoder: { d in try TIOT5272A0AA64CEC578F2F9Type(from: d) }))
        IotserviceStaticResolver.resolve()
    }
}
