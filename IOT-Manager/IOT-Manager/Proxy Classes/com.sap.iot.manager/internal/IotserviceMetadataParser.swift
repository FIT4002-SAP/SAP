// # Proxy Compiler 17.12.4-8c3504-20180321

import Foundation
import SAPOData

internal class IotserviceMetadataParser {
    internal static let options: Int = (CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = IotserviceMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = IotserviceMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(IotserviceMetadataText.xml, url: "iotmmsxs.iotservice")
        metadata.proxyVersion = "17.12.4-8c3504-20180321"
        return metadata
    }
}
