// # Proxy Compiler 18.3.2-b9f583-20180614

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
        metadata.proxyVersion = "18.3.2-b9f583-20180614"
        return metadata
    }
}
