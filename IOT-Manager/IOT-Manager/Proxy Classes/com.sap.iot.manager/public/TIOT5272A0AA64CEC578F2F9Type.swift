// # Proxy Compiler 18.3.2-b9f583-20180614

import Foundation
import SAPOData

open class TIOT5272A0AA64CEC578F2F9Type: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    public static var genId: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "GEN_ID")

    public static var gDevice: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "G_DEVICE")

    public static var gCreated: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "G_CREATED")

    public static var cTimestamp: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_TIMESTAMP")

    public static var cSensoraccx: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORACCX")

    public static var cSensoraccy: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORACCY")

    public static var cSensoraccz: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORACCZ")

    public static var cSensorbarometric: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORBAROMETRIC")

    public static var cSensorgyrox: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORGYROX")

    public static var cSensorgyroy: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORGYROY")

    public static var cSensorgyroz: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORGYROZ")

    public static var cSensorhumidity: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORHUMIDITY")

    public static var cSensormagx: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORMAGX")

    public static var cSensormagy: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORMAGY")

    public static var cSensormagz: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORMAGZ")

    public static var cSensorobjecttemp: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSOROBJECTTEMP")

    public static var cSensoroptical: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSOROPTICAL")

    public static var cSensortemp: Property = IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type.property(withName: "C_SENSORTEMP")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: IotserviceMetadata.EntityTypes.tIOT5272A0AA64CEC578F2F9Type)
    }

    open class func array(from: EntityValueList) -> Array<TIOT5272A0AA64CEC578F2F9Type> {
        return ArrayConverter.convert(from.toArray(), Array<TIOT5272A0AA64CEC578F2F9Type>())
    }

    open var cSensoraccx: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoraccx))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoraccx, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensoraccy: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoraccy))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoraccy, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensoraccz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoraccz))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoraccz, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorbarometric: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorbarometric))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorbarometric, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorgyrox: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorgyrox))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorgyrox, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorgyroy: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorgyroy))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorgyroy, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorgyroz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorgyroz))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorgyroz, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorhumidity: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorhumidity))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorhumidity, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensormagx: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensormagx))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensormagx, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensormagy: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensormagy))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensormagy, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensormagz: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensormagz))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensormagz, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensorobjecttemp: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorobjecttemp))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensorobjecttemp, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensoroptical: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoroptical))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensoroptical, to: DoubleValue.of(optional: value))
        }
    }

    open var cSensortemp: Double? {
        get {
            return DoubleValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensortemp))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cSensortemp, to: DoubleValue.of(optional: value))
        }
    }

    open var cTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.cTimestamp, to: value)
        }
    }

    open func copy() -> TIOT5272A0AA64CEC578F2F9Type {
        return CastRequired<TIOT5272A0AA64CEC578F2F9Type>.from(self.copyEntity())
    }

    open var gCreated: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.gCreated))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.gCreated, to: value)
        }
    }

    open var gDevice: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.gDevice))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.gDevice, to: StringValue.of(optional: value))
        }
    }

    open var genId: String? {
        get {
            return StringValue.optional(self.optionalValue(for: TIOT5272A0AA64CEC578F2F9Type.genId))
        }
        set(value) {
            self.setOptionalValue(for: TIOT5272A0AA64CEC578F2F9Type.genId, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(genId: String?) -> EntityKey {
        return EntityKey().with(name: "GEN_ID", value: StringValue.of(optional: genId))
    }

    open var old: TIOT5272A0AA64CEC578F2F9Type {
        return CastRequired<TIOT5272A0AA64CEC578F2F9Type>.from(self.oldEntity)
    }
}
