// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

open class Iotservice<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = IotserviceMetadata.document
    }

    open func fetchTIOTC7A508A0C7743CDDE705Type(matching query: DataQuery) throws -> TIOTC7A508A0C7743CDDE705Type {
        return try CastRequired<TIOTC7A508A0C7743CDDE705Type>.from(self.executeQuery(query.fromDefault(IotserviceMetadata.EntitySets.tIotC7a508a0c7743cdde705)).requiredEntity())
    }

    open func fetchTIOTC7A508A0C7743CDDE705Type(matching query: DataQuery, completionHandler: @escaping (TIOTC7A508A0C7743CDDE705Type?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: TIOTC7A508A0C7743CDDE705Type = try self.fetchTIOTC7A508A0C7743CDDE705Type(matching: query)
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

    open func fetchTIotC7a508a0c7743cdde705(matching query: DataQuery = DataQuery()) throws -> Array<TIOTC7A508A0C7743CDDE705Type> {
        return try TIOTC7A508A0C7743CDDE705Type.array(from: self.executeQuery(query.fromDefault(IotserviceMetadata.EntitySets.tIotC7a508a0c7743cdde705)).entityList())
    }

    open func fetchTIotC7a508a0c7743cdde705(matching query: DataQuery = DataQuery(), completionHandler: @escaping (Array<TIOTC7A508A0C7743CDDE705Type>?, Error?) -> Void) {
        self.addBackgroundOperation {
            do {
                let result: Array<TIOTC7A508A0C7743CDDE705Type> = try self.fetchTIotC7a508a0c7743cdde705(matching: query)
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

    @available(swift, deprecated: 4.0, renamed: "fetchTIotC7a508a0c7743cdde705")
    open func tIotC7a508a0c7743cdde705(query: DataQuery = DataQuery()) throws -> Array<TIOTC7A508A0C7743CDDE705Type> {
        return try self.fetchTIotC7a508a0c7743cdde705(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchTIotC7a508a0c7743cdde705")
    open func tIotC7a508a0c7743cdde705(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<TIOTC7A508A0C7743CDDE705Type>?, Error?) -> Void) {
        self.fetchTIotC7a508a0c7743cdde705(matching: query, completionHandler: completionHandler)
    }
}
