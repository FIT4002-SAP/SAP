// # Proxy Compiler 18.3.2-b9f583-20180614

import Foundation
import SAPOData

open class Iotservice<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = IotserviceMetadata.document
    }

    open func fetchTIOT35970B0909FFB71C3F4FType(matching query: DataQuery) throws -> TIOT35970B0909FFB71C3F4FType {
        return try CastRequired<TIOT35970B0909FFB71C3F4FType>.from(self.executeQuery(query.fromDefault(IotserviceMetadata.EntitySets.tIot35970b0909ffb71c3f4f)).requiredEntity())
    }

    open func fetchTIOT35970B0909FFB71C3F4FType(matching query: DataQuery, completionHandler: @escaping (TIOT35970B0909FFB71C3F4FType?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: TIOT35970B0909FFB71C3F4FType = try self.fetchTIOT35970B0909FFB71C3F4FType(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTIOT5272A0AA64CEC578F2F9Type(matching query: DataQuery) throws -> TIOT5272A0AA64CEC578F2F9Type {
        return try CastRequired<TIOT5272A0AA64CEC578F2F9Type>.from(self.executeQuery(query.fromDefault(IotserviceMetadata.EntitySets.tIot5272a0aa64cec578f2f9)).requiredEntity())
    }

    open func fetchTIOT5272A0AA64CEC578F2F9Type(matching query: DataQuery, completionHandler: @escaping (TIOT5272A0AA64CEC578F2F9Type?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: TIOT5272A0AA64CEC578F2F9Type = try self.fetchTIOT5272A0AA64CEC578F2F9Type(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTIot35970b0909ffb71c3f4f(matching query: DataQuery = DataQuery()) throws -> Array<TIOT35970B0909FFB71C3F4FType> {
        return try TIOT35970B0909FFB71C3F4FType.array(from: self.executeQuery(query.fromDefault(IotserviceMetadata.EntitySets.tIot35970b0909ffb71c3f4f)).entityList())
    }

    open func fetchTIot35970b0909ffb71c3f4f(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<TIOT35970B0909FFB71C3F4FType>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<TIOT35970B0909FFB71C3F4FType> = try self.fetchTIot35970b0909ffb71c3f4f(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchTIot5272a0aa64cec578f2f9(matching query: DataQuery = DataQuery()) throws -> Array<TIOT5272A0AA64CEC578F2F9Type> {
        return try TIOT5272A0AA64CEC578F2F9Type.array(from: self.executeQuery(query.fromDefault(IotserviceMetadata.EntitySets.tIot5272a0aa64cec578f2f9)).entityList())
    }

    open func fetchTIot5272a0aa64cec578f2f9(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<TIOT5272A0AA64CEC578F2F9Type>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<TIOT5272A0AA64CEC578F2F9Type> = try self.fetchTIot5272a0aa64cec578f2f9(matching: query)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: IotserviceMetadataParser.options)
            IotserviceMetadataChanges.merge(metadata: self.metadata)
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTIot35970b0909ffb71c3f4f")
    open func tIot35970b0909ffb71c3f4f(query: DataQuery = DataQuery()) throws -> Array<TIOT35970B0909FFB71C3F4FType> {
        return try self.fetchTIot35970b0909ffb71c3f4f(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTIot35970b0909ffb71c3f4f")
    open func tIot35970b0909ffb71c3f4f(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<TIOT35970B0909FFB71C3F4FType>?, Error?) -> Void) {
        self.fetchTIot35970b0909ffb71c3f4f(matching: query, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTIot5272a0aa64cec578f2f9")
    open func tIot5272a0aa64cec578f2f9(query: DataQuery = DataQuery()) throws -> Array<TIOT5272A0AA64CEC578F2F9Type> {
        return try self.fetchTIot5272a0aa64cec578f2f9(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTIot5272a0aa64cec578f2f9")
    open func tIot5272a0aa64cec578f2f9(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<TIOT5272A0AA64CEC578F2F9Type>?, Error?) -> Void) {
        self.fetchTIot5272a0aa64cec578f2f9(matching: query, completionHandler: completionHandler)
    }
}
