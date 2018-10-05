// # Proxy Compiler 18.3.2-b9f583-20180614

import Foundation
import SAPOData

open class TIOT35970B0909FFB71C3F4FType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var genId: Property = IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.property(withName: "GEN_ID")

    public static var gDevice: Property = IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.property(withName: "G_DEVICE")

    public static var gCreated: Property = IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.property(withName: "G_CREATED")

    public static var cTimestamp: Property = IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.property(withName: "C_TIMESTAMP")

    public static var cDescription: Property = IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.property(withName: "C_DESCRIPTION")

    public static var cIncidentCode: Property = IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType.property(withName: "C_INCIDENT_CODE")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: IotserviceMetadata.EntityTypes.tIOT35970B0909FFB71C3F4FType)
    }

    open class func array(from: EntityValueList) -> Array<TIOT35970B0909FFB71C3F4FType> {
        return ArrayConverter.convert(from.toArray(), Array<TIOT35970B0909FFB71C3F4FType>())
    }

    open var cDescription: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOT35970B0909FFB71C3F4FType.cDescription))
        }
        set(value) {
            self.setOptionalValue(for: TIOT35970B0909FFB71C3F4FType.cDescription, to: StringValue.of(optional: value))
        }
    }

    open var cIncidentCode: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOT35970B0909FFB71C3F4FType.cIncidentCode))
        }
        set(value) {
            self.setOptionalValue(for: TIOT35970B0909FFB71C3F4FType.cIncidentCode, to: StringValue.of(optional: value))
        }
    }

    open var cTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: TIOT35970B0909FFB71C3F4FType.cTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: TIOT35970B0909FFB71C3F4FType.cTimestamp, to: value)
        }
    }

    open func copy() -> TIOT35970B0909FFB71C3F4FType {
        return CastRequired<TIOT35970B0909FFB71C3F4FType>.from(self.copyEntity())
    }

    open var gCreated: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: TIOT35970B0909FFB71C3F4FType.gCreated))
        }
        set(value) {
            self.setOptionalValue(for: TIOT35970B0909FFB71C3F4FType.gCreated, to: value)
        }
    }

    open var gDevice: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOT35970B0909FFB71C3F4FType.gDevice))
        }
        set(value) {
            self.setOptionalValue(for: TIOT35970B0909FFB71C3F4FType.gDevice, to: StringValue.of(optional: value))
        }
    }

    open var genId: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOT35970B0909FFB71C3F4FType.genId))
        }
        set(value) {
            self.setOptionalValue(for: TIOT35970B0909FFB71C3F4FType.genId, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(genId: String?) -> EntityKey {
        return EntityKey().with(name: "GEN_ID", value: StringValue.of(optional: genId))
    }

    open var old: TIOT35970B0909FFB71C3F4FType {
        return CastRequired<TIOT35970B0909FFB71C3F4FType>.from(self.oldEntity)
    }
}
