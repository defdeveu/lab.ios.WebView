import Foundation
import XCTest
@testable import lab_ios_WebView

@MainActor
final class WebViewLabTests: XCTestCase {
    func testBothScenariosUseHTTPSPages() {
        XCTAssertEqual(FirstWebView.pageURL.scheme, "https")
        XCTAssertEqual(SecondWebView.pageURL.scheme, "https")
    }

    func testRepositoryUsesTheInjectedURLService() {
        let opener = RecordingURLOpener()
        let repository = AppRepository(urlOpener: opener)
        let url = URL(string: "https://example.com")!

        repository.urlOpener.open(url)

        XCTAssertEqual(opener.openedURLs, [url])
    }
}

@MainActor
private final class RecordingURLOpener: URLOpenerProtocol {
    private(set) var openedURLs: [URL] = []

    func open(_ url: URL) {
        openedURLs.append(url)
    }
}
