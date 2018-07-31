// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class TIOTC7A508A0C7743CDDE705Type: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var genId: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "GEN_ID")

    public static var gDevice: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "G_DEVICE")

    public static var gCreated: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "G_CREATED")

    public static var cTimestamp: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_TIMESTAMP")

    public static var cSensorgyrox: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORGYROX")

    public static var cSensorgyroy: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORGYROY")

    public static var cSensorgyroz: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORGYROZ")

    public static var cSensoraccx: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORACCX")

    public static var cSensoraccy: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORACCY")

    public static var cSensoraccz: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORACCZ")

    public static var cSensorbarometric: Property = IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type.property(withName: "C_SENSORBAROMETRIC")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: IotserviceMetadata.EntityTypes.tIOTC7A508A0C7743CDDE705Type)
    }

    open class func array(from: EntityValueList) -> Array<TIOTC7A508A0C7743CDDE705Type> {
        return ArrayConverter.convert(from.toArray(), Array<TIOTC7A508A0C7743CDDE705Type>())
    }

    open var cSensoraccx: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensoraccx))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensoraccx, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensoraccy: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensoraccy))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensoraccy, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensoraccz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensoraccz))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensoraccz, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorbarometric: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorbarometric))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorbarometric, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorgyrox: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorgyrox))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorgyrox, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorgyroy: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorgyroy))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorgyroy, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorgyroz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorgyroz))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cSensorgyroz, to: DoubleValue.of(optional: value))
        }
    }

    open var cTimestamp: Int64? {
        get {
            return LongValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.cTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.cTimestamp, to: LongValue.of(optional: value))
        }
    }

    open func copy() -> TIOTC7A508A0C7743CDDE705Type {
        return CastRequired<TIOTC7A508A0C7743CDDE705Type>.from(self.copyEntity())
    }

    open var gCreated: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.gCreated))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.gCreated, to: value)
        }
    }

    open var gDevice: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.gDevice))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.gDevice, to: StringValue.of(optional: value))
        }
    }

    open var genId: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOTC7A508A0C7743CDDE705Type.genId))
        }
        set(value) {
            self.setOptionalValue(for: TIOTC7A508A0C7743CDDE705Type.genId, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(genId: String?) -> EntityKey {
        return EntityKey().with(name: "GEN_ID", value: StringValue.of(optional: genId))
    }

    open var old: TIOTC7A508A0C7743CDDE705Type {
        return CastRequired<TIOTC7A508A0C7743CDDE705Type>.from(self.oldEntity)
    }
}
