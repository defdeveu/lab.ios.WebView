import Foundation
import Testing
@testable import lab_ios_WebView

@MainActor
@Suite
struct WebViewLabTests {
    @Test
    func bothScenariosUseHTTPSPages() {
        #expect(FirstWebView.pageURL.scheme == "https")
        #expect(SecondWebView.pageURL.scheme == "https")
    }

    @Test
    func repositoryUsesTheInjectedURLService() {
        let opener = RecordingURLOpener()
        let repository = AppRepository(urlOpener: opener)
        let url = URL(string: "https://example.com")!

        repository.urlOpener.open(url)

        #expect(opener.openedURLs == [url])
    }
}

@MainActor
private final class RecordingURLOpener: URLOpenerProtocol {
    private(set) var openedURLs: [URL] = []

    func open(_ url: URL) {
        openedURLs.append(url)
    }
}