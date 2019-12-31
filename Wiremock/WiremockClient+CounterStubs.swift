import Foundation
import WiremockClient

@testable import Clicker

extension WiremockClient {
    public static func stubCountGetResponse(withCount count: Int) {
        let stubMapping = StubMapping.stubFor(
            requestMethod: .GET,
            urlMatchCondition: .urlEqualTo,
            url: "/counter")
            .willReturn(ResponseDefinition()
                .withStatus(200)
                .withBody(["count": count])
        )
        WiremockClient.postMapping(stubMapping: stubMapping)
    }

    public static func stubCountPostResponse() {
        let stubMapping = StubMapping.stubFor(requestMethod: .POST, urlMatchCondition: .urlEqualTo, url: "/counter")
            .willReturn(ResponseDefinition().withStatus(200))
        WiremockClient.postMapping(stubMapping: stubMapping)
    }
}
